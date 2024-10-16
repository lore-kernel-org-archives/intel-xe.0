Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9861DD1AD50
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 12:34:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 588A410E12C;
	Wed, 16 Oct 2024 12:34:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BZE850k8";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C65710E607
 for <intel-xe@lists.freedesktop.org>; Wed, 16 Oct 2024 12:34:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729082090; x=1760618090;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=qXCsm/vxiL5AfVRkm4Cc+pJP/DyyhR2BIHYl7mtCiXk=;
 b=BZE850k84902A52/egvofpstjZ+Xw+mztLVDODP5ujXxGFGdhADAmD4d
 AOMFDBwV5FIN48nyo2hBDus1x1mP2xKn3qY7Len5hVGZVxSyNkI4fwx0F
 EIJd9qkY6yXzMTiUzg7Qx1soT2MP4vYCUPZeH0YgWih78BfeZiPfmj9ai
 I/YVp8YScbWE9bPTEq7khGafc+9ceMEYqrwoI7A7fXTRzkmaD/kD3/VpO
 IvivWxuVvN8qhMBXeAMGD7dqXWTSOSz9UFMcIpvn6GRtZYj2HtrFias7v
 XaJ1/x1quQCMpFjorskYVVA0VdQ8zzgVhVmq9kWeHdSWnhM2Qgu+CABzF A==;
