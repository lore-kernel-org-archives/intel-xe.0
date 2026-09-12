Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED8EDC88E50
	for <intel-xe@archiver.kernel.org>; Sat, 12 Sep 2026 00:28:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E02E10E03A;
	Sat, 12 Sep 2026 00:28:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OYynEmeP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC84110E03A
 for <intel-xe@lists.freedesktop.org>; Sat, 12 Sep 2026 00:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789172879; x=1820708879;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=H4B+KSxZ4bnsuDpwZTzQNviXOhZCaEIbkO2dTkN0/uo=;
 b=OYynEmePoIx0510fHdRFGnr+xKw6eHDO171chYYPSn4VPD7HuJvhVAdo
 0Z8CuOKjVJaKSBZK1qkjKd9Thcob5Yi3mvFmlLT7lHnqkJC2IIX6jrL+Q
 lLriBItatilzyZ7+hQ/6MlF6bRaXP0jqajReKmZTbWDBDEqzanNH6RU5c
 sQSwERwO5CKtM/eJcljXfyTG2GxtbFtjrzQdQ2yOwjF2mBWpcw2QziUNR
 4EKjalbJrh/bWJqEH3WBQGsxNU7RCZf7LbAwBg/gZkPVV7uGWpzDDGkUO
 nJLv5SNyvjaMFcDJgA8mCPeLzeSTA/4Hx1WZKdLNKuioMgezsSZ3xjnK/ g==;
X-CSE-ConnectionGUID: 17bo1nvxSNas2iFTE9419A==
X-CSE-MsgGUID: uC+zKFh8QzGiklQsGrfrdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="107148093"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; d="scan'208";a="107148093"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 17:27:59 -0700
X-CSE-ConnectionGUID: BJRdPiL6S8CCpoqrLQ9Nzg==
X-CSE-MsgGUID: yzdMoI2jRx2UQQHDT+4kSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; d="scan'208";a="297047479"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2026 17:27:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 17:27:58 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 11 Sep 2026 17:27:58 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.40)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 11 Sep 2026 17:27:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uZjaZJ/26aysndmsMggLB5abE3h4KAhU5KQe9ZL/s6DcX8mtPypemogBWQ2XvV+xYPuhUT58YkkjaOhnZlc6ta07l5d2GoNvKO5VRJ+a17c3W7IzfcCGmm0DQe29pg9yrCf84mZQO9RgWrggtxmJMBR/9m0ZJh7z4fE+8Urqd0yC/OavlEOa53ZIpJ8/zh8j0+7x+w3Uxj0Xt9lSqKdLnAdlVyK9EgbwT/uFGFDzN3QRJ8EqMH1g9w8LOkq6nYQ8utxUImi4KhQYxeVQ8mfHDxzr8PnkCne2OG2FYVy12aTFKKIp4UTJx1SwSgtnMCW2ALrUcxwFTws5C3k45tZqhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyDpttXundlqPSl/KZ3ta28oRnA2aMCJ6Go7dwlibsg=;
 b=hlPyaV8imFpgHqxn3+Agu26pQRNZHbINURWG2dZcqrutoLp4kfpkMlisrn4KvTnh/F+Urrm2PhD5fDsst0XSb4lialP+q2IwpXNJ18X7G2cbkugNSGT0XnmVELrrYV3VpU7rJAtq8CxPAqLTGhJ1DRtqDW/Tt1PTaf3EmF3FNOp/JOzzdmwMiNcSNB9zb3pbpS63UjBJI9RoUFgly99CnXgXTN3Iv4OnJP3cMc1iNQqsUWnLJCqi6ODNGl/K+c4/lDJizp1ivgjoWsmo6w+ElDltrygID7JsV8qGpEAbJVkp49EKRx70KjAEXsK6Jv7n+nufhQKsL5uCG/7I+xFdOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB4787.namprd11.prod.outlook.com (2603:10b6:303:95::23)
 by DS0PR11MB6493.namprd11.prod.outlook.com (2603:10b6:8:c3::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.7; Sat, 12 Sep
 2026 00:27:56 +0000
Received: from CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd]) by CO1PR11MB4787.namprd11.prod.outlook.com
 ([fe80::e7eb:a872:53d1:21fd%3]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 00:27:55 +0000
Date: Fri, 11 Sep 2026 17:27:53 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Francois Dugast <francois.dugast@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v6 06/24] drm/xe: Add XE_BO_FLAG_PUT_VM_ASYNC
Message-ID: <aqSciepBdkJRkvc2@gsse-cloud1.jf.intel.com>
References: <20260904211613.3934307-1-matthew.brost@intel.com>
 <20260904211613.3934307-7-matthew.brost@intel.com>
 <aqP9wLOjODgyAjkl@fdugast-desk>
 <aqRca7kHxdojgb3Y@gsse-cloud1.jf.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqRca7kHxdojgb3Y@gsse-cloud1.jf.intel.com>
