Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B44FFCCD183
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 14:21:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AA0D10E111;
	Mon, 13 Oct 2025 14:21:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EVjqZiMZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 759A410E111
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760365282; x=1791901282;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=bpIVSN7dfRU+dQwsGK+pynrQZzxpc4yqTEUaFNNkg+o=;
 b=EVjqZiMZcTxU5t75tXaLYp0C32zJ3AUdUcB29icslHSrmv2X4tiA+i4e
 4uAg6pK6mQ+V/K9sClSruB+6SHDhhxHV/MpUZ8yph0ZionavyE24DE+aq
 v0T+BswFcVWZ50bWMFWiv3LLb6yxw12NQR/zbnjSGOX8vv5XWDtBOIFg9
 l9nQmdmIL7ABXZPCPdzhYvCShF5C6KAh0xBRqv0lSHXxO3DYAUG7ObdD2
 7dj4xUyso3elS20wjbpygdbLYPOm+hPSQ/DXhWd64k8ZAMxA80HtU5xJz
 xk+tVzKvhhAg5jr/31INbENtZXQ1EG4nOqXoM5ixD4lViICW/yX4DdVbx Q==;
X-CSE-ConnectionGUID: e5/DqqwpRcqW3E+RouoAsA==
X-CSE-MsgGUID: NlCVt/uQTOuzyFkwqfo1nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="50063335"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="50063335"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 07:21:22 -0700
X-CSE-ConnectionGUID: EThyrPErSjCzFP7AMtTYnQ==
X-CSE-MsgGUID: aECalhRiTkSYANNYjuF4wA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; d="scan'208";a="180852615"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 07:21:22 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 07:21:21 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 07:21:21 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.64) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 07:21:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bKcrBuGAjj4zQNpxeBKE9RAdmV8xgIKqbELC8QyIPSpVnsjABXB1aKuX95aEf2n+KN12IQu/+u1U41iI4x4WzcPO2Bic5Bk9Fd6BJkiItMtsFBS15r2LBuJq8YR+b7j+xVHTIRekszQClSvwvQr+t+h4jojmTs89lkGwF5niCK+/4skD6asBSDhfV9sXFdknyGWyMeOdYxsucnUg5x5Z2qvDFKAsEceerwgJqFKxm+9XSpYCX+ze/WgpYD3ihAdK9u587D3DSyeEYZCbERF1Qfpvtt0LRJ9r/Jh8+OSEmaHLnR2PJgCe21Mka0mxWV707fEkMXIWN6erRI6S/WbqOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WzpEaU+SSdlPLsEIz+NuuAbix+E3sKBHTLbxnqnfvhc=;
 b=hE4dfvIZVp19FogF/4GcE4udCy627gEyz40Gv5CxAxIBMj8sdbmY01dYdpnqhostSJKoSvUrzzBra4DgIm342nuG5rgOIvShiu7xQoIsi/vwdmw+pJ21KBy6u7mwm4EKoYgo4jRLxx4ZbM++2QlhwPBs/ScftU0s1w4DVqQTeAv12wFD+TgHudfsAkTvpcZGjeIYa3GZWcIlWL25tkbkft0G06giKLRyJvlJAI1yACCw+mczKnyKKeYigPXXzyccpt9V7tSz19aqSHMroLSI38oUlNLvqx1sprA0H5n2FIcgfWFg0XDc7f1zpF67io8y/JDOOIlml+2+MZou2QGwhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DM3PPF0644BB20C.namprd11.prod.outlook.com (2603:10b6:f:fc00::f06)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.12; Mon, 13 Oct
 2025 14:21:19 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 14:21:19 +0000
Date: Mon, 13 Oct 2025 09:21:15 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Gote, Nitin R" <nitin.r.gote@intel.com>
CC: Arun Abhishek Chowhan <arun.abhishek.chowhan@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] [PATCH] drm/xe: Sort include files alphabetically.
Message-ID: <5i7qzzl42ivwr7bjbiepe6svdq2upiqpvw3zjpvge52ekczedp@mjwun2lc26ng>
References: <20251013095914.3742505-1-arun.abhishek.chowhan@intel.com>
 <IA3PR11MB89873A3BDAC05B1C9881F603D0EAA@IA3PR11MB8987.namprd11.prod.outlook.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <IA3PR11MB89873A3BDAC05B1C9881F603D0EAA@IA3PR11MB8987.namprd11.prod.outlook.com>
