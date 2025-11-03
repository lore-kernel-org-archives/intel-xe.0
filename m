Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21237CCFA04
	for <intel-xe@archiver.kernel.org>; Mon,  3 Nov 2025 01:49:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25F310E317;
	Mon,  3 Nov 2025 01:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Z+5Yo8XE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A0A010E282
 for <intel-xe@lists.freedesktop.org>; Mon,  3 Nov 2025 01:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762134559; x=1793670559;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=/2BatYUvgER8Huspkho3yPhWBk0Lp/xdrsWF4Oirguk=;
 b=Z+5Yo8XEMVUPAiVMoVYaOOWFWQlW/2dl+TnFkVn5ER5pMUW2yRuWRAGi
 woB5gvykXX3LfmcF4JuHp1IDDqX5/TeNs2GaSwlZOPNqjOwDTXU/PtZxo
 lrRxUYyBaaMrO99vq2kf+dPwF0LFHidDy7Zuoui3gB8ZFyi62lfWAR4qs
 SvYdhz/RNenfZonMPSfzkw2VXQPnaBEfPBVEgZzrghpytqhPyPFj2kdW9
 kTWkHQWxDvCyXoGp81thOY6eID3pXEQJCmuKE+SmOXmt79jPDI4Rvhorx
 3hTyM/DH9gaol9R70cN2D9gavX7Gfg1ssGQrNax4Yt8ftqiISRaVcN4zq g==;
X-CSE-ConnectionGUID: 6G0B4CowSu6HTdPovuSHbg==
X-CSE-MsgGUID: /bPFjQgERCaFkhNPtyk5iw==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="64304747"
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="64304747"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 17:49:19 -0800
X-CSE-ConnectionGUID: kj+lFe4XQ16wslIMvs9ttQ==
X-CSE-MsgGUID: fgXHxb9yTDqhI4H9SLVx/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,275,1754982000"; d="scan'208";a="186026036"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2025 17:49:19 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 17:49:17 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Sun, 2 Nov 2025 17:49:17 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.28) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Sun, 2 Nov 2025 17:49:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nl1OBISacVJb7dCSTtPWXEzDbFExgIP70FVkg5EphS3NyBtxxlz3lwgbZtPwgFDDoOnxqPBkD3kfYb6LdOy5hgs9RC5bruPQ+1px0pxy5zutvjmOAyDbZOUegvNazYz9AAVuIR9A/FmTlh9wubXgWkf/FDluu0cz8zRJhhIG0agtSKqgHuF+SKpa2LxTB7g8ricCIO4ArzFTD72ioSjB4cACOZpc09vhbCxMoKZUrBFQnY81oOhne1C0ffITrFxwzKBnDhjN0XYygiROePFvvQJmRDE9pa06ecrO1TsbT7G0+9v+j0ypnZWkQ3sw+DDiQq1AwWStlYTrzMsBTWivGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FCoHeBahn4UKArwdORPubL2EmzrDQV1w9ntikfEg+co=;
 b=oVANfhXX54DUOEOgdlZPBB8yT0zpryppurIUgl2+YwvpMVlIQFbzKlLYjyM05B+Nhhe0PLhpAuaHWTVUtayyBgwtd0zLlMELNqNivV7b5afcYEvTLfmuVR2WgupfrLTE88T1xXZwDtGS5D+SowL1fJxP5o6Qhm0JJBBtyURLHJNp0RMUh5RZIynQn26ZHCw14UVkvlRSzMi4gFjIO5R7nHWDiPY6NA28Z7lndDXseX4W/jKPHV6xGLWaEduG4PpVI0zm9TJ2GIfZFp8o7ZiYqC2jR882i+x3s02UUfy+slWk5UbRcTmJ/mm+5cfSAo4mXBTckosKpFR3RU/AB0AwsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6410.namprd11.prod.outlook.com (2603:10b6:208:3b9::15)
 by CY8PR11MB7196.namprd11.prod.outlook.com (2603:10b6:930:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Mon, 3 Nov
 2025 01:49:16 +0000
Received: from BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc]) by BL3PR11MB6410.namprd11.prod.outlook.com
 ([fe80::b01a:aa33:165:efc%3]) with mapi id 15.20.9275.013; Mon, 3 Nov 2025
 01:49:15 +0000
