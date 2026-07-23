Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE801C531CC
	for <intel-xe@archiver.kernel.org>; Thu, 23 Jul 2026 19:39:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 640F610E5E8;
	Thu, 23 Jul 2026 19:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F6Eq9mLs";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 087F810E5E8
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Jul 2026 19:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1784835545; x=1816371545;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=GUH9ZEuO+BMQRCiOMyjCtp9FTMgfblFr3ZtmKGMD95c=;
 b=F6Eq9mLsrAhb9xEJNNliqTLs87ScylmfCqwAjQy/yQ12ztZ0lZ5nvb9k
 Wv9sxeFYm9yJOY2ljYDp6jblWXG2PKIl8YmpoivHqXRCJdNiGsdv7iERT
 e4PV35ydgVMyFx3lWyb+8Kh/c7t5tZW9R9Ko8oJijICaqfvEHxbkalK6o
 COtY20HzHRNYrxneGJrZKFnoJ/+yjDQGHPALi37jbCmYtOm//yvYwzQew
 ZXegawjcbfrzbGpY8mw98y8rlcmyyd2mnWERSwfkBlPEkAGx8cjItHzqA
 ZVdSFW4PKeHz5rOXa/fHoB7vbqLwp+Z1NgfS32B4BOWRj/ElAOH5CgLQV w==;
X-CSE-ConnectionGUID: P5sEQrPTQx2E/ErCetTxYg==
X-CSE-MsgGUID: /QO1m7iURSeA7g9nfJbS/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11854"; a="85695199"
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="85695199"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 12:39:04 -0700
X-CSE-ConnectionGUID: 4TeC9gSvRiCCBtN9N8rFlw==
X-CSE-MsgGUID: nDZbTjtgQHqxlAYDHJZD+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,181,1779174000"; d="scan'208";a="283009308"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jul 2026 12:39:03 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 12:39:03 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43 via Frontend Transport; Thu, 23 Jul 2026 12:39:03 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.43; Thu, 23 Jul 2026 12:39:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VqjuEIBpHyJBz5jun7goM8/e5Yjw2BMEPoeo5RuBp3zw1DvYRLBg3KshK6gc0Bu8F79TjONhg2cTWXlYyau+8fNIz1SN7b1fG98habobmfg/qUbtzzLHqQNEox55p4s0sSNXbPuAZ2Ppc7VhRtyGyBb5ja2mqZzo11R5SWBhKCx6YzoPdJSzNJ/SDToAIkDkpYYDWcgGCv6IWo9HCrt+uzX4FYhPxHtmzhdNU656opCynJt1dAS8xoM5PoCETNcXwrhpzvXqFOjhR73x39qvlAny2h/yEEdZc4DsXtsdOJTK9pe4C7tdXFNsoeGZn5cMh+LRepKIrLy3IuEvTCZQ8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Be1SograyEQh8NOKrAHCylZ50Y4ZFPYzkNPeYnNZOFs=;
 b=doeQAM8AUVMZizV1Kp+LrrgLDVU3jUogzhzAuHfi+N4Vinob7QshL2qLnkLbxixOCNFBzoTYLX8KYCNBr9mjHBJkR72PwW5yvd+5HTJJI5Qiuk2OFD1JOw+a0SPMIUQX4BrpfJDZkn6Slfz7pOISzXj6PCwenbxwOPo5ZKZWPg+QdYOM4JfEFVvqcL/c9hTbTXpXs7513ZhlcH8he8U+Tr+yPnAH7Qvdd5TpBPCX7ctVx00RrX8PdIQ0TKExPKE8RifcRCh7COQ5JyTaBpi4ONyoA3FBYbhna5crDUk2Yl84AqkMif04aP7DFnybZ8pzX55sMQoDjtela3agXyqoPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a) by DS4PPF2EEA5C68E.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 19:39:01 +0000
Received: from DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983]) by DS4PPF691668CDD.namprd11.prod.outlook.com
 ([fe80::a3b:efa:42d5:e983%8]) with mapi id 15.21.0223.017; Thu, 23 Jul 2026
 19:39:00 +0000