X-CSE-ConnectionGUID: dvp9b/R+Q4uK6020U0X+0w==
X-CSE-MsgGUID: XC0RJPIoSgW0dAOP/f/lGw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="51061433"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="51061433"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2024 05:34:47 -0700
X-CSE-ConnectionGUID: znm2dcEiQI+QQj8aO9aBpQ==
X-CSE-MsgGUID: 9Vudprt1QbOf7snX7OgYXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,208,1725346800"; d="scan'208";a="79047301"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa008.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2024 05:34:45 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 16 Oct 2024 05:34:43 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Wed, 16 Oct 2024 05:34:43 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.171)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 16 Oct 2024 05:34:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iCJscp4zQFHQaz2vhdUiJ5IyB8yVN8KBcq3gVC4S9U5/SaEp1LkIK7ODmLAlW7Hozd3lJ4HXhJJTg+LbUUsg+JYthnTyQ65yXMiXskupTQFaBWZZxcKUtLpTKnYv3tywjlUXrk5rGPtfYdTPIha33F74ZUFayx2sNP4DbQR5nbi5cn5+6yxZVHTujrpI4kONDSYH/xB919O98EII8CzKSvkBSfs2iNpyTXQiq1xbPBJtMPYjELj+l6EXST9Au6e2/t1ei7aCquejYpE23YHeWG4HCeHFlDy7eXt92zYNiY4gQtmJ8cQnr/bwOtxzyFoRcsHXsZdkR3H3wM2aaM/2iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zKUeftUKFnfuTw3wVZ/PZGAwiMsF/0f/+8LOXL9RxSM=;
 b=fjL2/JYJ/YDdodgtQenJvEROwxFMR9l4Dc7Bhnfsug42Lk9aqifFh/P4NsPBc/QXGl+WhW/SVd3yV32iZg2HOeQ9FpjxB9NxGqV+uXDlfQLG2SF4K+nveLKK23UcbzBSVPXHD5kJ7KbEAbnGggkEHCnsFxRMZ26JkkCd98gNJ2gOAsRl7Rvo62paPf9CwNTOyuM6sui78QSdsc9mDB7Lrz2mlsNQ1CtNdRk364idrmADtT96X2w7sIMOzPZz7BBOfyh7MOzgyUmxrh4GsfquJtKkCooOqrqHHx2nDPDrGf7eSx4ORi7rm9IrjtyxvFEmiAHqZ1rR/b7TG9h3F6aGXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH0PR11MB4901.namprd11.prod.outlook.com (2603:10b6:510:3a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.18; Wed, 16 Oct
 2024 12:34:41 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.016; Wed, 16 Oct 2024
 12:34:41 +0000
Message-ID: <f6c09aee-281c-4263-a744-ed634ddd843f@intel.com>
Date: Wed, 16 Oct 2024 18:04:34 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 18/26] drm/xe/oa: Handle force_wake_get failure in
 xe_oa_stream_init()
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Ashutosh Dixit <ashutosh.dixit@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-19-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241014075601.2324382-19-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::21) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH0PR11MB4901:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b14efd3-eb6e-44d1-327e-08dceddee7bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjJ2c3RmUHlaUFFtNHNMVE0zMUd2MTRtRm9KMGtGV0ZWUVRNYnpyZWRoME1D?=
 =?utf-8?B?ckhoTE5PMERGVEROY0grRjJ3dFFQcitvQVNVekYvSlYwcXNxYUlINENwT1pq?=
 =?utf-8?B?L3paMmpqWlZzVDBWKzh6d0pZbkNLV09wM1RjcWQ4ZHoyNW1uMlRmU2d4aFEv?=
 =?utf-8?B?NGlBWXpPRTBPbzNwVUVTUlBLV0xZTGJsR2dZR2UydDRZcC9ValBQeDl3MHls?=
 =?utf-8?B?TmlnSGNTQU5aUmU5YkN4ZVVmMlpydUIxcjRwb3VKRlJXNDFzQkRjMElySlZ3?=
 =?utf-8?B?TG5mQnlBOWFCejlydysyZldGdTNnaVQ2RnVRUlRteXlGN3ZlMEx2Zng4ZUpR?=
 =?utf-8?B?Y1h0UTNYdFhSUXRtakQzQThlWGNWSExLazJLdnMrcThuOCtyN1NmTWt0am1F?=
 =?utf-8?B?dkVyaWIwUDFzT2x6cXBsN1VLODJaV2JtbGFJWS9RbndHUkF6WnBWK3N1Tk1v?=
 =?utf-8?B?RUtQZjZWRVhtWWcyVm9UaVBWdXBZWS9IaUd5WlZwUVNjOGRKOUJ0cG85YmVX?=
 =?utf-8?B?TWtpcjA3ellYOHFBL3V0dVh5YlMvRU92d2lvZmIyOGNqQjVHRWdEUjBKR0RV?=
 =?utf-8?B?RnZ6SGYvbHpNTXR2VFNBREY3b2JDNlFsajRFNHZyRjZ3dGZYNkF4K3M2VWpx?=
 =?utf-8?B?VTFsOWQ2cmZueVhhOTIzd0c3c0xyVjBSblQwdk4wcy9YRzBSWmFaMWlPWXEy?=
 =?utf-8?B?NHhYZjMzZnB4TGhhL2Uxc0xqNFl0ZVFHeWxYSXZ5YnFJUFVJZ1gveFF0Ym11?=
 =?utf-8?B?MXpZb0hmN0hJS2ZLSVArZUQvZGlRNVZXZmNxY2xrNXNvQkovYWFDdzMvS3RQ?=
 =?utf-8?B?RVovTTBCQ1RwVnU2a0xyRERTRWFSYll6NjNBemVYMEdhbzBSL3Bnamsyd2ds?=
 =?utf-8?B?UjFPT3h6M1RLa2tMc1JsYW1haUxBQlB6UWFLM0JGQkt5cko1WitZQ3FyZmlk?=
 =?utf-8?B?Y3hmVjQyTGZNVi9lQWFhY1hqR3c1bDRqZHBSV1VhM3VVaWY5cDhJK29BRGxj?=
 =?utf-8?B?WUJQdnpIN1RYQ3lLTjNoN0tnWGM5VEFDK2wzR01rZlo5OWx4NTlOR3dCUFBN?=
 =?utf-8?B?eEpFYUIxNGh1TWEyTEpDcnhZaWpXUExZQmV5a25zVGR6L3huUXY5QjR4VDRW?=
 =?utf-8?B?eE1sSFY5M1RxYWtmY3dPZTRVZmZLN1Y0bElaNUNzUWVRQ04zZGpTRWxPTjN0?=
 =?utf-8?B?b0xLczRIWHZOSTlPQy9adnByblhzQ1E1Q0NKRGRGOTBsNFljTkdBWUtSbVl0?=
 =?utf-8?B?UWYvK205cnRWbCt1Q24vbUYrVE5BWUJqZnh2TmpwaFJqQnpBTm41UHlQZ0tO?=
 =?utf-8?B?V3oxSkN5TGVvNGRRN3d5K3hRNStNUWxYLzZSbmxack1LY2crOW1YRVJZdERt?=
 =?utf-8?B?YkQ1M1FqbEFFaFpmUUwvekhmRlI3SFJLcVVCSHBldUdlb3Evc3BPdS95T3k4?=
 =?utf-8?B?YjRlMVJrUlZHSzNCd282cFFRcGQ1U1ZGekxoWkNDYWRsbTlORnpNL0NZajlZ?=
 =?utf-8?B?Um5Fb1gvTFNOY1daL0ErcGlOWXB4djY1b3Z5eE9sL0F6V0hHT0FUQ3F4TUtn?=
 =?utf-8?B?TktKQ0pZZE9ObFV4MFFWNWsvN0F3YWZ4TmZHMk5yVlFRQm9BNWtjZkRCZmlL?=
 =?utf-8?B?K1RvQVRyY2Z4OThGbUFBdkhDSis0Y3RRb2RqQXVGMFB4UW9SYk05eksrSmhS?=
 =?utf-8?B?cFdWemFDWUMwbTA3dnNVdVdtU0UxRGtNQWN4UkZJYnhpNkU0YldVQVlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SjVhelFGOXVPeGNqZzJHNG9mL2RVenVUekdDWXIvNGRhWW93dVZOckNlR1F6?=
 =?utf-8?B?bjNqYWppT3Q4d1EzMW5EelFTenJqSTBzWmNVZkIrdk15Sk9SdCtGM0lOZHpS?=
 =?utf-8?B?TkZKSFo5UktlYS9kbUJnRnFGLytJVlNEcjhJWWZhSy9RQlFyMEFWZXY2Y1VO?=
 =?utf-8?B?dklJWTk1bUVlQmVPbWlFVDdMN3dqbmtJNFpybGNmVVUxVkZWL0xoUTZ2dzlk?=
 =?utf-8?B?d0JMUjZ3a2RycVM5YkRkQlZSMnVhb1V6U1ZKbzJJZlRSV2UrOXZ0aFFoUE1O?=
 =?utf-8?B?dlUyYk9JSy9ieHozNkUwVUFJdWc4aHcxOU9RemlvOCtBbnEwQUFlRXFNem96?=
 =?utf-8?B?ZEpqUFVtSEh2cytGMDdKZWhxK2taQjhCVXBteERGeG9nVVpFTmRLRmZ3akU5?=
 =?utf-8?B?MEV5UWx1RW9aaStpV3dISVFKbDJ1aG1wWm1RZG11SzQrVkplNndadERmVmZN?=
 =?utf-8?B?OG03S21BMUVGeVg1ZWc5THc3aEtSTDVTb3M2NWNHK3NRdDFGWVdhL0pINkFT?=
 =?utf-8?B?c1FsS0UwL1BoR2diaFhwUFdLMWxna1dObzduM2tnaUVMN3VGOXJVcGRZTkhk?=
 =?utf-8?B?dEFIbjBHTHBWMHhmVFBZVFcxOXVFOHVvV0hRUmpzMVhkNXV3SlRGSlFCdW1q?=
 =?utf-8?B?dWVjT05raXVkd1k0K0c3eWpZa0lROTZxMHlDdnptODlEVFFITXlCalIxdEQ3?=
 =?utf-8?B?YjMyMkxwSWlQUkRZRmpRODVEeEJjQUhkRE5WUzlPemNRdGtCUEFhVWgvbHlE?=
 =?utf-8?B?VjV2V0RSdFZlT1V5dXBwUG9yRUhDbjFUUkZVWGpQU1NyWEFxZ2hFdy9WQ2I4?=
 =?utf-8?B?Lzc4dXZlVDR4S3JiNzZOWDZSTlRCUDczSXZpZ0ZwZjc3YXdLUlhuZ3U1U1FQ?=
 =?utf-8?B?dHArWkM1RTBBQkJYdFE3WWhUMEc0SThIZ2Z2QTI5a2E3UWxTTVZaM1FtNEhr?=
 =?utf-8?B?YWVXL3ZJU05HOEwzQlFsK2E0a0d0dDlpREhneUE2OUt0dkVPYXlvNHp1OFVH?=
 =?utf-8?B?c0FkcjBDTXUyQUxuY3pQUUVET2VMcGZnSlhyRERadjc5OUxLa1dPMW53MkU2?=
 =?utf-8?B?VnJmWXp6Mi95VDkxVjFxU0ZYNFoydWZPaXlncFhoNFhIdXZqRnB3WjV1K1di?=
 =?utf-8?B?RDNiWnFveW1zZXF2N01sdDl5WWxUWGdxNXFESzI0ZVVMUGdwU2FsNktvOGhl?=
 =?utf-8?B?MHEzU1hacmZmS0lZQWlFZmNjVEhTcUZOM0RjTCtYRWxiejA1VGV1ZHRJeWtK?=
 =?utf-8?B?QTV5bS9nMkhDbll5NkFpWWE4S1Jad25PYit4ZXEyYVdwSE5tcTFhbWdBZ1Ri?=
 =?utf-8?B?cVMzUGdvdXYrT0ZrUk4wTkdXZ0tzbGpYMFVUQ2xWbUlIUFBoUVdWM1dpTGRh?=
 =?utf-8?B?MWdrNWloYXdHS3kxeUI1bmowRENXK1JZbC8rbFlCb1prS2RKbTl4Z2JtODVk?=
 =?utf-8?B?c3dEVHhLUVpoY3pPQnZkT1orUDBtT0FkQUM4UkVTbWplRUs3OXNlWVJKOWdl?=
 =?utf-8?B?ODNiMnBDNUVHZ2Vwbm1yNzRrWWZrMWl2T05YTkxUdlB2M3l4TVkxWGt1OU5y?=
 =?utf-8?B?RGp0UmlXeG54OUtjMmJqMGhjWUxkSmY1VnY5anJZNWp6blV4eDlRUkFjY1pT?=
 =?utf-8?B?dm5VTmdEMitpdWtLdE1uZDh6eGdOamRpajlFWEVBdUZ1YWtqOGJjdUM2V3B6?=
 =?utf-8?B?SjVmR09xMWFOU1JnSHdyVVBvR2pJbHJjN2xMZS9ZbmtWZ09oYndiMHp2VVA3?=
 =?utf-8?B?NjkwWGlqUVI2WGF2U0x3Y3IzelFqbnhMSXJkQTBheWNnSnk2SWprdHZEekNV?=
 =?utf-8?B?NUwrNFNaMys0NjNhQ2dJbTJ3Z3pzaHE2Wk5YTjRPdm5DQW44WUZZOTJPU0xN?=
 =?utf-8?B?ejBTenhUYjlSRjZSUnR0bWRhT2kxNlppM1ZERHhNMDdsS3gvZUN3Y21MZmE2?=
 =?utf-8?B?cWZ5citXTlR4ZHdvdjBERkN4cFYvUWlGdDhXaGhXYUJ6RW82aDVaTURZMXc5?=
 =?utf-8?B?ZnlCQnR2aXRvRkREZWp0cVJVLzdnaWlLeWhieXZxU1JKQkZ5YTRIemlqRVdQ?=
 =?utf-8?B?NUtFaG8wSSt0VWFDOE5tS1MvejUvN2plb3ZXOEh6NWpzZU8ydUxwNEtDaEpp?=
 =?utf-8?B?eDBrTVdDa2srRnBmMGM0empkZERiSHN4dmYxNThIVXM0dmQrRkg5QkJENTNo?=
 =?utf-8?B?bGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b14efd3-eb6e-44d1-327e-08dceddee7bd
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2024 12:34:41.0022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBzFta8FotI4BXmOOpqGxnmSL6B5yd1rpCs0jSj7sxjy5juTOFSSzB0A8GkxVANBLxYH+RjwcjpY34ixVsZKnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4901
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