X-ClientProxiedBy: MW4PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:303:dc::33) To CO1PR11MB4787.namprd11.prod.outlook.com
 (2603:10b6:303:95::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB4787:EE_|DS0PR11MB6493:EE_
X-MS-Office365-Filtering-Correlation-Id: 203c4ede-b07b-47cb-435d-08df1064b0b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|23010399003|376014|366016|10067099003|6133799003|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: snG3E3zsfK0twWnyFE6k/SBqe8GTd8HtZlMRi7E76aFNkX67NmffWNeOJnRUMraC1yboMyTNpaNpNKFSglzWxKUjBI/EWQe1jEPDVOibUadRoMDkF6VoxyDDGIXlt1fL2wUQi3mKSCru5I360GiHec7WKuDwKYS3XOz9vY8mDeRN+IyzKjQ2XfjTIpFtroUh5sw5oovhlBnHRmKEOAJeFZQPJyNh6sXV3tMphS9lru+JM1HajYMHME5TyGgtkHZ9kE+bNj+3XyIUfXqjb9rzA1dUj77WcIWjpx+vbeUyiKEk7WtU13FiQVVtk8oX5IndKX1fLerRxw7kMfG5TDtFIkj7rjFJWwTrC5c5qBdMtmtVqCsZ8/BZbDQKjLjevCWt5KO28cuE5STDemF3fxqpAOInk6IMUcnheaGjUb7vK0iZnkgF9t9vgMHwoh5+jbFXOtVov1klZhLe5l03HZ2siSU7Qe++9KsoyU3SMqy9jzhdRK11pB9zFEhmoyOoL495M6V3CEKPWD3uxRoX3WwbUyxZKx9X9AR3dyCeEd3xKQl6CJVKQXhZiZkmi0kTy2hxZDS7jiTDSUUGxveHx1h86MLeeNYWEGhi7vBtD013nIk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB4787.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(23010399003)(376014)(366016)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3JDaVRCejJ5a0o1NkVQVTRQM3hzcFdBaHdlYVo3YXYxa1Q2ZzJaeVlZaHBZ?=
 =?utf-8?B?aDFhR1BYYlV5dXN4U2p0ejZPNmcyRi82Zmo0VW96SWFjWVhOT21ONXIxc3dJ?=
 =?utf-8?B?cjdKS2psQjJ1ekUxYmRVT0J3TzBOV0h5SnZDZGJJWklQa0Fvek96b0hNTkh6?=
 =?utf-8?B?ZTVwQmg0MFdOZDhHZWZ5QnlOTXhNVkkzWWpCSkswNlpmd0Rqb3hnTXZ1ZE5H?=
 =?utf-8?B?WnpvSGtiUnNRWlZjaUhPdDhYUVlSeU1Bc1FCWU0reHh6S3dqdjFUOHJlVm41?=
 =?utf-8?B?YnRjMUpqNDYyaXhYY0M2cHEwaU1jZnJCMi9YRWxqc1Q5UnRJa294SUI3Mkhl?=
 =?utf-8?B?NjgydzNoVk9Ibk9MajV1L1FiQ3Z0UFlmWSt2Qm5YdkJlWnZPeUh6cnRPcmJp?=
 =?utf-8?B?dFQ0S3ZidEhtYk1yMjJjUE84a2FrRk1Tdms5cmYvVlF5VWlYSnh4SDBTWDd4?=
 =?utf-8?B?WUlwdTAyM1FsNG9CVEtPTVZFeHIyeXFmdDI2T3FSUFVvQ2I1TUpPeXpLdWJl?=
 =?utf-8?B?TXQ5MEdLK1I4cHkzTWV5dzk0K1NyZHViQnpmUGhva2ptYXJZK0pPZnlLL0ZB?=
 =?utf-8?B?ZDRJWGdZMVBMUExwTE9GeWdZR1BwcG5sUWdSbkZ3M0RHMGtrejRHMVVRTVda?=
 =?utf-8?B?dWpyRzJ3UlgzYUFZa04yV1lIS2JGR0c0OTJYT0lUVVAyRTFtVVhuZDA1dDFq?=
 =?utf-8?B?eEZwQ1dOc0FlbDJ3UFk2WmtpOUQwYlBBVWs3dk41R0ZXZkhCbFh5eHkxbndm?=
 =?utf-8?B?LzNScTZ6Wis4aUFKdnFIRjN4Y1hTbWtNMnU5bmNJenc1MkFpTzFyeVhoejFS?=
 =?utf-8?B?QnU4N2tGc1BYbUJyR3A0YWtYdCtZeWgxUzNuNGpTSlQ3dElxZ2tlNHRETkNF?=
 =?utf-8?B?ZVV3a2tWaXZjSWxtS2JoOC91eEVuVTFGZThRclE2c3VPTVhxdFFFWFE4bFA3?=
 =?utf-8?B?SFFEc2FZRnlZRWhmS3ZjTVV3L09udnI5ZENXVmlFTEhyVHJJZUZMSUc5ZXFS?=
 =?utf-8?B?bkZkNTdpc0J4WU4xRDJ4b1JTNUxuRWNuL04rNE1CZmMrckQxZ3lsR042TEJ2?=
 =?utf-8?B?QWVNOE82UTdiZ044VGJDclQ3N3NXYjB4dVNiK3NmT0dQRWJZTXErN01Cd1hZ?=
 =?utf-8?B?VzkwQWpBSFpVdVdkNWljS24rNi96amthQ3hWZ2ZNSDZ6WWR5d3JTOWU3Vmsw?=
 =?utf-8?B?SGtXTFVmc2gzZndFTGpXSHJ4YjRFWGwwZDZ4OUlvU0VIdGJMbXY5M1FieDVZ?=
 =?utf-8?B?NzJEcHBJUzIvd3BoOFkrV1h1bjd5eWdrcURSbis0Ly8xTFVTWUF3d0VZWVAw?=
 =?utf-8?B?MUlJT3l3SXlQMTJzSWdLNDVUbUg0aURvOFBDeXZ2N01ILzZyaWxhMEZmYitM?=
 =?utf-8?B?WEVMeW40TE9WL1JtUC9KLzVBUExKdDd0M04wdjZPc0h5N0w2UzJjeFdMeXRC?=
 =?utf-8?B?QUlxTEhzT051U3pUQUpqaFViZW5sUXdzM1JuR21leHg2RXI3MGNwYmx2Y3BH?=
 =?utf-8?B?RW0wb0xGdjc2S0sxc0lrSTNlYi9RcFdsS2JDbUJNcGpGbE5DZFFFcUhOc1VX?=
 =?utf-8?B?Uk50bGdDWGxXMDIxdmtublRnT0NsTjdrQUFrT21EYzZYM3hua2RNQWVkMjhH?=
 =?utf-8?B?Z2ZLWFJNRnE2b1A0ZXQwdXRmN2NMd0VKQVlXcTFZalRQQ3FOc1VVWDN0bzFs?=
 =?utf-8?B?ek5vNWhwRXlwT2krejUwVFZwVll3SzFUNEtjdDRkUU54RFVseHp0SU9aOVBw?=
 =?utf-8?B?djcwUk5LMWgza1UwUHNQaHhHUFBaZFNsNWFyMzRTMEtVTDI4VXI2dHVORXhY?=
 =?utf-8?B?Z2kyWjhWajlLZ3hNQi9qcHJUM3J2WmdiUklycXBGOW0yYnZ6QVdmNi9oaG55?=
 =?utf-8?B?bW9kV092elhmSDJiS2l0bE9HY3pRQWhoTUdXQ21rYm9USVlwVG1uT1NackF6?=
 =?utf-8?B?cWZ4K04xYi8zSkxJUTFDS1B5LzA5RFYxYWNKUzNxenlLMXF5eVBjRWZDTFQr?=
 =?utf-8?B?czZYMUpJc0Y1RmhDTllZUU8vdGhvS3p2QXhBd3JuMVR5cjl0Q24zWTI1M0Fi?=
 =?utf-8?B?VE9HMzlYSGlsdElpdldQcjdsWFNNdkV0enZQUzZmZ0pqSDFycnZxeW14bTQ1?=
 =?utf-8?B?QnJBWGtoZkRYN2lZa0Fod2RSV3Yzb0tpb0tTYm85Vnp6VlRaRlNja2tUNUto?=
 =?utf-8?B?aFFZMEdNcDZxaklRNjU5QU1EcHloWmdORERQaTVLNEVpcUV2NlpvdDlaQ2JE?=
 =?utf-8?B?Y1ZNWHJzZnYxQk5mMkNnMHpvTTdjdFVjT2RqejZwM3IxQ2VmYklLUGx2Mzk4?=
 =?utf-8?B?RVo0NWdwYlFlYjV1RUh1dXZaM0Y1ZzhwdGp4RFZvdS9oK0o0ZTVscEMwaXpW?=
 =?utf-8?Q?6+FgVvwy/D0bFKiM=3D?=
X-Exchange-RoutingPolicyChecked: p0s8ZQBaPifL71Yp88NPtRw883kCXE/lQPCUkZiwOyQ43kcyym0LdQQhKDGwNt5blj9Q4ie2SK7yA7bfgA1j6SwmJ5mbOarlpLnsrJHctIfPT4pdrvBH7ksoS6qgH0B8/fO6TgxHx2oQZqAIo2weCUdc/0zaTuM57mN25qMryQs5Fho+yM4RF3GjpUuaAU7WAnIGgZjEEe0qvoCVVoDnrxdYcCfRrXlp7zjz5WG+E9Rnjf8bg7qam6jq1qvKgDCmNi9nfbgACM4lnNWWJxLnW7Wzqd0RrBiW9IDctVdI2JOLSqw5P733XKOC+4DPx6VD7qEWdQX2jcDFVXimQGLOPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 203c4ede-b07b-47cb-435d-08df1064b0b4
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB4787.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 00:27:55.9042 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B9t1xZZXSOl8YOnmEImqHamYRyKE8qQ41hFXyKLuUEdIRuqJ29Qo4do4y5UppYp1p9Vc7R+h75TIJkjxpHgYoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB6493
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

On Fri, Sep 11, 2026 at 12:54:19PM -0700, Matthew Brost wrote:
> On Fri, Sep 11, 2026 at 03:10:48PM +0200, Francois Dugast wrote:
> > On Fri, Sep 04, 2026 at 02:15:55PM -0700, Matthew Brost wrote:
> > > Add XE_BO_FLAG_PUT_VM_ASYNC, which indicates that an async BO put must
> > > also drop an additional reference to the BO’s VM. This is useful when a
> > > kernel BO, one that does not normally hold a VM reference, needs to be
> > > put asynchronously, ensuring the shared dma-resv object does not
> > > disappear before the BO.
> > > 
> > > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > > Link: https://patch.msgid.link/20260228013501.106680-7-matthew.brost@intel.com
> > > Signed-off-by: Maarten Lankhorst <dev@lankhorst.se>
> > > ---
> > >  drivers/gpu/drm/xe/xe_bo.c | 8 +++++++-
> > >  drivers/gpu/drm/xe/xe_bo.h | 1 +
> > >  2 files changed, 8 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.c b/drivers/gpu/drm/xe/xe_bo.c
> > > index b162753cebb7..aea4b0fee8e3 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.c
> > > +++ b/drivers/gpu/drm/xe/xe_bo.c
> > > @@ -3998,8 +3998,14 @@ void xe_bo_put_commit(struct llist_head *deferred)
> > >  	if (!freed)
> > >  		return;
> > >  
> > > -	llist_for_each_entry_safe(bo, next, freed, freed)
> > > +	llist_for_each_entry_safe(bo, next, freed, freed) {
> > > +		struct xe_vm *vm = bo->vm;
> > > +		bool async = bo->flags & XE_BO_FLAG_PUT_VM_ASYNC;
> > > +
> > >  		drm_gem_object_free(&bo->ttm.base.refcount);
> > > +		if (async)
> > > +			xe_vm_put(vm);
> > 
> > You had mentioned reworking this part:
> > https://patchwork.freedesktop.org/patch/750807/?series=149888&rev=6#comment_1383757
> > 
> 
> I reworked the PT BO reference count reinitialization in the PT layer. The
> Sashiko feedback was not correct in its original context, but it was
> right that transitioning a BO reference count from zero to one on the
> driver side is unsafe.
> 
> This change follows patch [1] in xe_pt_destroy. Compare it to the prior
> revision [2]; note that the kref_init in [2] is gone in [1].
> 
> [1] https://patchwork.freedesktop.org/patch/751032/?series=149888&rev=8
> [2] https://patchwork.freedesktop.org/patch/750792/?series=149888&rev=6
> 
> Wrt. the comment about ttm_bo_individualize_resv() failing, if that occurs
> in ttm_bo_release() (we get here from drm_gem_object_free()), the fences
> are waited on directly before returning. See the dma_resv_wait_timeout()
> for 30 seconds, after which the BO is destroyed inline if VM lock can be
> taken. I guess the VM lock can fall on a trylock, triggering the delayed
> worker...
> 
> We could look at PT BOs holding a VM reference until xe_ttm_bo_destroy(),
> similar to user BOs, but there is some convoluted reason why only user BOs
> have held a VM reference from early on in Xe that may or may not still
> be true. Let me see if I can make this work as after typing this out it
> seems like an extreme corner case of posisble memory safety bug. 

It is also worth noting Christian's series here [3] is actually the proper
way to ensure what Sashiko is flagging isn't possible - ref count the
dma-resv. Hopefully we get Christian's series in soon as it nice a
cleanup and makes dma-resv sharing betweens BOs inherently safe +
ownership clear.

Matt

[3] https://patchwork.freedesktop.org/series/173312/

> 
> Thanks,
> Matt
> 
> > Sashiko seems consistent here.
> > 
> > Francois
> > 
> > > +	}
> > >  }
> > >  
> > >  static void xe_bo_dev_work_func(struct work_struct *work)
> > > diff --git a/drivers/gpu/drm/xe/xe_bo.h b/drivers/gpu/drm/xe/xe_bo.h
> > > index 01975586ee88..2168aac1ed1e 100644
> > > --- a/drivers/gpu/drm/xe/xe_bo.h
> > > +++ b/drivers/gpu/drm/xe/xe_bo.h
> > > @@ -54,6 +54,7 @@
> > >  #define XE_BO_FLAG_FORCE_USER_VRAM	BIT(25)
> > >  #define XE_BO_FLAG_NO_COMPRESSION	BIT(26)
> > >  #define XE_BO_FLAG_NEEDS_1G		BIT(27)
> > > +#define XE_BO_FLAG_PUT_VM_ASYNC		BIT(28)
> > >  
> > >  /* this one is trigger internally only */
> > >  #define XE_BO_FLAG_INTERNAL_TEST	BIT(30)
> > > -- 
> > > 2.34.1
> > > 