X-ClientProxiedBy: SJ0PR05CA0198.namprd05.prod.outlook.com
 (2603:10b6:a03:330::23) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DM3PPF0644BB20C:EE_
X-MS-Office365-Filtering-Correlation-Id: 3873276b-1de6-474d-b8b6-08de0a63c6e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HnQhyVtACmnbo9zWoWuzgYDWEi3cHuT4WLnqz2HkRS8Uq6PD2H6yDPl0MB0P?=
 =?us-ascii?Q?OL6sWi/wgS1UjTYmeHxijzo0VADCotCps16kQRQ7AaGKAAZNQWhauA7l7hJv?=
 =?us-ascii?Q?4QqVSAlMZrNWke5AKdKhx7EdIMwnS+W/o2HuDZ7eeQ395vj8ik6XZNSn0jgc?=
 =?us-ascii?Q?f5/sEvIA3sVhTapMrhIjm/FvO7rPKf6i1i4a2yc3BDf3eHY3UmeK246oOaPM?=
 =?us-ascii?Q?ufiEj0fUx4gDQFDZOdsxUTxZl2mZmlKtcs96sCfm5/rPqUabR3l7wes6RZCm?=
 =?us-ascii?Q?gGfykmQBDAVXcgB2calsLV5f/XcE1axbqh/PRn/pZ5xhzXpbcfRrymsLc9IR?=
 =?us-ascii?Q?bGqQDd7w6DGxi2D+VCaby3o6gdRgjzbAWDcSdI8GcFxWEG2ACn3JKrw7/x8m?=
 =?us-ascii?Q?vwqmQcbf88ygpmlxy6rH8pvyA4yFkF5NXjBF1j+/9JJOxoK+db0WugXqR0Eq?=
 =?us-ascii?Q?Qe3qi4r4BbR+0wgxBYOhVK6lzoqWlkLpfPQj9vxJJMUkJTgUw6NqVQu3L8Hw?=
 =?us-ascii?Q?mJ/czH3dGi3aUzBxhbw6Zlc2pCzgfAGLcoJxJuwnvUba/gdORj5m20vZV6Lo?=
 =?us-ascii?Q?MFQPM0kDoZ6EMF48S9uB5D4GeAtzBbdWuyBPEgb4qNViyS8pm8hiND+EoVBz?=
 =?us-ascii?Q?Az0i3VeN1TcNOtBzRi1I0Hg6K8KlftTTPFlxlPvwgFEQE2Uk1lzfqwGiRaX6?=
 =?us-ascii?Q?0mRpCyX6enO/uZlsNrja6lOGqhgWKi2euDQ/ZntT3S9ECFuZ26gJrJIy7fWD?=
 =?us-ascii?Q?HuiWqk36XPIHS1cyiFJzsIQp5Eg+DHjTIu+CrFJBEOrH0/vawQRwc9h4EV0y?=
 =?us-ascii?Q?wyjkEU/ipP3uWvyqFX3/YTvFS70QHXOC1GDo92N2b0N4WYA7v6VU1MVuPINK?=
 =?us-ascii?Q?EUDlF8WBTta8hMci3vsIu1mDbhv1c7sjf224w4QYfG0n60AREz8kohoX6yHu?=
 =?us-ascii?Q?Vw10dRi8dBFueqpMd+2cnRvsbpl+Hhhh7BuWZ59QEsjPfoE1aTWI2q1BhCq9?=
 =?us-ascii?Q?4zReodcdOWrwcmt6AVySxe4xV3eSr4rL9hRiFwcavCCaSAlYS6Q33BN4q/7X?=
 =?us-ascii?Q?aRcn1nQqlcbNopQJ2yEy3fwYwB+J5jU6MPUtzElkzSq6gWWWX4FAATx61dNP?=
 =?us-ascii?Q?GIONor4cGPW2KMAdXlu5sMf3eDKAMcOcl9x7dFY7Rlf9sUIvixka+qmHZbEs?=
 =?us-ascii?Q?ARpbA4CCOKya8PFp+DBoisU/qQBWPwrnNUpjQ4HMMSGeE86+aW2DJtgULqtb?=
 =?us-ascii?Q?eCHm+elb2Clm/lgvLrgd3t6Y+z89dnKP24WcdLsV8X4EPM9eEZKq1nifBYp/?=
 =?us-ascii?Q?8g78+QQB/ZYKVCeBbL9VMOYKs2W+rcaX1zCAnm66d1+KkTIuV9vIZJK/TPVq?=
 =?us-ascii?Q?hbgcP0dtTxXRNANHDZyCJ2UkISadUWByLJUaztvmN6HZiHu1YuMXgAq7DmTn?=
 =?us-ascii?Q?yeZGuwXGEoMwHMliA4GpYEdQD0C13Nes?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZDIdkUHnLYz61NaPYFOB2lSRkgQzLNGjmP/xC+FcOXtjb4ZL7PFbbXmKSqFX?=
 =?us-ascii?Q?bo04v3mfyxlz7yi2bP6GBPyC/cwxz9KbFys5rP84cSlBQXrUWqepsZy7rzGN?=
 =?us-ascii?Q?4TbjTt7d+vfrlWhlQA8alujo60NhWsF+BmIkkMoCJ9p0MNtg0bmW63CSH3Gu?=
 =?us-ascii?Q?mF6Ak1iIJqEH+FyrwhiEtiwToXOb8hRC9GUjtyO6HY8xHaieLHpo25ilqguK?=
 =?us-ascii?Q?1BoWTMM7jPe1QJAW6KLbxoRb7vNTDcWcD3b4Xzg0RyU8W3oGydv2wModX1qx?=
 =?us-ascii?Q?dOthbIb8/CjK4tLpkQAEyDf+IMr/Fep0NYdkLLO5G2BSfxjx/B8+imHDaHkv?=
 =?us-ascii?Q?CLoRjXIgGl5hsfcgZqaKnEMeIdKq64DytslaEdi0of3yczxSDFAzhFOTwYF4?=
 =?us-ascii?Q?aL5UKaN9EPtaPru4rVSC8qZ6hmAnZ3V/izoHMsRLrpMyQcG0kluk+k4KDxjC?=
 =?us-ascii?Q?1QFD/iQjgOUTFNc0JjG7KBSMpdWo20K6/4KXxDwIL05povcQejte1d0vfPrV?=
 =?us-ascii?Q?gGV/demQXP0iK3l/4aCcy+d85bDTX2XrpNcZJJUDqgUKidgE6DkOF4eRfZHF?=
 =?us-ascii?Q?igtR4mPyBK6Y2XvT2MSI3wX+jTjaQIgW/NyKBf9KzsT1ttANp22ez9q3T+c4?=
 =?us-ascii?Q?ZKabfnDgNOUPqCsgIZEZAnhNZdPcvsh9QFfjjBffVyFbn2SSoDfV3r0X5WU9?=
 =?us-ascii?Q?rK0rAILLQ66L1EL+gKVXBPHaJOfkKcz/LqZDih1d4f3aqBLgPtlJgBH7Mksp?=
 =?us-ascii?Q?E8MNs0IBpRKhAU8dC6nl+hP1rhNuyo0BcDvve3fMTwPtuNTz8lStQx7Tn7bd?=
 =?us-ascii?Q?+MGsucv7GGviRzXRlaYPU1HYQAM6bTDFx1xA6Le+MF0sI9tj05Vn6zvkwkGR?=
 =?us-ascii?Q?QSn8TDLZP4WXsZBnCKJq1I8055969WQh5wLmvHSwzLuCnfCjisB8Q/o87OZE?=
 =?us-ascii?Q?ByknTX4MwRvEiDXOjgNqWs3P2bUEpXNMh+keAk/FYL6o5fjeF14vmIf4dVb6?=
 =?us-ascii?Q?YBJtoaAByo4WnySyHwNhReq08Z6c16nQhGOYkHMIIsSHbGET9rZdwC6GjQDo?=
 =?us-ascii?Q?mtZAWSzLlHOh7TPBGagOR2SWM34vr1L8RFK9+FThqEji8WIfEQj4inchXYpy?=
 =?us-ascii?Q?2AhbYuetdfWDn25CDy+S843eODL70g8+wstarJrEmynvo/EvVXTRaXG/Gy8f?=
 =?us-ascii?Q?bERxP4tAbo5vrhtM4mxlA/GCxQro6MlaRkAZCc6Z1JRbWj7UxL8Pk2sAWejz?=
 =?us-ascii?Q?hAHva96kVAiGdMEt0kDmH5dod2nlmH65KNh9ou/nldvR8ChnzYTi36TaPw+/?=
 =?us-ascii?Q?w1gV1vp8ThOD8H/baYP5naco/czq9i4RBUvWCuptpKKokv8BBt2fT/O5k0g8?=
 =?us-ascii?Q?Xiw4XNK1WQKGC1V4fKFN7N8f4+vmhTtkm5hmdfk/MgJrnMW/79cLlyWLgxxN?=
 =?us-ascii?Q?cLZmVnHxcg5FXAVxXWppS2Wu+5109oQWDxmknNcYJLHwkC72E61nR0lg2/sW?=
 =?us-ascii?Q?hp+l8X21Rl1loS7ofGzOs+2J7h0RSS8TVB6nQqIc/W49Go9qETyz3Qz0ieEA?=
 =?us-ascii?Q?VvKsZMYdPj3UAfySPlLA8T1rl3uiG9JQsxnQiJp74qM+Z0ivWYcRkh8KKV2M?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 3873276b-1de6-474d-b8b6-08de0a63c6e5
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 14:21:18.9913 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XlNwr6ft/X/AFnaPu9FKYzEV9qAyqnCXMi3d2OQMhrFA9daCS0RKxi0XMIh8kKDgy4VPfUbIRWwfr6tQSS61rJl9nMGWEaksEvCW9lKl/KU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF0644BB20C
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

