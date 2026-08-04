Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD63FC55184
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 15:03:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6620A10EABE;
	Tue,  4 Aug 2026 15:03:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WmUVhvIF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6770510EABE
 for <intel-xe@lists.freedesktop.org>; Tue,  4 Aug 2026 15:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1785855788; x=1817391788;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=MCP8plz/dvQgy6jS72o/voO2QpyQA9gyyIEExwUvIqg=;
 b=WmUVhvIF/p555GEwh2hqe6lgA8FEkNCx8B7sOD7L1/pbmth8EFYr8XxD
 D8RkvK1hN7HYqva2/9oNseZuxo6rhKjIqjbv9e7NjXAx5Q4U/A5nwmQwr
 IuCzlV8eyQUl0IQDK2yedSKlFyh/inknYpj/g1OJfVq+gRf6uAD7+bjch
 u3fgDZXtIHP6NG+zI1TJkL0dSdDD6Jayc7jZTqpCSwqy9S/8FFEcSp706
 sd9A2fOXIPLkVDvsNIkgCEQiXGoRCbTjjDSQmcIADNAS3NpSDHOybuQ/i
 cgTH0Q/jT3xFzeq12+lvcdudGQv4pcYON+LevLDAikRn23LGMFUwxr9za w==;
X-CSE-ConnectionGUID: 6R0CkxBHQmedA7dFGJDC+Q==
X-CSE-MsgGUID: Mz+Ww0bCS966JFnYHDs7uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11864"; a="86284725"
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="86284725"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 08:03:07 -0700
X-CSE-ConnectionGUID: 2xSplu9yQqaZre08aSD9lg==
X-CSE-MsgGUID: QsZvLDQ6TWmsYS6qwOFrgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,204,1779174000"; d="scan'208";a="258862479"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2026 08:01:04 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 08:01:03 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 08:01:03 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.66) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 08:01:03 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h8M5wSIrliibHLSXMlplV5BNB2PtJtpAmG8MrEthYewgbfjGEoYX8ptULXz4WzLKYRoken9kNigEdi77vC2yOwIx02UPEa2PIDbXwYk3qu+tpDWGAYJOoyId2co8Xwp6Zo+zgywZW7YGimiTz44Xxet80Gou8WbvnYPadNdnxJsgBp3SLU48cqK/IaxeCfXgdmqLb4/+0Gqa47zkHYOQbyPB+cJ2S1wdunE/QGl6xPkNf1GxWy7hVdrlgjvmx9mwrlA3mASsE3nrqR6Fx/h0rFV+mJQh018Uyb7GALwS2xwebJdn60VwjvTlm4rRks4eUH+z4UwR97Yv1UX87OoS/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1R+8kLhGgdylg9bpsQHyuMXrF0jsBCWWbr22OcvXT5E=;
 b=uhERp/PQ225SpDbcPAXa/oQpfB+bFbyvEAVHbB1M4L6JNnKbRevtlzy/jC5/Hi5gI+/cYLF0ALowFGK4IIJes3QoR5R6DvjzpAMjMrXR07etBNt+LQ4Hq6MHBTrDTTJYERPiOtuCNzfK7TnKfAeBQMyn7IB7lmYZoKl2Pgu4ffjBA9nzBZNd2iBVcD/Ax5gPdqgJ4PS6ofAemBEohEVbmtUbdIRMcbbljfSL8CqQpo0Kj9K8er3I8UjP2710MlRBMdwIEmVJUtOb5teD0IhdmKy7n+i1xlLbUnbUHwEIm7U85fXdnfJSZK8lU8ufGfTPSbsNEG/Shy1JlCoBFr/AzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 CY8PR11MB7012.namprd11.prod.outlook.com (2603:10b6:930:54::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.15; Tue, 4 Aug 2026 15:00:58 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 15:00:57 +0000
Message-ID: <ef2906e3-1070-4de3-9de0-ed651fc7cc82@intel.com>
Date: Tue, 4 Aug 2026 20:30:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 02/23] drm/xe/log: Add structured SIGID error logging
 infrastructure
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>, Mallesh Koujalagi
 <mallesh.koujalagi@intel.com>, Aravind Iddamsetty
 <aravind.iddamsetty@intel.com>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Yoni Levitt
 <yoni.levitt@intel.com>, Raag Jadav <raag.jadav@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-3-michal.wajdeczko@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <20260730152121.576-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0167.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::15) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|CY8PR11MB7012:EE_