Message-ID: <dbcbefb0-ff38-45ab-b91b-0cf4e6ba5890@intel.com>
Date: Fri, 24 Jul 2026 01:08:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] drm/xe/debugfs: add page-size allocation mode knob
To: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260722143759.1718600-1-naresh.kumar.g@intel.com>
 <20260722143759.1718600-3-naresh.kumar.g@intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <20260722143759.1718600-3-naresh.kumar.g@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0247.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:223::16) To DS4PPF691668CDD.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::2a)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF691668CDD:EE_|DS4PPF2EEA5C68E:EE_
X-MS-Office365-Filtering-Correlation-Id: 0dbe9606-ed66-43d7-67be-08dee8f20b7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|11063799006|56012099006|4143699003|10067099003|3023799007|22082099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info: qBGjg0npj0OJo8H8VwyFqbZpGWyAPmJ5m0mBphewy2EhtiCElA72Ri55bSCqF8ocRQrLglCCb/hKaCVedlyg0XOAAgiDG+uPmk5Sp7BSivhozLuqd5qYnHE7bxoeZaeYGqyl1ZFoz6R8OcT/WqIRIA2HykfHnDq7f+ooCA3s/XDsDzPM0Jj5Iv4ZMj0uixnzBWHx6PwvmApcQKr7ZTKYQROyVc1VfFixyHeWimA/HSpnTudbpvPDcblXV/U07sG91vAKzgE8O8vKlR/a0UCCY+T+94XnU/H+VbZSxvar1y5qHovpsAujlfhtW1Fq0qQSlZoXevZ8FC5NUPvJi8hPrzPTHO4yxayacdCu2xodDtZW80aDw4k3cZ1ih7qn9jqNCIigZbOYApASs0uhi+o40LH3qFfUQd7MNFePVHw8KS7nx/i0QR3MnrmBC3eSYMSS4/jwShA8VsBZlgv13e1jT+7Co14/b5XqxRQhaqFlgfmx/k7vuQdxUJfaKoC2VzOPiULoXqS+7EZmUp+AH8SgDobYjOdH9HkW5VjJ902WkKTQGmP0Hip1OmpI4o1iNu4oAyGvKwERwQHOJkH6usHjTCelXbqMCOpx0df9/MyVep1/CIJZwG6/9jzFRtajN4A2+wlW/J+Js4M0Mc1ePhGnPRXqB8TXwyWfn9BMH7f7ND4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPF691668CDD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(56012099006)(4143699003)(10067099003)(3023799007)(22082099003)(6133799003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZW1nTTFnVzByRklsbDhPOW14VGxBOEJCVDl5eTduRlVOdXd4QkhiNlI0VjVX?=
 =?utf-8?B?SDE1WmVmK0oyRHN6RDY2R3FlcEVIdnlULzFRS2tWSnBRNW4zNTdVNmljVy9z?=
 =?utf-8?B?UDY5eW44QXlZMGlWWFVPRGozWlhJOGFSV0RNQk15TitjSVpobXpqOG1zTStP?=
 =?utf-8?B?YStaKzBNdzBsMlk0dGViT0VwaWRnbDJEZmFLb3FnSW1tNWR1R2hDaE1ENlZq?=
 =?utf-8?B?a0ZhMGFlMjVNVzMvdE9JSnJCcFpqWHlPRHBJVVZhajhHRm1HUjJWdTFBcGM1?=
 =?utf-8?B?Q0xBSU5nek5MMFhoT0R3dU9EL1Btb0w0R2tWdkNRMDYvSURjTWkvY1l3TzNj?=
 =?utf-8?B?RGMxZ0NDZTByb1MyVUZHeHFiMlVaRFRBS0krMEMrSG1UcnUyVTNHbUtDemdr?=
 =?utf-8?B?T29PdmNvREpNNmM5c0VsLzNOWk1FTytyVWMzdTNsUTY0VXJIM1JYOEpGS21y?=
 =?utf-8?B?M3VGM25YVnFEQ0M5TXhpa2t4bG4yTlJpV0VLOWtKSGlsSVZkS2NVQUpqUjYv?=
 =?utf-8?B?S0JwWGdIamRQYlptWm1nVDhXZ2Naa2VnT0YvaW9CS3FSYzFUbEhRNEUzYXR1?=
 =?utf-8?B?ZjJrWWxFVWhSZjBNWkptbUVVVkVyaFVMV2RmTWZnbWRyU0x6eG9POElZYnVj?=
 =?utf-8?B?andhUWwvRVgzUENNYWxlV3JHT2xCcjNuZm5QdTZ0SWxIM0ZrRDA3bzhwU0RM?=
 =?utf-8?B?UUpRTG8wNVRwSUxSWnN6WkV5ZVdPL1lXRWRWaGxXV0twS05ydXR3bTlWbmFX?=
 =?utf-8?B?cTg3Tll4UFFMbjJ0ZFFOQlBNczd2NnVMRUdTdlROZ2E2MEgxMDhjenRnNjlv?=
 =?utf-8?B?cWpRU1p3TGFzRTNwL3BnZEt4cTBxS0JhbTVJbVJJU2hvTEVhc25RNWZ0T2I2?=
 =?utf-8?B?UUlsSEVlbFduM0tUSmpZY0o3Z2hCWTAzL1pvbDc5S0ttcnRENDZDMlMzdU5z?=
 =?utf-8?B?Ymoyamg1ZjRQQnRMeWpQMTA0UWNReWsyWXdjaktPVll0dUp0YlNmaUdzZ3Fu?=
 =?utf-8?B?UkloUHlvKzF5dXZUb1dKbDFuUWxVUFNxRXE2QkVMK3lDRi9lSXNmbGtqSjE2?=
 =?utf-8?B?elhHZHNhUnpEYXlCSFNRZ2I4MEQ0Y0xPTGhRV29nandJVVhpdERTYjBGUjlQ?=
 =?utf-8?B?c3JsdXR0NXZXMmp0eGp0VnE5Ull6V3pSaEh4aktDZU03bThOTnFNTUh2OEtZ?=
 =?utf-8?B?WTNUQkIwd294UlZodW5ZZGxCd2FoQ2pVYW91YlRoaW85Tk92UUVXT3RyV0J2?=
 =?utf-8?B?NnQ5RXZOZ3d1aU90UXpXYm9RWms1bmxUY3VMVGU3bHZ5MlUxTEEwVGsvcVNr?=
 =?utf-8?B?MzhZOFFISHQ2UDdyaEFhWjFIZ0ZqcW5naHdmdmo2VlZlb0x2V0pnSHluNzJ1?=
 =?utf-8?B?ck5yNUVEc1JtRm9tWnhleDRDaFdSbGZ4d0hySnVqZXludFJXNjZTSVVzN1Vk?=
 =?utf-8?B?a1BMcUV6SzNVbDYwTDhKdjRjbDZHa2VmQUFFN016YUJyVE1SWEJhQWgxRVIz?=
 =?utf-8?B?aW1kV2VjcE95OEFVZzFmTGhWMHFHKzVBWWo4bE8wOHN5Rm4vMXluY0llRXJl?=
 =?utf-8?B?VmJ5Mm9sYTliMW0rSDlJWW4vb1JXTFJmSE5PMnBGSWhndkMySzRwa2ZvdDlI?=
 =?utf-8?B?MHlQNW1HZ1lHMVRKbHFkVCtyQVlnRUVweDBYT1pyUFZkSEt5OTVsTXVTQ0s3?=
 =?utf-8?B?TUlaeUM1SUZpMVVQdDAwc0dzeDE2Ulo4eGgxdjJlUkVqV2UveWl5VjFodXFI?=
 =?utf-8?B?TDZHdDZ4Z056UlRwTldjWHFDVFF0UVBUOE14WVBQVXBKUkZWeFBqWWZ3Tkdh?=
 =?utf-8?B?MzhOVHlmZ1psRkVzM3BBbzZ2VmlqcW55VXNNaUJ1NExsV1NVK0NOU3Y4a2RB?=
 =?utf-8?B?YU1ZWGhXZlB5aEwxMnBJUWpnZFFlVXRNNGtwWUNsN0lzMXkxZVlWNHU1S0wr?=
 =?utf-8?B?SEh0UEtROFRrYVAvWnhmbW9ZNVdYdVJDcDloWnlsanAvQUxNOWFLNzB4N1hL?=
 =?utf-8?B?SFBTVTJRckdMaGU4aURhM0xqR3MyLzhjUytRTGFWRzB5ZE5HbmpRVWt3ZTRM?=
 =?utf-8?B?UWk3NGM3VU5Rczhja04zUmdOdjI0aUZwV0N1Vy9zNlc5WUYvdFRUelc1ZTVK?=
 =?utf-8?B?SGs0U21vcytLSVlrdHFTa3FneEJQMmsvUWRzWVdZbHE3QW9RcVVpQS9tMjhP?=
 =?utf-8?B?NmpWTFkzWXhBSEhFSFhWbVNYd1drblRIbnR1eFk0TStPekRNUU1TQWF1ZkRr?=
 =?utf-8?B?aURyZHVDbGplSkxtdzJzMEVzb3JUZG9kUElBYUpuc3E3Zm5BNld2LzhmV1JT?=
 =?utf-8?B?RWZSeEd0UnlEVjZWTlZHd3VZbVQzaXRPWjU0T0N5K1A0RWc0Y1lhQUo0b09L?=
 =?utf-8?Q?/Mww797oxtw7g+cs=3D?=
X-Exchange-RoutingPolicyChecked: hJA5sNzBSLds+7pCqbHt/SzH3Pe3kCe2/nz3wNdI3zLdW1TukLd+4syZCXJ7ohiiyaT1I+5UUFKe5jNMta2Bco3DEyZhWottmB3Ffg0xbhROfJ70Mkgwi+JJJqIQ+Ch0Gck6arlX8BVxhn9mQYzXqOHkOT4tSzN7jgrMhGoxw4H/pMakqpZuZew9NF/4e6B4WGDKrAwT7crecOl72e1VuPrmAexK6ATh0Ult1cazn+eO/HRpHCVHsNIixQOPMs9Bv8kMWIZRmxnHVXrYk0mXAvH0njL680bFE1cmFFvZ1AT/REhEmlTadUILOUROFuvYZfKh9oW0TIJ5GajFvwaQcw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0dbe9606-ed66-43d7-67be-08dee8f20b7b
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF691668CDD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 19:39:00.7966 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CdRY8Vj7M1yEVD3z3pN4fJfepuugSb+6ylG6Dll/j7mhMnigpE2WLVCLHy3iFkCaiR5nN+9kAu9HY5brpxURuXJ/wU8M4l59V26bDoI/C8Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF2EEA5C68E
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



On 22-07-2026 20:07, Nareshkumar Gollakoti wrote:
> Expose a debugfs control to override the page-size allocation mode used
> for user BOs.
> 
> The interface allows switching between the default allocation policy,
> forced 2M, forced 1G, and mixed allocation modes at runtime. This
> provides a simple way to validate behavior and debug page-size-dependent
> allocation flows.
> 
> The debugfs entry is built only when CONFIG_DRM_XE_DEBUG_PAGE_SIZE is
> enabled.
> 
> v2
> - update changelog to match mutex-based cur_index handling
> - reset cur_index when switching to mixed mode (sashiko)
> 
> v3
> - add CONFIG guard for page-size allocation debugfs support (Himal)
> - create debugfs entry under CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> 
> v4
> - reorderd this patch with kconfig patch to ensure patch builds
> - Gurding this debug knob for only discrete graphics
> 
> v5(Himal)
> - Guard all page size calls with CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> 
> v8(Himal)
> - For read/show used READ_ONCE instead lock
> - to match Reader used WRITE_ONCE under lock protection
> - change modes to string format to read/writer for debugfs
> 
> Signed-off-by: Nareshkumar Gollakoti <naresh.kumar.g@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_debugfs.c | 88 +++++++++++++++++++++++++++++++++
>   1 file changed, 88 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index 5a3877fcb0f0..a1da0e0e6190 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -614,6 +614,82 @@ static const struct file_operations disable_late_binding_fops = {
>   	.write = disable_late_binding_set,
>   };
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +
> +static const struct {
> +	const char *mode_name;
> +	enum xe_page_size_alloc_ctrl_mode mode;
> +} page_size_alloc_modes[] = {
> +	{ "none", XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE },
> +	{ "only_2m", XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M },
> +	{ "only_1g", XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G },
> +	{ "mixed", XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED },
> +};
> +
> +static ssize_t page_size_alloc_mode_show(struct file *f, char __user *ubuf,
> +					 size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	char buf[32];
> +	int len;
> +	enum xe_page_size_alloc_ctrl_mode mode;
> +	size_t i;
> +
> +	mode = READ_ONCE(xe->page_size_alloc_ctrl.mode);
> +

OOB check for mode

> +	for (i = 0; i < ARRAY_SIZE(page_size_alloc_modes); i++) {
> +		if (page_size_alloc_modes[i].mode == mode)
> +			break;
> +	}

these for loops really looks overhead, possible to use 
page_size_alloc_modes[mode].mode_name

static const char * const page_size_alloc_mode_names[] = {
     [XE_PAGE_SIZE_ALLOC_CTRL_MODE_NONE]    = "none",
     [XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_2M] = "only_2m",
     [XE_PAGE_SIZE_ALLOC_CTRL_MODE_ONLY_1G] = "only_1g",
     [XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED]   = "mixed",
};


> +
> +	len = scnprintf(buf, sizeof(buf), "%s\n",
> +			page_size_alloc_modes[i].mode_name);
> +	return simple_read_from_buffer(ubuf, size, pos, buf, len);
> +}
> +
> +static ssize_t page_size_alloc_mode_set(struct file *f, const char __user *ubuf,
> +					size_t size, loff_t *pos)
> +{
> +	struct xe_device *xe = file_inode(f)->i_private;
> +	int ret;
> +	char buf[32];
> +	size_t i;
> +
> +	if (*pos)
> +		return -ESPIPE;
> +
> +	if (size > sizeof(buf) - 1)
> +		return -EINVAL;
> +
> +	ret = simple_write_to_buffer(buf, sizeof(buf) - 1, pos, ubuf, size);
> +	if (ret < 0)
> +		return ret;
> +	buf[ret] = '\0';

  mode = sysfs_match_string(page_size_alloc_mode_names, buf);
     if (mode < 0)
         return mode;

     mutex_lock(&xe->page_size_alloc_ctrl.lock);
     if (mode == XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
         xe->page_size_alloc_ctrl.cur_index = 0;
     WRITE_ONCE(xe->page_size_alloc_ctrl.mode, mode);
     mutex_unlock(&xe->page_size_alloc_ctrl.lock);
     return size;


> +
> +	for (i = 0; i < ARRAY_SIZE(page_size_alloc_modes); i++) {
> +		if (sysfs_streq(buf, page_size_alloc_modes[i].mode_name)) {
> +			mutex_lock(&xe->page_size_alloc_ctrl.lock);
> +			if (page_size_alloc_modes[i].mode ==
> +			    XE_PAGE_SIZE_ALLOC_CTRL_MODE_MIXED)
> +				xe->page_size_alloc_ctrl.cur_index = 0;
> +
> +			WRITE_ONCE(xe->page_size_alloc_ctrl.mode,
> +				   page_size_alloc_modes[i].mode);
> +			mutex_unlock(&xe->page_size_alloc_ctrl.lock);
> +			return size;
> +		}
> +	}
> +
> +	return -EINVAL;
> +}
> +
> +static const struct file_operations page_size_alloc_mode_fops = {
> +	.owner = THIS_MODULE,
> +	.read = page_size_alloc_mode_show,
> +	.write = page_size_alloc_mode_set,
> +};
> +#endif
> +
>   void xe_debugfs_register(struct xe_device *xe)
>   {
>   	struct ttm_device *bdev = &xe->ttm;
> @@ -665,6 +741,18 @@ void xe_debugfs_register(struct xe_device *xe)
>   	debugfs_create_file("disable_late_binding", 0600, root, xe,
>   			    &disable_late_binding_fops);
>   
> +#ifdef CONFIG_DRM_XE_DEBUG_PAGE_SIZE
> +	/*
> +	 * Expose a debugfs knob to control user BO page-size allocation:
> +	 * "none"    - default behavior
> +	 * "only_2m" - force 2M page allocations
> +	 * "only_1g" - force 1G page allocations
> +	 * "mixed"   - select 4K, 64K, 2M, and 1G in round-robin order
> +	 */
> +	if (xe_debug_page_size_supported(xe))
> +		debugfs_create_file("page_size_alloc_mode", 0600, root, xe,
> +				    &page_size_alloc_mode_fops);
> +#endif
>   	/*
>   	 * Don't expose page reclaim configuration file if not supported by the
>   	 * hardware initially.