On Mon, Oct 13, 2025 at 10:20:06AM +0000, Gote, Nitin R wrote:
>
>> -----Original Message-----
>> From: Arun Abhishek Chowhan <arun.abhishek.chowhan@intel.com>
>> Sent: Monday, October 13, 2025 3:29 PM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Arun Abhishek Chowhan <arun.abhishek.chowhan@intel.com>; Gote, Nitin R
>> <nitin.r.gote@intel.com>
>> Subject: [PATCH] [PATCH] drm/xe: Sort include files alphabetically.
>
>Subject line has [PATCH] twice. Please drop the extra.
>Otherwise patch LGTM,
>
>Reviewed-by: Nitin Gote <nitin.r.gote@intel.com>

git am is smart enough to drop that the extra [PATCH] from subject.

Merged to drm-xe-next, thanks!

[1/1] drm/xe: Sort include files alphabetically.
       commit: 64d00d41f57bf2228ed6c217c8e263440a4248df

Lucas De Marchi

>
>- Nitin
>
>>
>> Sort the include lines alphabetically, no impact on code behavior.
>>
>> Signed-off-by: Arun Abhishek Chowhan <arun.abhishek.chowhan@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_debugfs.c | 2 +-
>>  drivers/gpu/drm/xe/xe_guc_ads.c | 2 +-
>>  drivers/gpu/drm/xe/xe_tile.c    | 2 +-
>>  3 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
>> index 34f622bef3e0..1c3c9557a9bd 100644
>> --- a/drivers/gpu/drm/xe/xe_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
>> @@ -27,8 +27,8 @@
>>  #include "xe_sriov_vf.h"
>>  #include "xe_step.h"
>>  #include "xe_tile_debugfs.h"
>> -#include "xe_wa.h"
>>  #include "xe_vsec.h"
>> +#include "xe_wa.h"
>>
>>  #ifdef CONFIG_DRM_XE_DEBUG
>>  #include "xe_bo_evict.h"
>> diff --git a/drivers/gpu/drm/xe/xe_guc_ads.c b/drivers/gpu/drm/xe/xe_guc_ads.c
>> index 58e0b0294a5b..22ac2a8b74c8 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_ads.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_ads.c
>> @@ -18,6 +18,7 @@
>>  #include "xe_bo.h"
>>  #include "xe_gt.h"
>>  #include "xe_gt_ccs_mode.h"
>> +#include "xe_gt_mcr.h"
>>  #include "xe_gt_printk.h"
>>  #include "xe_guc.h"
>>  #include "xe_guc_buf.h"
>> @@ -30,7 +31,6 @@
>>  #include "xe_platform_types.h"
>>  #include "xe_uc_fw.h"
>>  #include "xe_wa.h"
>> -#include "xe_gt_mcr.h"
>>
>>  /* Slack of a few additional entries per engine */
>>  #define ADS_REGSET_EXTRA_MAX	8
>> diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c index
>> 6edb5062c1da..8fd6ee990d14 100644
>> --- a/drivers/gpu/drm/xe/xe_tile.c
>> +++ b/drivers/gpu/drm/xe/xe_tile.c
>> @@ -19,9 +19,9 @@
>>  #include "xe_tile.h"
>>  #include "xe_tile_sysfs.h"
>>  #include "xe_ttm_vram_mgr.h"
>> -#include "xe_wa.h"
>>  #include "xe_vram.h"
>>  #include "xe_vram_types.h"
>> +#include "xe_wa.h"
>>
>>  /**
>>   * DOC: Multi-tile Design
>> --
>> 2.43.0
>
