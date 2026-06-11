Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B174CD98CE
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 14:21:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B43AC10EF63;
	Thu, 11 Jun 2026 14:21:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c4cgLznT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569B810EF69
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Jun 2026 14:21:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781187703; x=1812723703;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7FEubmuW8ZGpIyHayv8VyyTeH0uYklCMWyyoQp3/WYc=;
 b=c4cgLznTIptfknE8KfCwH4sGDgvYwZKyUQokF7T3PiGxjrQlhXWiAspj
 4dC7UAwimSgl4S1daNUc50wdfLqvCI1kVO9HoyqTD1ZdlvN9ENSGTiiBq
 i6DZQaYXVq8kKeGnd0rfU7bd/mrAof/Rh0PqjWhfWVhNrKqfxFGALDZeX
 ZR2lob8HK47e1kLm77J3bqwW2eieisJ6jDdcCYb3sOdWvr3iIIxfAayRJ
 QO8V9IB0ytmuM2/VyJeZxG8OLEyMboJ47ammW2LFcHOX5CtozMnCA4UZT
 9hr7a2Kp2qhV+RUJ7tX+pKIB3LzGtfphCCy+TG/Jg2d11CT9i4K7pfkYL w==;
X-CSE-ConnectionGUID: s9w9kOY6Tm+vNBn/KGe3nw==
X-CSE-MsgGUID: 4rtnWqTpSO+nxrOA+BEQ9w==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="92321457"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="92321457"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 07:21:43 -0700
X-CSE-ConnectionGUID: 8X2Zzl1nRT61iaBBDjJbHw==
X-CSE-MsgGUID: L27eXrDBRXqf+HBk3O+sOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; d="scan'208";a="244047662"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2026 07:21:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 07:21:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Thu, 11 Jun 2026 07:21:42 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.46) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Thu, 11 Jun 2026 07:21:42 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E7UK0qkU39sbaLrnOSVoGuQUYCdZieILCG3jbx+mIHtPApZ4jYPpeM1EPtIi/pYPeTP+pa1t2Ahx6V6JToBtGPmIiMUfLPpNqEQX6LZsaV/Lq5SPyaghbaz43YV41r49RBsgwGzcwPK4gaeEDIarDMJICvglBIkJIQlq9sad3H5m1puTb3wIr9FViIa3C21iuRKDMAVC3sSmkcDldezHO5PPMeBd71vL7WRnxJ1fxOjVgKQF/3UMAurqp/I0B/flS47n7j72FDsfax0D9wSmTtdB3ZsPrYZHGd9o6TFmVZICEyLGN0N3KpWCtMlOwdiDE87DPr8GFgf1OPNeBs7ZGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+yT0bEG0npJ5TXWWnw5UQgYOf8kLi5xsbnMfgd706M8=;
 b=LztvJb0mAY7qz0g73STlKsk7s+iEXYy90Dsc89cHdcsC71eu1co6CG3GyBAWrLTekFpePWT0d4jzZlCbmjXVlv7tDj7iziDYoDVBW9uvlzq+cbTL+jSaTFMHD3axZKTJxMlHvBcPf8m0hXdC7HJHvxIbxAGVcAUPbIsdjjMrHl7qLrrB1BB82BLFAQipJsvNItqjRppEa+eR7qyS7i52DTU0u+44GlYwlnrCCbTBlRq+ckGqS629RtKQtR97KtvGVfB5JCMtVCFSWXD2lYFkd8586eyjywMKVHj+6zIqZfThFz5x1gErreoObj2GHiC9uHyepoTPxWaYNi5s7w3N3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by BL3PR11MB6385.namprd11.prod.outlook.com (2603:10b6:208:3b5::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.13; Thu, 11 Jun
 2026 14:21:33 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%6]) with mapi id 15.21.0092.011; Thu, 11 Jun 2026
 14:21:32 +0000