X-MS-Office365-Filtering-Correlation-Id: 75cf7466-7d0d-413e-e05c-08def23930af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|3023799007|18002099003|22082099003|4143699003|5023799004|11063799006|56012099006|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: ctlUTkmoLCs4QIg+8Vcf2AXxOYka0vIw0OyVNEgvhN9ETqhzNO2TCxnuD+OSe62GTfuIUucfRrzr/20s6mm2pJ+paBhzooG/6vhdtkG1GseC4pRjmunxPdEEuQabmIDXSyU3/6MB3rVt6DwjzZoca6GcErRiA3p5vfZc+qnUBnwkubdQ7Br8tqRwAEgNEWh/hbdxv9lx2fLXWTEslkxQI+xyEUOoufz7Oyl/tilBLIXV4qvTP0e2aYpjmZ5frjbcXEV2zwdEnz+8xZgyR2JiZoh2l4x4i9EeCLhTv4a9D7Qnpxq4KCdLMmWNDI5PDmupi0JsG1QyTgh7zW/I2BFFHxrig61Gt2WrKtwR+xC1pwxF634lEsZWcHbQCp6lvPeZ3CrYHfWf8Wcw36XWfxuNTSeb5R0XTS5eU+nEUgvuJxCkSCbo09ctrq5TfRWSc4MNjEaWO2fetRchLYRrBCJ5PohTpnLy2GMCt9IfbyEPaDLdaeB9+ZZr90va5C6j67TqKyAIOiwEER75jCURm3keL21RreyGiKMA38S0ufoxAhdx8BvdWD+jaoWY2n2flpJk4ZlSijBINW/Ic5T48lTr3iFAF9+vnigtjZZd9gYqAvCCvC40BvDqlPEj1NLlsMnswE79zVATz/vfKU+s5MzvoGbZhxUFgJiXmR1IhZp7Rh8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(3023799007)(18002099003)(22082099003)(4143699003)(5023799004)(11063799006)(56012099006)(6133799003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZG1Zd24yMXJ2eWxZQ0VjTmhQa1laQnh1YVE5R3VmL0VZWVQrSXphZHBCNlBi?=
 =?utf-8?B?SjNaK3pFcWdMVzMxdldVTWplVTUwZDBtZ2kreTlBYTl2R1B4UEgvelEyenkx?=
 =?utf-8?B?Tkp6K28xdFN1WisvWGszV1NPeU5CYk13U20wUGNOMEtsbWhJMDhuTUtBTW9R?=
 =?utf-8?B?MTJSY2tqaGdTZDdlTGJDTEx5bUVGL0FHbFpleDZYa2tBVjJoc2U5RnhQNzR0?=
 =?utf-8?B?dk52VTNwTmh3bHBKQUZkVUdaZ0ZhWTdCbk9nbHgvdlJIbFFKdHpoQ0Y5WDVa?=
 =?utf-8?B?UG1aZy9wRG5QSHI3UmdYYmxMMmNWbHVVbGUrdDExRUlhc1NKVDJqL3djVy8x?=
 =?utf-8?B?dEYxZ01aZXZuL2xkYXBmMU5QWk5ZYmpEL0ttNHZGY3ZSeEVIRUJxRFZlclRh?=
 =?utf-8?B?ckJ0RzFRNzNFRHJITCtXeU5DTk5ISWVBbGExdFRLRi9ZZzFqOFMvMkxRZlFs?=
 =?utf-8?B?UytOd3ZaOUVJTUswbG1tcFdiakRQVDFtTWtZaGduZ0kwejhLM2JlU2F0YnQy?=
 =?utf-8?B?bUthQnhLOE5SN1diU01KU2lBdzBnOXdLNDR6ajdwY0NwdVhWZTJ1bk9pWWpC?=
 =?utf-8?B?R3RHV2o1cU1uYVBFV2ZyN0hjMnBBRnkzcktJcGFsNEVrdEZ6MWdXSFFraUVi?=
 =?utf-8?B?d2JUam85c0s1NnhGOUxROHNHdjFibVZCNnB2SURuNWg2SHBXWW5OeEtYaDFZ?=
 =?utf-8?B?MDdNMkxEL09JWXI3YVhiR0ZTdXR3RlA0TkRUNEZ1QjExQ3grTWpiRk41cTYv?=
 =?utf-8?B?WXZHNE5EMkJrMjFleU5CY0k0VEo1UGlXR2ovazFnTGhEbytxRjMyeUgyRmtX?=
 =?utf-8?B?VHJNb004c2tGSEpHUHpSS1hRakNwallHOHFMUUM3amlGU3dEb2dSWW9rdFJo?=
 =?utf-8?B?UHZhemdtUEM2Q04rWDZxV05nb3BtSURXMDNyeWtkbFhXMS9CdVl6R0psaFlm?=
 =?utf-8?B?YlBYUmdrYUpXcSswNzZEdldGaUpOc1BHclZOMVNyR2o2VngrOUVpR0xmdEJ6?=
 =?utf-8?B?Wm5LTHdyTlNhRXVtU3gzY3dlNkFOMUZReEJPanRUQ0VRRy9jUDJDNGtwWEl2?=
 =?utf-8?B?MExxQ2JvK21JeEJ4d2dwSDU4b29mcGVqTjJ3VU5weERqNzJvN0RXL3I2MERi?=
 =?utf-8?B?akJBQlp0ejV6OERGYUVLcis1ZnRHQWpiSnJ5RFU5dGs5cC92Y3FVVWhwWUta?=
 =?utf-8?B?djdyRGJWUW0rNlBCbkMrMGhLNkcvcFVlR2lIOTByK1pnSldqdjVmOUpOYVhu?=
 =?utf-8?B?ZUdtRlcvaVNud2JjTmhMU0RJT1BpOUdVbWo4MUJxMjVnYU50aElHUHczc0tP?=
 =?utf-8?B?ZU9GYjhQcGtGQjZMYnA5c1lMVFM3LzFHN0pleFN3S2M2QmJkSDNkeWJRQ3JZ?=
 =?utf-8?B?akdIUmZhL250OWV6ZVJqZVRNZUZmWjhvVlhtZWlPRUZuclRaNVVpSXhlbDgz?=
 =?utf-8?B?QjlGd3R0ZnVBQitKRUFmU1psWk5NVUtQV2NQWmpwbzYvQ1VwVzNDMHk0Rm5j?=
 =?utf-8?B?TFNjcXlBa3c0T1RERXRyZlNnODJMb0cySWI0ZUNQWTBBYW10SVRaakJ3b1p0?=
 =?utf-8?B?ZU04VEs3Y2hVS0NSUTMwMDdyMnBNT3haTHowcFZqUGs5SjBieEwwN3ZsSTBM?=
 =?utf-8?B?NjY1QXI4ZE9BRkR6M0pPczFOOTFYY05aVTB0Vzd3V3NvcW5TWjJBeEZGclVx?=
 =?utf-8?B?NS9EQ1RsYW9LL3BqOWtGVnY3c3g3YUt1UEV3MzJPZ0RZRkdQSXF5TUY3S1lF?=
 =?utf-8?B?dFNZUzNHb0pBOU1FRHhDcXlyanVxK0tHQjlkSDI5aHZBaEVFMVoyc1M1dlZH?=
 =?utf-8?B?eGIzbVBRWUFhd1BZSHRuN3JZRzhlendnaFRLV25PdGZlSXNoQjJwb1l6Y0dF?=
 =?utf-8?B?UEhIUHRQQmVxdmtBUVZldVdxbGxnbnFhT3JBQmJBMnNJYWFaS0J1WDZXczBs?=
 =?utf-8?B?akptNm9XVisxNUp5Q1U2c1lOeUhWL25Gc0huQmFjTWdlZzFwdGdzMTJoYzd4?=
 =?utf-8?B?Qit1RnBoQ1FYOWJaTnlZNkNtUmh5U1hkTnRDK0FqZExlcXpSWUFDN3dUN2ZB?=
 =?utf-8?B?UFMzVXU0cSsxek9DeGFKS3lhQ0cvOTJ2UmxjSjlFTkE4ZEp5NDRIZHdNZXA4?=
 =?utf-8?B?R3k5NWdieTVlMytFL3dKdnhVZ1lsUXdQNkM4ZFpKaHpFS0QwMi9OTlNEVTRp?=
 =?utf-8?B?SldSZXZFOXdjQ0FyOWdUYU85NHo3Q0pQQXVmQ3ZkQmpSeWg1aGdUZjdFZzdq?=
 =?utf-8?B?dDcyQ0VMNWdOY2ZuYklwOW5VY3E4aEczWkhOOExXdHZucWFCSUFNVzZOV3RR?=
 =?utf-8?B?R1Z4dGg2NWUrZWUwajdzRXVEWXdhY2RSSkJBRDA2b2FrRUw5aDUwZz09?=
X-Exchange-RoutingPolicyChecked: saKq1MNlzRxFR/DrpQhkDL2EqRDXHMsNazKxST9FATDCwRjsDDelwzZlwbC4R1UuOJqB9vH1SJLjQCcO93vSRh3qIBsJj3wIzTNSX0cdnntt9nvXKBviNA2AE4lW1bI6NYfLS1+CepojGyMzKCX49Uv2wLZE4urNS1nClBoUuQqnUm0iMZHrH9lgLDCye0bxUjWr2pkQzmIX0pLFixtxkHBWbTakQhJEgIWe5rRo8sy52eAK9EkQYQwTGSLkGjMH9nDsTgipBvm+N8G1qVSXxkUAUGlDr35UYr19MT+tihdRdKl28HQfNg6HDtQZVpFTIoLFgfO+Lq2IlE9YQ6s4rA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 75cf7466-7d0d-413e-e05c-08def23930af
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 15:00:57.8536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FDx6SGS894DhORmGFjuMGnrILJyYQNzI7Q5jZIsXXdmyrvfv/XpjQDnl2MlH6Je/m78JW6mYXguyckwM4Bbgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7012
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

Hi Mallesh/Michal

On 30-07-2026 20:50, Michal Wajdeczko wrote:
> From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>
> Today the driver reports faults with ad-hoc drm_err()/xe_gt_err()
> strings that have no stable shape. That is readable for a human, but it
> gives fleet tooling nothing durable to match on: the wording changes
> between releases, lines can be rate-limited or dropped under an error
> storm, and there is no consistent way to ask "which recognised fault
> just happened?".
>
> Introduce a signature identifier (SIGID): a small, stable integer that
> names one recognised Xe fault situation and serves as the primary handle
> for triage. A SIGID maps, through published end-user documentation, to a
> description and a recommended action; the driver only has to emit the
> right SIGID next to the usual human-readable text.
>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> Assisted-by: Copilot:Opus-4.8
> Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Co-developed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> Cc: Yoni Levitt <yoni.levitt@intel.com>
> Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> Cc: Raag Jadav <raag.jadav@intel.com>
> Cc: Riana Tauro <riana.tauro@intel.com>
> ---
> v2: CORRECTED is still an error (Michal)
>      prepare to decorate dmesg with comp/loc (Michal)
> ---
>   Documentation/gpu/xe/index.rst        |   1 +
>   Documentation/gpu/xe/xe_sigid.rst     |  14 ++
>   drivers/gpu/drm/xe/Makefile           |   1 +
>   drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 183 ++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_log.c           | 135 +++++++++++++++++++
>   drivers/gpu/drm/xe/xe_log.h           |  20 +++
>   6 files changed, 354 insertions(+)
>   create mode 100644 Documentation/gpu/xe/xe_sigid.rst
>   create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
>   create mode 100644 drivers/gpu/drm/xe/xe_log.c
>   create mode 100644 drivers/gpu/drm/xe/xe_log.h
>
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 665c0e93601c..0247a255f7e6 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for drm/xe is provided by
>      xe-drm-usage-stats.rst
>      xe_configfs
>      xe_gt_stats
> +   xe_sigid
> diff --git a/Documentation/gpu/xe/xe_sigid.rst b/Documentation/gpu/xe/xe_sigid.rst
> new file mode 100644
> index 000000000000..45d84a62f185
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_sigid.rst
> @@ -0,0 +1,14 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +========
> +Xe SIGID
> +========
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> +   :doc: Xe Error Signatures (SIGID)
> +
> +Signature Identifiers
> +=====================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> +   :internal:
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index 67ada1d6c2fb..7ac3954737f9 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
>   	xe_hw_fence.o \
>   	xe_irq.o \
>   	xe_late_bind_fw.o \
> +	xe_log.o \
>   	xe_lrc.o \
>   	xe_mem_pool.o \
>   	xe_migrate.o \
> diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> new file mode 100644
> index 000000000000..99717fdf74a6
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> @@ -0,0 +1,183 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _ABI_XE_SIGID_ABI_H_
> +#define _ABI_XE_SIGID_ABI_H_
> +
> +/**
> + * DOC: Xe Error Signatures (SIGID)
> + *
> + * What SIGID stands for
> + * ---------------------
> + *
> + * SIGID is short for *Signature Identifier*. A SIGID is a small, stable integer
> + * that names one *recognised Xe fault situation* -- nothing more. It is the
> + * primary handle used for triage: a SIGID maps to a human description and a
The SIG ID maps to a report site as mentioned in "How to pick a sigid" 
not a human description.

> + * recommended first action. A coarse first-order action is documented in-tree
> + * per SIGID (see "First-order action" below) so the id is actionable on its
> + * own; published end-user documentation refines it with finer, cross-product
> + * detail. The driver's only job is to emit the right SIGID next to the usual
> + * human-readable text.
> + *
> + * Why this exists
> + * ---------------
> + *
> + * Today the driver reports faults with ad-hoc ``drm_err()`` / ``xe_gt_err()``
> + * strings that have no stable shape. That is fine for a human reading dmesg,
> + * but it gives fleet tooling nothing durable to match on: the wording changes
> + * between releases, lines can be rate-limited or dropped under an error storm,
> + * and there is no consistent way to ask "which recognised fault just happened?"
> + * A SIGID answers exactly that one question, identically across driver and
> + * firmware versions, and (eventually) across other Intel devices in a node.
> + *
> + * What a SIGID is (and is not)
> + * ----------------------------
> + *
> + * A SIGID names *which situation* is being reported. It deliberately does not
This should also be consistent with "report site" instead of situation.
> + * encode the detailed reason or the outcome. Those are carried alongside it::
> + *
> + *   SIGID    -> which recognised situation is being reported
> + *   severity -> how serious this instance is (see below -- not fixed per SIGID)
> + *   errno    -> the failing operation's error, shown with %pe
> + *   message  -> free-form human-readable context
> + *
> + * Severity is independent of the SIGID. The same situation can be reported at
> + * different severities depending on the instance and the recovery taken, so a
> + * SIGID is never tied to one severity; the reporting site chooses it by calling
> + * the matching xe_log_*() helper (see xe_log.h).
> + *

It'd be more intuitive for readers if section "When to use SIGID 
logging" is moved before how to pick one.
> + * How to pick a SIGID (the uniqueness rule)
> + * -----------------------------------------
> + *
> + * Pick per *report site*, not per incident. Each site emits the single most
> + * specific recognised situation *for that site* -- so the question is never
> + * "classify this whole failure", it is "what does this site detect?", which has
> + * one answer. A single underlying failure therefore legitimately produces a
> + * *chain* of reports from different layers, each with its own SIGID -- e.g. a
> + * GuC communication failure is reported as %XE_SIGID_RUNTIME_FW by the firmware
> + * path, the failed recovery as %XE_SIGID_GT_TDR by the reset path, and an
> + * aborted bind as %XE_SIGID_PROBE by the probe path. That chain lets triage
> + * follow a fault from origin to final effect; it is not a duplicate.
> + *
> + * If a site does not match any defined situation, keep using the ordinary
> + * ``xe_err()`` / ``xe_gt_err()`` logging rather than forcing a SIGID: a wrong
> + * or over-broad classification is harder to retire than a missing one. When a
> + * new situation is genuinely worth triaging, add it to the list below.
> + *
> + * Scope: software-emitted signatures only
> + * ---------------------------------------
> + *
> + * This header enumerates only the situations that the *driver itself* detects
> + * and reports from software: probe abort, wedged, survivability, driver-
> + * detected firmware failures, engine TDR, memory faults and IO/bus faults.
> + * These are the only values the driver assigns.
> + *
> + * Signatures that *originate* in firmware or hardware are a different thing:
> + * they are produced and identified by the firmware or the hardware itself
> + * (e.g. via their own records or error counters), and the driver merely logs
> + * them as they are given to us. They are deliberately *not* enumerated here --
> + * minting a driver-side id for a firmware/hardware-reported error would only
> + * duplicate an identifier the reporting layer already owns. The two
> + * driver-detected firmware situations below (%XE_SIGID_RUNTIME_FW,
> + * %XE_SIGID_DEVICE_FW) are software signatures: they mark that *the driver*
> + * observed a firmware problem, not a signature reported by the firmware.
> + *
> + * Numbering
> + * ---------

This section also needs to be on the top. It can be missed if it is at 
the bottom of the document.

> + *
> + * SIGIDs are a single flat list numbered sequentially within the assigned range,
> + * in the order the situations were introduced. Values are stable: once assigned
> + * they are only ever appended, never renumbered or reused.
> + *
> + * A retired situation is deprecated in place, never re-purposed.
> + *
> + * First-order action (resolution buckets)
> + * ---------------------------------------
> + *
> + * So that a SIGID is actionable on its own, each one is tagged with a coarse
> + * *resolution bucket*: the first thing an operator should do on seeing it. The
> + * bucket is a stable, driver-owned hint; external documentation may refine it,
> + * but the in-tree value always stands on its own. Every new SIGID must pick a
> + * bucket, which forces the question "what should someone do about this?" to be
> + * answered up front. The buckets are::
> + *
> + *   COLLECT  -- capture logs and open a bug report
> + *   RETRY    -- transient or already recovered; watch for recurrence
> + *   UPDATE   -- a firmware update / flash is required
> + *   RECOVER  -- an explicit recovery step is needed (rebind, bus reset)


Do we actually need resolution buckets defined here? RECOVER or UPDATE 
seem a bit vague since states like
  WEDGED/SURVIVABILITY have different ways to recover depending on 
context. Wouldn't detailed resolution steps in another
document be better than in logs?

> + *   IGNORE   -- ignore if the SIGID severity is INFORMATIONAL
> + *
> + * The bucket is documentation only -- it is recorded per SIGID in the enum
> + * kernel-doc below and is not printed on the (deliberately lean) dmesg line.
> + *
> + * When to use SIGID logging
> + * -------------------------
> + *
> + * The xe_log_*() helpers are for these recognised fault situations only --
> + * important, operator-relevant faults and events. They are not a replacement
> + * for ``xe_info()`` / ``xe_dbg()`` / tracing, nor for one-off diagnostics;
> + * using them for ordinary logging would dilute the fault stream. Not every
> + * ``xe_err()`` needs to become a SIGID report -- only those that correspond to
> + * a published situation.
> + *
> + * dmesg vs. the machine record
> + * ----------------------------
> + *
> + * The dmesg line stays close to a normal xe error message so it remains
> + * readable for admins; the only stable, machine-matchable token on it is
> + * ``SIGID=<n>`` (``dmesg | grep SIGID=``). dmesg is not an ABI: the surrounding
> + * text may change freely, and lines may be dropped. The durable record for
> + * tooling is the CPER record carrying the same SIGID (generation is a planned
> + * follow-up).
> + */
> +
> +/*
> + * Top level Intel Error Signature Identifiers.
> + */
> +#define INTEL_SIGID_INVALID			0
> +#define INTEL_SIGID_GPU_START			100

why does the sigid start from 100?

> +#define INTEL_SIGID_GPU_END			999
> +
> +#define INTEL_SIGID_GPU_XE_START		100
> +#define INTEL_SIGID_GPU_XE_END			299
> +
> +#define INTEL_SIGID_GPU_XE_SOFTWARE_START	100
> +#define INTEL_SIGID_GPU_XE_SOFTWARE_END		199
> +#define INTEL_SIGID_GPU_XE_HARDWARE_START	200
> +#define INTEL_SIGID_GPU_XE_HARDWARE_END		299
> +
> +/**
> + * enum xe_sigid - Stable Xe Error Signature Identifiers (SIGID).
> + * @XE_SIGID_SW: Software component failure. [COLLECT]
> + * @XE_SIGID_PROBE: Device probe/bind was aborted. [COLLECT]
> + * @XE_SIGID_WEDGED: Device was declared wedged and is no longer usable. [RECOVER]
> + * @XE_SIGID_SURVIVABILITY: Device entered survivability mode. [UPDATE]
> + * @XE_SIGID_RUNTIME_FW: Driver-detected runtime firmware failure, GuC/HuC/GSC. [RETRY]
> + * @XE_SIGID_DEVICE_FW: Driver-detected device firmware failure, PCODE/sysctrl. [RETRY]

Pcode or sysctrl errors cannot be retried. Pcode init failures cause 
survivability mode.
RAS sysctrl errors require a secondary bus reset. We could have other 
firmwares in future with different
recovery.
That is why it would be better to drop resolution buckets in logs.

@aravind thoughts?

Thanks
Riana

> + * @XE_SIGID_GT_TDR: Engine hang / timeout detection and recovery (reset). [RETRY]
> + * @XE_SIGID_MEM_FAULT: VM bind, page fault or GTT fault. [COLLECT]
> + * @XE_SIGID_IO_BUS: Runtime PCIe / IOMMU / MMIO access fault. [RECOVER]
> + *
> + * The situations the driver detects and reports in software. Values are
> + * numbered sequentially, are only ever appended, and are never renumbered or
> + * reused. The tag in brackets is the default resolution bucket (see the `Xe
> + * Error Signatures (SIGID)`_ section).
> + *
> + * Firmware- and hardware-originated signatures are not listed here; they are
> + * logged as reported by those layers.
> + */
> +enum xe_sigid {
> +	XE_SIGID_SW			= INTEL_SIGID_GPU_XE_SOFTWARE_START,
> +	XE_SIGID_PROBE			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 1,
> +	XE_SIGID_WEDGED			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 2,
> +	XE_SIGID_SURVIVABILITY		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 3,
> +	XE_SIGID_RUNTIME_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 4,
> +	XE_SIGID_DEVICE_FW		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 5,
> +	XE_SIGID_GT_TDR			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 6,
> +	XE_SIGID_MEM_FAULT		= INTEL_SIGID_GPU_XE_SOFTWARE_START + 7,
> +	XE_SIGID_IO_BUS			= INTEL_SIGID_GPU_XE_SOFTWARE_START + 8,
> +};
> +
> +#endif
> diff --git a/drivers/gpu/drm/xe/xe_log.c b/drivers/gpu/drm/xe/xe_log.c
> new file mode 100644
> index 000000000000..70a41bdf1a01
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_log.c
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#include "xe_log.h"
> +#include "xe_printk.h"
> +
> +static void log_emit_cper(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +			  u32 component, u32 location, const void *data, size_t len,
> +			  struct va_format *vaf)
> +{
> +	/* TODO */
> +}
> +
> +static bool is_hw_sigid(enum xe_sigid sigid)
> +{
> +	return (int)sigid >= INTEL_SIGID_GPU_XE_HARDWARE_START;
> +}
> +
> +static bool is_sev_error(int cper_sev)
> +{
> +	return cper_sev != CPER_SEV_INFORMATIONAL;
> +}
> +
> +static const char *log_hwe_prefix(int cper_sev, enum xe_sigid sigid)
> +{
> +	return is_sev_error(cper_sev) && is_hw_sigid(sigid) ? HW_ERR : "";
> +}
> +
> +static const char *log_sev_prefix(int cper_sev)
> +{
> +	switch (cper_sev) {
> +	case CPER_SEV_FATAL:
> +		return "FATAL ";
> +	case CPER_SEV_RECOVERABLE:
> +		return "";
> +	case CPER_SEV_CORRECTED:
> +		return "CORRECTED ";
> +	default:
> +		return "";
> +	}
> +}
> +
> +#define __LOG_DRM_PRINTK_FMT(fmt, args...)	"[drm] " fmt, ##args
> +#define __LOG_DRM_PRINTK_ERR_FMT(fmt, args...)	__LOG_DRM_PRINTK_FMT("*ERROR* " fmt, args)
> +
> +static void log_dmesg_vprintk(struct pci_dev *pdev, int cper_sev, struct va_format *vaf)
> +{
> +	if (cper_sev == CPER_SEV_INFORMATIONAL)
> +		pci_info(pdev, __LOG_DRM_PRINTK_FMT("%pV", vaf));
> +	else
> +		pci_err(pdev, __LOG_DRM_PRINTK_ERR_FMT("%pV", vaf));
> +}
> +
> +static void log_dmesg_printf(struct pci_dev *pdev, int cper_sev, const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	log_dmesg_vprintk(pdev, cper_sev, &vaf);
> +
> +	va_end(args);
> +}
> +
> +static void log_emit_dmesg(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +			   u32 component, u32 location, const void *data, size_t len,
> +			   struct va_format *vaf)
> +{
> +	const char *hwe_prefix = log_hwe_prefix(cper_sev, sigid);
> +	const char *sev_prefix = log_sev_prefix(cper_sev);
> +
> +	/* TODO: add component/location details */
> +
> +	if (IS_ERR(data))
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%pe) %s%pV",
> +				 sigid, sev_prefix, data, hwe_prefix, vaf);
> +	else if (data && len)
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s(%*phN) %s%pV",
> +				 sigid, sev_prefix, (int)len, data, hwe_prefix, vaf);
> +	else
> +		log_dmesg_printf(pdev, cper_sev, "SIGID=%u %s%s%pV",
> +				 sigid, sev_prefix, hwe_prefix, vaf);
> +}
> +
> +/**
> + * xe_log_emit() - Emit a structured SIGID log entry
> + * @pdev: the &pci_dev device
> + * @cper_sev: CPER severity (CPER_SEV_FATAL, CPER_SEV_RECOVERABLE, ...)
> + * @sigid: signature identifier, see &enum xe_sigid
> + * @component: component identifer
> + * @location: location details of the @component
> + * @data: pointer to the additional details, or ERR_PTR, or NULL if not applicable
> + * @len: length of the @data in bytes, or 0 if not applicable
> + * @fmt: printf-style format string
> + * @...: format arguments
> + *
> + * Emits a dmesg line that includes a single stable, machine-matchable token
> + * ``SIGID=<n>`` followed by the optional severity token (like ``FATAL``) and,
> + * when @data pointer is set, either the error printed with %pe or a packed hex
> + * dump of the @data binary blob. The dmesg line will also include printf-style
> + * text message.
> + *
> + * Note that the full dmesg line, with the free text message, is only a debugging
> + * aid, not an interface! Only the ``SIGID=<n>`` token is stable there.
> + * The durable machine record is the CPER carrying the same SIGID.
> + *
> + * Note: generation of the CPER record is a planned follow-up.
> + *
> + * Examples::
> + *
> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=104 FATAL (-EPROTO) Invalid GuC reply
> + *   <3> xe 0000:03:00.0: [drm] *ERROR* SIGID=106 (-ETIMEDOUT) Engine 'rcs0' hung
> + *   <6> xe 0000:03:00.0: [drm] *ERROR* SIGID=103 In survivability mode
> + */
> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +		 u32 component, u32 location, const void *data, size_t len,
> +		 const char *fmt, ...)
> +{
> +	struct va_format vaf;
> +	va_list args;
> +
> +	va_start(args, fmt);
> +	vaf.fmt = fmt;
> +	vaf.va = &args;
> +
> +	log_emit_dmesg(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> +	log_emit_cper(pdev, cper_sev, sigid, component, location, data, len, &vaf);
> +
> +	va_end(args);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_log.h b/drivers/gpu/drm/xe/xe_log.h
> new file mode 100644
> index 000000000000..d475e816ee0b
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_log.h
> @@ -0,0 +1,20 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +
> +#ifndef _XE_LOG_H_
> +#define _XE_LOG_H_
> +
> +#include <linux/cper.h>
> +
> +#include "abi/xe_sigid_abi.h"
> +
> +struct pci_dev;
> +
> +__printf(8, 9)
> +void xe_log_emit(struct pci_dev *pdev, int cper_sev, enum xe_sigid sigid,
> +		 u32 component, u32 location, const void *data, size_t len,
> +		 const char *fmt, ...);
> +
> +#endif