Date: Sun, 2 Nov 2025 17:49:13 -0800
From: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 06/16] drm/xe/multi_queue: Add exec_queue set_property
 ioctl support
Message-ID: <aQgKGSdK1GMNeP48@nvishwa1-desk>
References: <20251031182936.1882062-1-niranjana.vishwanathapura@intel.com>
 <20251031182936.1882062-7-niranjana.vishwanathapura@intel.com>
 <aQeMn+gtasdn80GO@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <aQeMn+gtasdn80GO@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BYAPR21CA0028.namprd21.prod.outlook.com
 (2603:10b6:a03:114::38) To BL3PR11MB6410.namprd11.prod.outlook.com
 (2603:10b6:208:3b9::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6410:EE_|CY8PR11MB7196:EE_
X-MS-Office365-Filtering-Correlation-Id: 99597fc1-c19b-44ac-a586-08de1a7b3213
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kb/eL1auQ5c9pwOLe3585Q4EFe5zdmpSa4x8lWieRG7HhYXyTKVFOvMWR0yf?=
 =?us-ascii?Q?D0GbCkjn+E0Ou5g99VmsGbhPYy5qtfqqKgidVnmCC/JJvGcwIQ6ApGaVg9xg?=
 =?us-ascii?Q?mxpnKxIWPejaswoP47TpUtjf1JnG+u71G3m+BwmXzRBUrwDg2plrGf+WXvIe?=
 =?us-ascii?Q?Uao9+CnrW64TIxAbcUMl9Z+tCgUTiRQLE76AoRlR9IW2TgCmmGm/ignMM+jX?=
 =?us-ascii?Q?461KmboPNeL85xo+OwSn8h0dsL9q6rE4zsKK2yxxQ9XFg+2m9Ma0HkjzYma9?=
 =?us-ascii?Q?mE6k0f4ifLDFCAx5wRS5mQDdPvb9EuX3f92VOLDFOVPMbZSNzzi9TYXAJxfg?=
 =?us-ascii?Q?JzQ6zr4XAELVREnxDSb8mM5zYDwJ4u505m6fpfETsDZ6MyaAuFeOpbowei9f?=
 =?us-ascii?Q?wstFZqZNtYhiFsIpnR91CVWi2g2pr2ltj5TrvSdDcTc5LCcTUl9NdRXp88FS?=
 =?us-ascii?Q?YDXJF/InysSjuyZWQJVy9doBHClPRcvaMfxCkvkrEU7snSVrR6QvlqjKXR4z?=
 =?us-ascii?Q?6ywKMLFJdASyrFGMQUi6a/hp84Gc9tpmxvspaDpDKxeV8PRqnT7vA2n99c8J?=
 =?us-ascii?Q?ranit1xuQkY/JHBM9K5fHrMq+BhmUgGKomFdUHus3uZ+FfRItwE+uLmC8POq?=
 =?us-ascii?Q?trCyv8ZhXk4hJN9iYGoLDr3pqJkQxqYdG4xGNNdXA3WahGvxGOYFAXH7ekbe?=
 =?us-ascii?Q?EJWabmXBYl3HNgB1yTl86AN4RtLpgfOtuGn4IX+3ZQLZ1SS+pPRpWhFJNypm?=
 =?us-ascii?Q?2rFxwxPO69qncSNt1PNTX9ao/+xEEdNdEcm03rgG7UsMVDZA7KOpVyhzjWNd?=
 =?us-ascii?Q?KJAzMcd5qBr9//cC9Y63Ua6GQngJfB8EZQ+u1eaUhkCmJ5q75y+2z2V/34Jy?=
 =?us-ascii?Q?VOYWKmymVPxqYRyUV+p6Kg91f1ASlsXDysj9DJsQ29qxDvG/S0smenWIoMds?=
 =?us-ascii?Q?geuXPCYJmjr2eJ9QsLQFuVX5fukh9bqo9nhk0AyAbYgSSctNLcwaVVLWH0Ac?=
 =?us-ascii?Q?U5Ho3tU9Fj7ULpHNQtk/ZG18EgWVbpwYI/uUagGk4Fm+QyQrIsnq0X8E7KGY?=
 =?us-ascii?Q?L45D7RPHHP8JtP4mErNwFdoictB2M8R6QdFMr6YFxSHSop9XYWmpJoBSaP5o?=
 =?us-ascii?Q?aTX/UUcq/GACUidPUlH4Tk1Fsaq/mcYi4vcLuxTX2UMXcogJDc6hHq8cDaqe?=
 =?us-ascii?Q?lZVbaefFu2cmVr2DIkHXrsQhLnzgqVkSJ4THY+Os90gODLacR7UU5QkHC+pL?=
 =?us-ascii?Q?iFMHyVHsqUQLX2FzKMTdFdDmdP6UrbvVUSOQDhgmM4qqqs9HZVx5FziTvI9V?=
 =?us-ascii?Q?+7IwwRy61yYgr7liX2nPUdu7+vmBxL2OoL6J1J6GacuZy9MwKutkFNvFKh1J?=
 =?us-ascii?Q?tU8+tCx9Iyg29Jr5XzZq3Bu4KqbBKrYR5WboWO692BTselClyw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6410.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R3fnumeLpoZgX5vy2eqDf+2X2EKtDGIBd/BRcBLZDXLJIIvMxyLY43Fyo0Be?=
 =?us-ascii?Q?i0QiOK8KUiI+jYzZ/ey6O5AQkTCPUt78e2wyM+s1UnZ9QqArvxYYpHfz3rBE?=
 =?us-ascii?Q?+/woBY8zIDJWrwEQbW6TmAvnEAmBcKRnqrbQLyh49BzM09P5TkrlVi3koy82?=
 =?us-ascii?Q?kzGdHzlA+LK2GNm25RFxOvhtXjksQHnwhp9PdY829KMudmTK42Y8Xz6pKnlm?=
 =?us-ascii?Q?mxI4NXgR1sDfFjGDX3OwPHjJuUykKO/TuID5NCR4IasRL+tc1Hsu8f7gvc6I?=
 =?us-ascii?Q?1IlwbPI8xzUbm53AVjIQXtLLgFPhZthGeT+t9dqkP6lJwyOL56cQKcsE+9QK?=
 =?us-ascii?Q?UmsxzqNrf5qmF/8TcY47xWG/ApYTWk4wHet17RpXT6KatjeYcIw/epbZnaIt?=
 =?us-ascii?Q?x15OY3I7NeoDP+L3KZPRkO7ez8pCcfIMGbYxTyKZllUorJSfy7zwBmXuFu3/?=
 =?us-ascii?Q?IXhAgzF241LNuzH3QDbt44qacwnEyyNlKShDuilzczgFMn/VUjGaVFCeJzTS?=
 =?us-ascii?Q?WxLufQOSn2IJA14zBNoIczQLFi875ZexTOEtOXg0/BOIxJ23JX8josc354EW?=
 =?us-ascii?Q?tB940krwZOE7eYdfcYpW1UPwWYyp8CFSGaNb2cZ/5GhIVOaj6DwjRSLVes16?=
 =?us-ascii?Q?27OjRFKUQ9tbN+IvJ4uJ1PdnPP1sDyov9s52dNs4cfdXoSP5bd8s8B72pPzi?=
 =?us-ascii?Q?kq+X1SUWR4XBEbRLoFpCFCbHh75N0Wr87uKVGmgzabYmSzRoORvwQ4CCxgPo?=
 =?us-ascii?Q?BKGCZQhurA0LybSo3cFTtatblZNyplU/qv1DYK4Utjn84aPqvO1eEdIkaU+n?=
 =?us-ascii?Q?SqpfI9wxhi12OGLxoCotvtNID8mZKTIsdOjohATCgCVfLw+F5Wn3GjQSqeQH?=
 =?us-ascii?Q?P03xEhrPFsmoaihujyphpApcAziHPXRef9REOquOJTfArrUEW0LJCetTmdZc?=
 =?us-ascii?Q?W1IGfqSdYPzFe7cajhZo57ua1WVvf2U8MVgq8+Sy9vsH3G1RZRmcuEhssugI?=
 =?us-ascii?Q?267fdx8ncKwFTNjeb8R5DSNM/vI3nmDcUoqyFHWUWlAMWGQWzZlcN1KOEHoc?=
 =?us-ascii?Q?Mrk3RG798I6GtXq9Kj7ufpxlZRqwoYvc8ppJIqNDwl6mgK+6XQYKrqwzZyYm?=
 =?us-ascii?Q?cxCdegB7RngAo63GPBWwW9e1HG/eBRFUv2ijxZRDsGvofbF8CsHA4k7agpya?=
 =?us-ascii?Q?AxBZ2FJxzddbxVzW+5zUR/JX17LfI+EEETrHKvWZYVbWwyQ/lQNXpAT+gkeb?=
 =?us-ascii?Q?5sQPfBTnLCul9dfgosmF+ziakQ0Ghc92Z6o51Cv/gKjoDdHEwwhtGcfuZeUs?=
 =?us-ascii?Q?mMGdVxRmvWXgzhgx0k47bM/54/AScWHTZqOxwHo4BM4/TDwGKY/6oC91EzUq?=
 =?us-ascii?Q?nSy/8ELTlWXEZQdXi0+qqWYvS/Ke5Vv2cd1YaAE0EA5zOa+T9IBDiJCSfzqq?=
 =?us-ascii?Q?gKfdW7h69Jk8UF81kR1WnuZGWAbcw0MLVQjA0oURZx252xv0lnpyVo2zxvNI?=
 =?us-ascii?Q?eVkUkUBd4gJjqOgHGNdZnFGdn2+ZrXJgMFvg2y1r13hrijPhOJE8GvUjpoxE?=
 =?us-ascii?Q?9g95zZqX4YHJ8/Fo1UZWsXGKPXi0XjI97CTin8IYOu9o9QqWDRUnWZIsTbG4?=
 =?us-ascii?Q?CAZGjiYM0LTjd6Qzvttc/XI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99597fc1-c19b-44ac-a586-08de1a7b3213
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6410.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2025 01:49:15.8089 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XqvkFGz+UdeZjmjefaubJJn561bGDD9MYS6Hs5gnAA6p1zqME6hrebW543Ai7e4bRRH2fwCdXVx3+7ZwDSFMNbNKkGGYgLda3ZxVzsQjq/z3kfe484bt0xx9PZeSqDAj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7196
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

On Sun, Nov 02, 2025 at 08:53:51AM -0800, Matthew Brost wrote:
>On Fri, Oct 31, 2025 at 11:29:26AM -0700, Niranjana Vishwanathapura wrote:
>> This patch adds support for exec_queue set_property ioctl.
>> It is derived from the original work which is part of
>> https://patchwork.freedesktop.org/series/112188/
>>
>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> Signed-off-by: Pallavi Mishra <pallavi.mishra@intel.com>
>> Signed-off-by: Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
>> ---
>>  drivers/gpu/drm/xe/xe_device.c     |  2 ++
>>  drivers/gpu/drm/xe/xe_exec_queue.c | 31 ++++++++++++++++++++++++++++++
>>  drivers/gpu/drm/xe/xe_exec_queue.h |  2 ++
>>  include/uapi/drm/xe_drm.h          | 24 +++++++++++++++++++++++
>>  4 files changed, 59 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index 47f5391ad8e9..0b496676527a 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -208,6 +208,8 @@ static const struct drm_ioctl_desc xe_ioctls[] = {
>>  	DRM_IOCTL_DEF_DRV(XE_MADVISE, xe_vm_madvise_ioctl, DRM_RENDER_ALLOW),
>>  	DRM_IOCTL_DEF_DRV(XE_VM_QUERY_MEM_RANGE_ATTRS, xe_vm_query_vmas_attrs_ioctl,
>>  			  DRM_RENDER_ALLOW),
>> +	DRM_IOCTL_DEF_DRV(XE_EXEC_QUEUE_SET_PROPERTY, xe_exec_queue_set_property_ioctl,
>> +			  DRM_RENDER_ALLOW),
>>  };
>>
>>  static long xe_drm_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
>> index 78b3a0e2ddd3..0264cab00fd4 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
>> @@ -747,6 +747,37 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>>  							exec_queue_set_multi_queue_priority,
>>  };
>>
>> +int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
>> +				     struct drm_file *file)
>> +{
>> +	struct xe_device *xe = to_xe_device(dev);
>> +	struct xe_file *xef = to_xe_file(file);
>> +	struct drm_xe_exec_queue_set_property *args = data;
>> +	struct xe_exec_queue *q;
>> +	int ret;
>> +	u32 idx;
>> +
>> +	if (XE_IOCTL_DBG(xe, args->reserved[0] || args->reserved[1]))
>> +		return -EINVAL;
>> +
>> +	q = xe_exec_queue_lookup(xef, args->exec_queue_id);
>> +	if (XE_IOCTL_DBG(xe, !q))
>> +		return -ENOENT;
>> +
>
>I didn't realize this was new code, so my comment here [1] about
>dropping the check around
>DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY is wrong, rather
>pull that check into this patch.
>
>[1] https://patchwork.freedesktop.org/patch/684856/?series=156865&rev=1#comment_1257589
>

My plan was to keep this patch generic and not mention multi-queue,
though currently that is the only use case. But I guess, it need not
be so. Ok, will move DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY check
into this patch.

>> +	idx = array_index_nospec(args->property,
>> +				 ARRAY_SIZE(exec_queue_set_property_funcs));
>> +	ret = exec_queue_set_property_funcs[idx](xe, q, args->value);
>> +	if (XE_IOCTL_DBG(xe, ret))
>> +		goto err_post_lookup;
>> +
>> +	xe_exec_queue_put(q);
>> +	return 0;
>> +
>> + err_post_lookup:
>> +	xe_exec_queue_put(q);
>> +	return ret;
>> +}
>> +
>>  static int exec_queue_user_ext_check(struct xe_exec_queue *q, u64 properties)
>>  {
>>  	u64 secondary_queue_valid_props = BIT_ULL(DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP) |
>> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.h b/drivers/gpu/drm/xe/xe_exec_queue.h
>> index 8cd6487018fa..61478b2e883b 100644
>> --- a/drivers/gpu/drm/xe/xe_exec_queue.h
>> +++ b/drivers/gpu/drm/xe/xe_exec_queue.h
>> @@ -121,6 +121,8 @@ int xe_exec_queue_destroy_ioctl(struct drm_device *dev, void *data,
>>  				struct drm_file *file);
>>  int xe_exec_queue_get_property_ioctl(struct drm_device *dev, void *data,
>>  				     struct drm_file *file);
>> +int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
>> +				     struct drm_file *file);
>>  enum xe_exec_queue_priority xe_exec_queue_device_get_max_priority(struct xe_device *xe);
>>
>>  void xe_exec_queue_last_fence_put(struct xe_exec_queue *e, struct xe_vm *vm);
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index 8ab44413646a..d72151163e77 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -106,6 +106,7 @@ extern "C" {
>>  #define DRM_XE_OBSERVATION		0x0b
>>  #define DRM_XE_MADVISE			0x0c
>>  #define DRM_XE_VM_QUERY_MEM_RANGE_ATTRS	0x0d
>> +#define DRM_XE_EXEC_QUEUE_SET_PROPERTY	0x0e
>>
>>  /* Must be kept compact -- no holes */
>>
>> @@ -123,6 +124,7 @@ extern "C" {
>>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
>>  #define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
>>  #define DRM_IOCTL_XE_VM_QUERY_MEM_RANGE_ATTRS	DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_VM_QUERY_MEM_RANGE_ATTRS, struct drm_xe_vm_query_mem_range_attr)
>> +#define DRM_IOCTL_XE_EXEC_QUEUE_SET_PROPERTY	DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC_QUEUE_SET_PROPERTY, struct drm_xe_exec_queue_set_property)
>>
>>  /**
>>   * DOC: Xe IOCTL Extensions
>> @@ -2284,6 +2286,28 @@ struct drm_xe_vm_query_mem_range_attr {
>>
>>  };
>>
>> +/**
>> + * struct drm_xe_exec_queue_set_property - exec queue set property
>> + *
>> + * Sets execution queue properties dynamically.
>
>Mention which properties this IOCTL is valid for.
>

Ok.

Niranjana

>Matt
>
>> + */
>> +struct drm_xe_exec_queue_set_property {
>> +	/** @extensions: Pointer to the first extension struct, if any */
>> +	__u64 extensions;
>> +
>> +	/** @exec_queue_id: Exec queue ID */
>> +	__u32 exec_queue_id;
>> +
>> +	/** @property: property to set */
>> +	__u32 property;
>> +
>> +	/** @value: property value */
>> +	__u64 value;
>> +
>> +	/** @reserved: Reserved */
>> +	__u64 reserved[2];
>> +};
>> +
>>  #if defined(__cplusplus)
>>  }
>>  #endif
>> --
>> 2.43.0
>>