Date: Thu, 11 Jun 2026 16:21:27 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Disable display in admin only PF mode
Message-ID: <20260611142127.v2ehvhyrpjtlpwyo@intel.com>
References: <20260611124206.3742717-1-satyanarayana.k.v.p@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260611124206.3742717-1-satyanarayana.k.v.p@intel.com>
X-ClientProxiedBy: DUZPR01CA0220.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b4::8) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|BL3PR11MB6385:EE_
X-MS-Office365-Filtering-Correlation-Id: 990184d5-d276-4f62-a932-08dec7c4bc91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|56012099006|11063799006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 9ItIeA1MCWS4VfqL53Y7YfQ0s2O7+IWMJBCJru5bnsuHeTKWciHjQSlcZQF3wdRpw2Wpj2Z1THrrP5i5UX7izFd8f9quO3Jfn3jRs16J2+oWZjGTyIyDpnGsIi0uM/ZGCBbCm10TroMRpaDiN2d5ifKNnP7dzQiE3Gu2+QuYprrV99txH2KKziS/CtY284D1CYepDnh+EojfQcUDOcgefYMqiICxcD3PhzDT31xinAwYqgOtfJ+jwyPLYzvpybzntpSv19UvjAlGXj46tFuDWE+KPCaPjn/G8ypCqpXaUTN45wAEDRd9ZJjnoiUlXSAWiGGRjTnCPR5sWVk19e6tcZYZ4Z6DRhgpb3zmZvEPpXkuDWUGcK2ZdBtGtyydxe82HSBCblgaJJH76PkP/lMkmsv101idDdNOq9JTtz9bLfaP9xwsbfn7XCeaUyxtNRIwG3jVZg3Kj+NT4mFLVu+eNYnzD5/QhMPcO2KynfpqNVoBrEK5+JXZrlCVNHwZfAA/q2+fw+mtwTz2O5nVaRIeuJ1a3XSKFlpMgeuSyXjYT568pgLjolSAf37KUfeSwylYUwlnNQda5bpFYzpXsZLUOEX2Zik/lfeqeBZZ+8QW26tUOtaQROW5UIjYOTj9tR3K1N061bokmCXdJ3cy3p3tBs2tPhE6I78EisfM6HfYWjduy7CELvS5vpk3nl+dJzb/
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(6133799003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Wm5paGdmS1RXZE55a2EvdFl0Um1kd3JaTThrU1lQMkFLbmRCcFhzOEN6NDQ2?=
 =?utf-8?B?bVA3dXV4UTJ6eWh2QXRHUnQwUTRtaGxkajZlTDlqZGpuNGRqc2dEanZ0VXRS?=
 =?utf-8?B?MlRnb1ZlazFvV2h1ZEJ3Uk51RGFRZHYxMDMxdFdIZ0JIbFNnRm8zdElmdkpO?=
 =?utf-8?B?bGtWem5FMEoremZ5L0VZZFI3dWVoTVQ3QVJ2Yk0yUGFYbnVFdDhoVmwxL1c3?=
 =?utf-8?B?VS9oT3hNOS9sZDlBUWdJUFV6NWh6ZHU4UHVmWjBWbE01cXk3ZDJ3ajN3WWpZ?=
 =?utf-8?B?Zmh0ZnV0UElQMHBxMDg0VHdXbzhndkZrZDJCMDBxbTNidmVDc0xuT0hYWVFH?=
 =?utf-8?B?b3cycjhLWTZkUjhOZWs5d1llSXdCMForbXpYdE1CaGxiU3JUWDhneG9yNFdl?=
 =?utf-8?B?VnRsSWtSRnU2UjFzWVltRzZpWDRSdW1kU2dDdUJSZndmc2ZJbTZSYkR4RCt5?=
 =?utf-8?B?MCttdlYvSTh2NExkTUZEQ0tQUlowWmVLTThPWElxVVVJWURXb1pJbDZGNk9X?=
 =?utf-8?B?S29FTS91bWVwbGQ5QWIzV2dyUVpSYktlTGJ4bUtGN2U5OFVreW5rTHBtQnIz?=
 =?utf-8?B?SHhscDhsTlNvMm40UU5sMHo3eDZLT1FjUHVUZ0FEZ2xBQzJTY3gyQ3BpeXV1?=
 =?utf-8?B?dUs1MDkybXlKVy9lTzJnb0xwc2VIVDBrWUMwQmtmTEFmTnR1aWdqRGxyeUpR?=
 =?utf-8?B?SkIxWk9HRTQ0WEM4by9WUFV4Mlh5eVhkZ2Q3OTFvQ0k5RlF1VDBtcWs2TnRC?=
 =?utf-8?B?NXdBaERUMjFZeWZHMlQyZk5LeFFyNkgyTXdOY2JwZGVtT1RkcURMM1oycUhN?=
 =?utf-8?B?OUh2UnBVcDZGdmt2TjhTWjdIR3RGVEwwSzRJNFJ0cTlZU2ZMQ3pPRjAxWEpE?=
 =?utf-8?B?dzR4eW9BRDZCYTdUK2pBNEpTdzRERnN4ZVlzc0gyeEh1V0VvUE83REZxdVhv?=
 =?utf-8?B?ZUlDKzNGdzNTQVdpSDRtc3o2dEF5NE9wTjA5cGJnTFJaVi9SaURHU29wVFdI?=
 =?utf-8?B?VFVrcVdPbjlpcDRUREl3N3NMZzVNakQ3QkFjc01YblptVjltS2NWb202QmQw?=
 =?utf-8?B?b0tpU1Vvazh4MWY2bTJ6RTh3WGhxZHdzdkJORXZzS1QwbjJ4dE1nWkpaVFRQ?=
 =?utf-8?B?YTRGVFRNd3pBck9WYW5mVW9EbThjVEx5N3I1a0hwODRWeStmbnJjU3ZHVnpx?=
 =?utf-8?B?WXJZY2NmSU54U3ZhenRzSytpSnBaY1llWUhId0pJRjd2TVVZUlRaeG1ZWDJM?=
 =?utf-8?B?RzFIMk5qWm16NHBlajdiZm81M1FWdU4xenZHVGVnMFZIcTRMOHVDMEZmbnNL?=
 =?utf-8?B?MTNnQlM0NDJDM0xpSG1rbmF1MVlqQ1IxUkdFNHVYRHJkMjRzeDlvNHc2N1pr?=
 =?utf-8?B?azdXRUtsR1BQTmtpcU9JdFdHclRvOTBiTnRlSG1xb2MzbzU5YWdyVkgwSkdE?=
 =?utf-8?B?eXRycFJ5WW9rYStMbElMTUVUQ28xalJkZ0l0cEo5TUJHRi8xK1lFQ2loMzFD?=
 =?utf-8?B?bEZDbkV1blNvZ0Y5TGovR2FFUlBzTTg2TWxnZDdTcTc1QzNZb0RaRksvUFlU?=
 =?utf-8?B?Q1Y2YjlJTW5tSG8xdi9pZnF3dTlJWTN6dU5qWkVsdXE3dTRPN3NLQlUraXY2?=
 =?utf-8?B?cnhUMVpjZnlTUGVOdzZPRE9DOWFUTnFNZWswcHBsa2x0TG5PdTlUZHQwYnB3?=
 =?utf-8?B?RlNSWGh1aE5rTGpTNi9ZVW1YcTBpcVY1MHNoMGZ4aWg4WFdXRzk1QzlaSzdp?=
 =?utf-8?B?NWdjOUp0R1dONTJnenNUYUh4UlhzSHhuZ2VJK3N6WWcrRGsxaFJ4TlM0ZmxF?=
 =?utf-8?B?T3RacjNYWkcxcWV0Um45ZThSWDBVdGdCcXNINndkOXc5K0dDZGkrV21IT0V3?=
 =?utf-8?B?WFFCT0ZuNHgxUTBwQ2xmQzV2WWtvQ1grUjJ2TEcveVBVYUFPUVlOMFdsbUdn?=
 =?utf-8?B?d3NEenVIS1JTWk12bE5qSDEyUHMxN3ZublZkMytuL1libU85YjlzcW1VZktB?=
 =?utf-8?B?bm9UVzlTOEZ6N0p5TVdYRUJSZUczS0tSTkZZMGtINFZmaUdHam9TSG1Relo2?=
 =?utf-8?B?UGFuRGw1V3NXQ2tleFJzQWozcnhCczk0MThOelJLeWR6ZnFjbW9uTkw5L1Iz?=
 =?utf-8?B?aXNXUVBUVndwc1NRY0JGTk1FUDduZHEvYlVEbHpSZFNSZm1LTmptZDFEL1JN?=
 =?utf-8?B?c0s3NlRtR1FRTWY2ZU1PNkZoMXZpVk9mR0xxUVU4T2lHQ2hIdjAxQ0dWTEor?=
 =?utf-8?B?dW5IWm0rSktGQ3FUNEtMOFV4U0JscnNHVThFaWJueG5LL1B2SFE5QjYyM25v?=
 =?utf-8?B?U0xqLzYxWU9rY1NwaEd5Y2NhQnFNMzBXeFNKVnNYWWdPbXQrNEN5OHB5OXlt?=
 =?utf-8?Q?mEDCECRNict/vyW4=3D?=
X-Exchange-RoutingPolicyChecked: IbfXlgVTNG6t+1fvY5ihRqc6zoheQS2mnXtAZ4JFZtUminyWIzYC60TPGor5t/TWH0DrcYSn74I6EQGiYaCUc2+xX7Kie7EBH/aF9PVKUoBfrL9RM8gv46lbYAHfAqwXdWLZcQA0O/KA4Uo7O0rrNsoUGMwowUU8lVI+HmPwk42Ihfhvm5rsHkrY/d3iXu6mWY9XngvyaBojz2yH+7dfIkpkwgnIAmlSQfy8UJFF5l3ZlnPiJmgMY93twaWOCPDV9LdA/xffMJBlkK2Rz6M70FayKgjuVb4mDodYvtiYmRKqXlZ+sAraD6dRxbGhFM4RYDxK8OmTQblGQ6rfHr6/tw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 990184d5-d276-4f62-a932-08dec7c4bc91
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2026 14:21:32.6252 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7RcjcbAqe4ITc41+PPr33HUrCQ1452nCCEwqmf5BmfZg5liEJiT7g+nJe1s+pRqxlKOBJCaxXBQd0xNYbSy6d2Wr3sgZdTS6kZA4PqIyr2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6385
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Satyanarayana K V P <satyanarayana.k.v.p@intel.com> wrote on czw [2026-cze-11 12:42:06 +0000]:
> Admin-only PF mode does not expose media or 3D execution capabilities
> to userspace, so display pipelines cannot receive rendered content.
> 
> Fixes: d88c4bac8c2a ("drm/xe/pf: Restrict device query responses in admin-only PF mode")
> 
> Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> Cc: Michał Winiarski <michal.winiarski@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c | 2 --
>  drivers/gpu/drm/xe/xe_pci.c    | 4 +++-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 51e3a2dd7b22..9c02e0e314c7 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -426,7 +426,6 @@ static const struct drm_ioctl_desc xe_ioctls_admin_only[] = {
>  
>  static const struct drm_driver admin_only_driver = {
>  	.driver_features =
> -	    XE_DISPLAY_DRIVER_FEATURES |
>  	    DRIVER_GEM | DRIVER_RENDER,
>  	.open = xe_file_open,
>  	.postclose = xe_file_close,
> @@ -438,7 +437,6 @@ static const struct drm_driver admin_only_driver = {
>  	.major = DRIVER_MAJOR,
>  	.minor = DRIVER_MINOR,
>  	.patchlevel = DRIVER_PATCHLEVEL,
> -	XE_DISPLAY_DRIVER_OPS,
>  };
>  
>  /**
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index 78fc2e4dcfc6..6fd882443fa5 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -789,7 +789,9 @@ static int xe_info_init_early(struct xe_device *xe,
>  
>  	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>  				 xe_modparam.probe_display &&
> -				 desc->has_display;
> +				 desc->has_display &&
> +				 !xe_device_is_admin_only(xe);
> +
>  	xe->info.force_execlist = xe_modparam.force_execlist;
>  
>  	xe_assert(xe, desc->max_gt_per_tile > 0);
> -- 
> 2.43.0
> 

LGTM: Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>


-- 