On 14-10-2024 13:25, Himal Prasad Ghimiray wrote:
> With xe_force_wake_get() now returning the refcount-incremented domain
> mask, a non-zero return value in the case of XE_FORCEWAKE_ALL does not
> necessarily indicate success. use xe_force_wake_ref_has_domain ()
> to determine the status of the call.
> 
> Modify the return handling of xe_force_wake_get() accordingly and pass
> the return value to xe_force_wake_put().
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> - xe_force_wake_put() error doesn't need to be checked. It internally
> WARNS on domain ack failure.
> 
> v5
> - return unsigned int from xe_force_wake_get()
> 
> v6
> - Use helper xe_force_wake_ref_has_domain()
> 
> Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_oa.c | 11 ++++++++---
>   1 file changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
> index bbe03db0c401..5951ea175533 100644
> --- a/drivers/gpu/drm/xe/xe_oa.c
> +++ b/drivers/gpu/drm/xe/xe_oa.c
> @@ -837,7 +837,7 @@ static void xe_oa_stream_destroy(struct xe_oa_stream *stream)
>   
>   	xe_oa_free_oa_buffer(stream);
>   
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL);
>   	xe_pm_runtime_put(stream->oa->xe);
>   
>   	/* Wa_1509372804:pvc: Unset the override of GUCRC mode to enable rc6 */
> @@ -1353,6 +1353,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>   {
>   	struct xe_oa_unit *u = param->hwe->oa_unit;
>   	struct xe_gt *gt = param->hwe->gt;
> +	unsigned int fw_ref;
>   	int ret;
>   
>   	stream->exec_q = param->exec_q;
> @@ -1413,7 +1414,11 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>   
>   	/* Take runtime pm ref and forcewake to disable RC6 */
>   	xe_pm_runtime_get(stream->oa->xe);
> -	XE_WARN_ON(xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL)) {
> +		ret = -ETIMEDOUT;
> +		goto err_fw_put;
> +	}
>   
>   	ret = xe_oa_alloc_oa_buffer(stream);
>   	if (ret)
> @@ -1455,7 +1460,7 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
>   err_free_oa_buf:
>   	xe_oa_free_oa_buffer(stream);
>   err_fw_put:
> -	XE_WARN_ON(xe_force_wake_put(gt_to_fw(gt), XE_FORCEWAKE_ALL));
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);

LGTM.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

>   	xe_pm_runtime_put(stream->oa->xe);
>   	if (stream->override_gucrc)
>   		xe_gt_WARN_ON(gt, xe_guc_pc_unset_gucrc_mode(&gt->uc.guc.pc));

