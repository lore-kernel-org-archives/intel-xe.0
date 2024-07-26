Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE47C3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 15:11:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DDF10E9C6;
	Fri, 26 Jul 2024 15:11:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TybXQOED";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D001A10E9C1
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 15:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722006692; x=1753542692;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=QWGf1rVGB9klLUx3BqD0u9j1GXk5zQgJ1x3IkaJbm48=;
 b=TybXQOEDcB0w29haSsPjdPxaz1ePAe4sRWpyvPaw8cMbRLbCkLEldpRA
 BsVuqRTbJSUs7n99BiFnuuGqJPKk5IAR5FAwgKLRhucn12zJKAPa7H1H4
 d14YAVxw31Xgf4+2bw+vE2lZwwP50bwyybZ4qdw/tFurNwJLqNkQixGtZ
 NkaTDexImcVe2662GMrAD+nshyNL3BtHmbI3zn97NShoeSjZ5cGo6oj0Q
 udxY8rmPW7CMejzJY5Xe0dJfp7b9C8ZfUv9elHPVP0IXRP/RWOxaMTa7K
 8Hxel2Q7NlLpSo25sNRLqJvHeCwzAdbQjJWxi9GlIRs63idOjL/xmePUh g==;
X-CSE-ConnectionGUID: blWB906UQGW76BXPB+i0MQ==
X-CSE-MsgGUID: xj8XLfTiROKnJLCfjJ3fiA==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19960311"
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="19960311"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 08:11:31 -0700
X-CSE-ConnectionGUID: 2xCTjrxmT5CotkNaGyt8xQ==
X-CSE-MsgGUID: QUXETPznQHiFRhk2wyZNzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,238,1716274800"; d="scan'208";a="53307960"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 08:11:31 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 08:11:30 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 08:11:30 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 08:11:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s2+t94hlMIa8Iy+gS8Pq6zikcKxdN4ChG3oQj4T6xbxVw4JUk9rtQr/R0KDcQAJCLWoV48c1Ivk2MZV3tzGcwXD/i1jbvYFgNEzakOXaGh6ysW+Q8mCtZPivielka93fLd7hTnvXa0ReIJQQFotHhnN3p1QOORW75JxAybeSz1BnHBJYXU0itwEwpZi5Aj2ysFZIoqj2uR4QziJUq6NKvjdQFleD6cJywxFROAEBLPmZkB+7mBqin8KHF2onuxJRQr5S0wFFNdgJo0SX+5AAof70a7vTQws16VNWDisPZ7vO/DoE0cqnB1TnlWh8T/JiqHNf/waAEhxedMuDTTegbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6UQ6hgbxtp64OpekHp7znUSyvKMsYoOaDrphrP7A3Tk=;
 b=h53k/Vg0PxysuTRzuaj7CkEXcdZc7wCxlBeuRzhYJ81IH5/gZF1agzSUkgCV2e5H2vxlTH486YxM8cNXa5Oh4XHczel5W9q1sbSwWzzYss02TE9jrL8R0XmZtTy68VRC4jI/yQeKaL0qe+/NbP1J5RVXQGifGjR94ps0sERE/Q2gNyoB6KATHHjU7a5nogTi5P86J4soui5Frq3k48ZoYpC/WgZgrhQSM/fQhKIm2pn9ZXDdab6VE/H9TsoQtcpVen92KYIRjYIMU7bhbqmHWFK1VZCbWRykWuMNC4nBOKMMg3guI6eyu4VsWWMZNk35THFIVAsVDQXBO59UVw5xnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7605.namprd11.prod.outlook.com (2603:10b6:510:277::5)
 by LV3PR11MB8673.namprd11.prod.outlook.com (2603:10b6:408:21c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 15:11:24 +0000
Received: from PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50]) by PH7PR11MB7605.namprd11.prod.outlook.com
 ([fe80::d720:25db:67bb:6f50%7]) with mapi id 15.20.7784.013; Fri, 26 Jul 2024
 15:11:24 +0000
Message-ID: <f97bb25e-31f2-4cf7-928e-52451a4ce96c@intel.com>
Date: Fri, 26 Jul 2024 08:11:21 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/xe: Drop pre-release GuC definitions for LNL and
 BMG
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240726012610.706749-1-daniele.ceraolospurio@intel.com>
 <20240726012610.706749-2-daniele.ceraolospurio@intel.com>
 <wzitchh3yzru3hbx4rewwmhdicp6n4uwxz6wrocj5tdnotxig3@l22weesvtnwf>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <wzitchh3yzru3hbx4rewwmhdicp6n4uwxz6wrocj5tdnotxig3@l22weesvtnwf>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0012.prod.exchangelabs.com (2603:10b6:a02:80::25)
 To PH7PR11MB7605.namprd11.prod.outlook.com
 (2603:10b6:510:277::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7605:EE_|LV3PR11MB8673:EE_
X-MS-Office365-Filtering-Correlation-Id: cc037220-3440-45c0-d214-08dcad8536b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ajNhSGg5elExcUZBYTVOVnVUYVVlWWtqdTMydkxIU09CdTRBek5mSVA2RWhs?=
 =?utf-8?B?VnNZblpNNjJ3WmJnR3dCOWpDaGMxb2NXK0FxNDdPemhqN3NDNjAyQ290c3gy?=
 =?utf-8?B?RW5wV0VJaWZ0dEZxeElOeHlTQ25EWVh3a1hMZkZiOHhJV284S2pic01FL1h2?=
 =?utf-8?B?VS91TTJoMEpOMEpEOHJwdEZzNWd6YnlralhkeWZTemNUOWN0eFljTUJab2VB?=
 =?utf-8?B?Tkl2bzZBaUoxMFJ4dDBYNEVIUzk1T1NFSE55bnFrU1dKK3BJUjFPcVlCcGVo?=
 =?utf-8?B?eGJocjdGWC8yOFV4UEdBSDNod1Z2eGY3VElma0JRdHdTK05UNGVSOXBqdkNT?=
 =?utf-8?B?K0VLRmxRZnp2ZjFhZi9ZczdRTkxPL2pCT216U2NEbHpicFZ5WDhjbTJnZ1RU?=
 =?utf-8?B?REFlOGdMbEc4WkFXaWVOcW1sczBZTFg3aFlGQm81U0hDSGZVUnFCL1ZLdHMy?=
 =?utf-8?B?OVhDOVkrbTRrOHFGM1JSTHhzY2xkbmdRY2FCR0FKNm1JQVNrcjlkdzV2SHEy?=
 =?utf-8?B?M2dzdk1DRm0zQ1g5YjVUTFh4bXVacUIvQlVJS3V3S2lwZjlPdGFETitpM0pS?=
 =?utf-8?B?QWY1NFFDUUNxZFVZQUMzckxWbEViTnplbEFVanNhNlNxaVdpdS9rOVQzdmwz?=
 =?utf-8?B?dTk2MHhIUFBhWDcrNW9MYnZLNUFCOGJFbzdIbEN6Qy9uYlRyb1ZjTGt2YkdG?=
 =?utf-8?B?Mjc1Rk90OWxmaWZMRVlJQmhoak9nV0FDVndjMmFVUHNQblY1NHgwdzVZanNI?=
 =?utf-8?B?bGMxQWZCUW1VRzJvQTMwejZoUHBpRVp2cnZMU05kMEJmenV1Y0t1WkVzWmFW?=
 =?utf-8?B?cFJnckM3TGZKWjN4djJQQnNlVGtSWHBaNTk3MVdkZ2lJTkRhbWU0Z2pSckRE?=
 =?utf-8?B?TU1ibXlob2FSWE9EZWJMdFo5WFZneWY3cXFlMHk1eG52RUJaamJyQkFoK3VQ?=
 =?utf-8?B?MFFITTc3SDZLLzJHamR0KzFWcHBkNDltdlJ2cUZGM1dLc2J3dEx2Rkl3dEhh?=
 =?utf-8?B?Z1cxUFBEcVNDWFM0N2EycGZXTWorYld5d2JEQyt2Y2YxcEVhcDJydDhKdEFY?=
 =?utf-8?B?dDlLQWVYQkV2Mit1RHBybHJsWDJaN2RwcE93RWJGRjF0RHB1YmdOMjU3ZW5r?=
 =?utf-8?B?TjVhSFZQeUNuZHJrS2pxUjVZYkdwbTloeDB5OEo3ajhWRkVZVTRZNS9mWmNN?=
 =?utf-8?B?ejlxQlhNUUJ4MDl5cWFzR1p0ZUE1Ny9JTkFGQnR0dDJDdXZxVXJsUVhPNkhF?=
 =?utf-8?B?TytzcEwxdlpNVUg2NXF2QmFoaVVYVUU3YjhsSXBQTmFRRzZxMjR0WVZxVE85?=
 =?utf-8?B?azZkTnliNzIyL2xldmJJV1plK0V2UmFMTjNWcWFsSFAxTkRKTHhaWUs0KzBs?=
 =?utf-8?B?c2FDc1FZb2JwRUhSRlpuQlltY0IwQ0k4OVRpYnFJU3h2aW9DQVY2TXFyeXlL?=
 =?utf-8?B?TFd0VmE0SVREY29tNFZYZm5sTHVVU2cxNWpERFEvNm1GbW1OQkYvaHFtaEtw?=
 =?utf-8?B?M3Zic1dEbDhuS2cxaSswVmtqOFk4RmtkRWg5VUFJcEtDMlg1U2lMN1haVFpy?=
 =?utf-8?B?N3RkSFVWQmhRaFNldUNGOFQxL2NuR0oxQm15MjRKbG1IbXA4Yk44cGdLUkh4?=
 =?utf-8?B?MElHZENXcDRxZm5aUTRldnROL0xLejRoWXVMY3hKS2pkOWxiT2tJdWYvaWFw?=
 =?utf-8?B?OHluUS9OdlhaNTFtT1E2bmpWN3FISXdTY3E1a2k2Rm5BdjBFa1RCSTBKYURS?=
 =?utf-8?B?U2Y1MlMwZFBBNWhrb01yZ0dRVWszSHRVOXJjV3VzVWI2MzNXY2NIOGxiMHQ3?=
 =?utf-8?B?bUg3TVlvMXdlaHYyVk40Zz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7605.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2dmNmtzRndueFdaY29qNkFlV3lScnNmdlZTNDlVaGQ2Mkp6V3Vja25YMTM0?=
 =?utf-8?B?WmphdW51SWRwKzV1SUVQWkpHZHhyWHlhelA0dng5SmhhTDdNZWVDclNWRGpr?=
 =?utf-8?B?TFV0cFFTWHpPUHZsMTJnUVJmeng5eE9aSEtmekQyVUwyNE9kYmF1ZFZDN3Jy?=
 =?utf-8?B?bUUrelRvdUtGYWJMUlpMYkE4THo3SUpESktsZDBwQjNOV0Qvb3c0NTFYWERV?=
 =?utf-8?B?UXg5bHRPaGYzbXI1UVVPYW5LT1VkMUw1cEw2QitPV0diRFdVTDhDcVFTQm5L?=
 =?utf-8?B?aWcwa09yTWlzR05aancxMGlIVTJHblo1UDgybGhLUFZicE5xaGV1YjdFRVRz?=
 =?utf-8?B?LzRMOUZORGp3U1JMdVhGR0w4RWd5U2F4bkYxeHd5ajVqczM5MnJHM0JUdFRm?=
 =?utf-8?B?L1E1c1lLS3ZXSUlpVEtQaFo1blYvZTQwdGwzMmk5ZHRMNHBCTHk0TUU3Ty9o?=
 =?utf-8?B?eXNWdTViSDdCS0FaN3FPUW9nRjBHZjBDUXFGMHJjd2RtOC9nMmY0b1dZUG0r?=
 =?utf-8?B?QnpPUDlFSXhheTZjRnVjOElTREFnZDJVWVdBUDF0VnBGQnBpQkRpNnR4MW4v?=
 =?utf-8?B?QUpuYy93a1daeGZ6Y1N2RlZ3Y3dhYUNRYjRFR3pySU83c2UxakNUVHNKYjNt?=
 =?utf-8?B?RXhzUGdRclhOUVVub1llUjEzMWhLdkRJYlEwVW01dFh3R1N1UHN0em5yTUVk?=
 =?utf-8?B?dGZLaCtZT29mVm9ZR0orYitLUWVuOENmNGdnVnd6QWNBb2FYMGVBS0pRWUky?=
 =?utf-8?B?eVZYOXNVa08vU1VCNGpnN1ZBQ2ljUzV3WjE5VUx2TVIxWkFWUHFuOC9KOTlZ?=
 =?utf-8?B?eWlTSW1teFYzakkycHROV2lQeXBkQ1lkVDZpNVNPdmJDdUhxL05HVTZrQnM1?=
 =?utf-8?B?R2xMZTdHdFpPeXd6NFNvc3huaGgvaSs3NElnVFl0NEJTTklJUDNBblNxM1NG?=
 =?utf-8?B?bXY3aElrK1o1Qi94Q3dMa1Z0Si9nVzBYd1Z3cjhNMW4yU1ZITjIyNHNwUDlB?=
 =?utf-8?B?Mk9COW1xSnZGd2RQWjhTVktqNG9KcmdCL3pJK2JFTVY5L2hJNWpGNVpJTmxI?=
 =?utf-8?B?ZDBBUStmUUN6b1FrWHgwcG9BeVlzVzFsNzBLdHl3NUdiWEtvQjlkT25TeWpE?=
 =?utf-8?B?K2dzTnlGMHBDclZGK05QRkdib3RzM0xlUEhXd25WUlF3dDRvVlZneXBLMU14?=
 =?utf-8?B?Z2hMaVprSGhqWStUaHRDSlRXamJ1aU5xU1N0RDZBRS9IdXBCZ0FzSE1Id3dm?=
 =?utf-8?B?M2taKy9tNE0rQUVUU2VrQ0Z4QWtxaEZrTXU2OWNYK0YxcGkyVTF3ZFhrTkxl?=
 =?utf-8?B?T0NiNER4eWsvc09DOXgvYU94OFRHT014UTdhbEprL1dCaWJDTElVcEU5eWpl?=
 =?utf-8?B?dmY1TzdpbXBNWmlmU2JJa29zRDlsSUo1TS9JRncrYUNZalhrMUdzNWxYejNB?=
 =?utf-8?B?R0JhS3Z1cTFhbWdoTE95a0xrYVRvOFBoTXFOaHRmODk4MHNlTGhoOGdnQ2VE?=
 =?utf-8?B?ckg3eVd2Y3VVNXR6OWRiYUVBTWN1dW5HTmFHTDZhNFNhaTJDd042Ty83dDkx?=
 =?utf-8?B?QXFrUFZxOTRPTjNSUEJCRE1nWkRkUnVUVXN5R0M4WWIyR1pSME15Zm5yV0hm?=
 =?utf-8?B?RlZpazZObFhQU3RPVG9FdXV0cEorWko3Mll3NVRjdTEyQzJJdGcxVVVGVWpL?=
 =?utf-8?B?WHBXTzJvVjEvVkdya3NDTlJ0Qk9IWEt0aDFxT3lRR3dzcUI2L0U4UGQwV3hK?=
 =?utf-8?B?Ry9oTmduYmFhNVBScXZoNHJSSG5abzFwMzlXRUd3NzE3QUJLV2FzNjZoc2Vq?=
 =?utf-8?B?dzJaUk9ia080R0JCK2FxSG15bTA4dDQwbmoyQnVTZE4wK2l2dFFVR0xNMytp?=
 =?utf-8?B?dm52ODNoZ3pIQUU0SVJxRGVSMDFVS0kxR1pwWWpvSlBua3JDQmdYbTFHem0y?=
 =?utf-8?B?L2xOSjNLcVc3eEp5bGJORE9VL0dwTFBoNzhHVTNNZWhjVmRlK3NROG45RlNv?=
 =?utf-8?B?MEJqOVBRb1F1TXpOVWdzTldMd1BxU3NUTFIxWWxKcmpCMEg2RjNaN25NWGNk?=
 =?utf-8?B?U0o1cG16bmtqRS9hY2pxdUd6UUFtMDk2aHlkL0VZSlVIOUo4RXVrdG42d21z?=
 =?utf-8?B?Wm05Vnl5YitEMGZOMURwL2VPaGJWbE9VZkVxVDJUNndwK0tJRFdSWSsyOUtl?=
 =?utf-8?Q?0fFnFdq/1cDUo2BII2zrAWQ=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc037220-3440-45c0-d214-08dcad8536b7
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7605.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 15:11:24.1366 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: psvegjDuyMsTb0dEk4DDpQS7XdUlUsM5VCFgKTLXjJgqjyBTOi15dVpuxGcvFCj/k+yApxw1Eu8l+ByTbOF93mGRV1Pp6SlV61HBHMO7WaE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8673
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



On 7/26/2024 6:57 AM, Lucas De Marchi wrote:
> On Thu, Jul 25, 2024 at 06:26:08PM GMT, Daniele Ceraolo Spurio wrote:
>> Now that we have the binaries ready to go to linux-firmware, we can
>> remove the pre-release definitions as a prep step to add the final
>> defines in drm-xe-next.
>>
>> Note that this patch is meant to be squashed with the patch in
>> xe-for-CI that adds the definitions
>> ("drm/xe/guc: Pre-release GuC firmware v70.24.0 for LNL/BMG/PVC"). We
>> can't just drop that patch because we want to keep the PVC FW def.
>>
>> Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>
> while applying it, can you reword the commit message so the remaining
> commit is just about PVC?

Sure. I was already planning to do that, I should've probably made it 
clearer in the commit message.

>
> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

Thanks!
Daniele

>
> thanks
> Lucas De Marchi
>
>> ---
>> drivers/gpu/drm/xe/xe_uc_fw.c | 3 +--
>> 1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_uc_fw.c 
>> b/drivers/gpu/drm/xe/xe_uc_fw.c
>> index 6b92255a769d..c0ff44e0b0ea 100644
>> --- a/drivers/gpu/drm/xe/xe_uc_fw.c
>> +++ b/drivers/gpu/drm/xe/xe_uc_fw.c
>> @@ -105,8 +105,7 @@ struct fw_blobs_by_type {
>> };
>>
>> #define XE_GUC_FIRMWARE_DEFS(fw_def, mmp_ver, major_ver)            \
>> -    fw_def(BATTLEMAGE,    major_ver(intel-ci/xe,    guc, bmg,    70, 
>> 24, 0))    \
>> -    fw_def(LUNARLAKE,    major_ver(intel-ci/xe,    guc, lnl,    70, 
>> 24, 0))    \
>> +    fw_def(LUNARLAKE,    major_ver(xe,    guc,    lnl,    70, 19, 
>> 2))    \
>>     fw_def(METEORLAKE,    major_ver(i915,    guc,    mtl,    70, 19, 
>> 2))    \
>>     fw_def(PVC,        mmp_ver(intel-ci/xe, guc, pvc,    70, 24, 
>> 0))    \
>>     fw_def(DG2,        major_ver(i915,    guc,    dg2,    70, 19, 
>> 2))    \
>> -- 
>> 2.43.0
>>

