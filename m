Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A69EAC7EE30
	for <intel-xe@archiver.kernel.org>; Wed, 25 Jun 2025 12:23:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6621810E6FD;
	Wed, 25 Jun 2025 12:23:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eibtbD7g";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5867B10E6FA
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Jun 2025 12:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750854186; x=1782390186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=8f+ez7R+eopyKspea5x+0OJURfU8yomiISiwMOfEnvA=;
 b=eibtbD7gUpCXJx73sv9HV+TUlwmkoQwrNyn2mWRDjAsrBqPOvt85GW1V
 xeUZAU9IMOCQixmXr5k53w08BhMjzRTUuLKUUO0b/Plho/d7/zac9qV5r
 Ed69sXKgzyy1KC/BN5ss8ks4OYGd24sb0JKbGbSd/SERfJ2aShH6MYan2
 5bc7Wns3lGzXi4xbWtGrz9AsMXkngrZDMuaejdvgzpoozEvJzXnioXPLc
 h9aBlw5utowD8p4sJLAo4m/kg0345qqekOqPxsrbX+l9mpb36/pCKWT86
 /cTM1S2U8RLoONcbohAmt0/HGy35XdBefttbaDlifHUCQEbghhmnWbrNS A==;
X-CSE-ConnectionGUID: czZ5Oo0FQqiE1pqrtUiZWQ==
X-CSE-MsgGUID: hzVEe2LZRJSvehpdF5Gl+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11474"; a="53257545"
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="53257545"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:23:06 -0700
X-CSE-ConnectionGUID: jfat4lWsTiqmO94VZsOTpw==
X-CSE-MsgGUID: xbMmxv1TRaGq/wRk7z0SpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,264,1744095600"; d="scan'208";a="151962653"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2025 05:23:05 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 05:23:04 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 05:23:04 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.53)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 05:23:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=icxUH9nJj2jdXyoXrsTR44aVuPEwkkEvEfxYbRTsK51E50My2nEiA9Rdkz2HmCvqkbVSyE5YtbK2r2UmMCbhcSeZqoL+zplP9sDd77z48xaVjwdqTptMgc4Zal2Px8n+FxYR7ke7SeKD2uQxkE0q+1QsnGHwsQgQqMRUv16olTUxgMuwEqmdTse/ZXtYe7cZ66GM7V11TqLZEtMqhSguWaOpIkgdORfvc0kgCHT6wsFlii2myML9mjuiSldENr/GFMmBlcnN+MGUSBsyd+gVdSDHyrm72UOuZO+25dSkwglYDXbUnCQ0rZMBg/ZiOGp9oQgWM34lu1tlK3Cq/IOH3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tLIogKnlieshbcmWpOl0/FgUHdQMoIxnj3WUH2zo00g=;
 b=oo5E8LmzU4Wg6V2pQNwDMsCS8zk7ZPPplYHIlk4dZxzKxK9c7HRPoSAHdvnuDlztHRVEp5WfPvudZAz0vlj8oIucDJbuUlGKSZzs2Uq3tq2EefkcRidrYufcBy3pDtDWBGkOCqG9VXKrJDFRTwujMcvxL0ooWRdVwwb8ZN0dYS7Jonti1iaav0uxXGRztRQMuEKI+p2ViB+vIN4thR4sJwNmqenCf237hAF04sWE4KQl22oxgKfm5wdRIAwONrvKIhB8l27kYXro/aDgkkAdoW4Ejgq5lUd0bckJ4IVd3RyxODng7Hh2JGNCDUwhye99WmAXdYTS5EALut0qgqja2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by DS7PR11MB6062.namprd11.prod.outlook.com (2603:10b6:8:75::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.28; Wed, 25 Jun
 2025 12:22:58 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Wed, 25 Jun 2025
 12:22:58 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v4 4/4] drm/xe: Unify the initialization of VRAM regions
Date: Wed, 25 Jun 2025 14:22:21 +0200
Message-ID: <20250625122221.3061437-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250625122221.3061437-1-piotr.piorkowski@intel.com>
References: <20250625122221.3061437-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DB9PR06CA0027.eurprd06.prod.outlook.com
 (2603:10a6:10:1db::32) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|DS7PR11MB6062:EE_
X-MS-Office365-Filtering-Correlation-Id: 94dde18c-b1ca-432d-da7c-08ddb3e304fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RUFYdmpZQVJXY05ZRkM0Q1h2dXoza2p0QWorVnJRVnVONjZhQzJ3YjA2L0ty?=
 =?utf-8?B?ekhvbmhUdVY3T3R5TVIxVERZL0dwaDloOHd6NXM1U2NYMllZcnh4R0s1QTZh?=
 =?utf-8?B?aEVrYkkvRzhTUWRCNGtnNnBINnVzaTFsclYzTnhsWGdQWnNRci8yamx3QXRC?=
 =?utf-8?B?TjhuZk9pUE1tSDkwVGtmWmJnQ1hpYnNVSCt6RHlVRWgvY2x5TGVkZzBBR3Vn?=
 =?utf-8?B?K3o2M1VMSVlpUm1HSW1xVzFyazg1TklNTm1oOHNLdTVtclU5bkdUMWdTKzJl?=
 =?utf-8?B?MkNsUnpYcTdOYUNSblhZRmNmRGRWVDg2Q05zTWhzb3BaU0pHZkMwd2FkcUVi?=
 =?utf-8?B?SVJudENXdVVJME1TSStOMzQySVQ0VFJHTDg2Q0RMQkhPb3l4T3FMNXdzMWE4?=
 =?utf-8?B?UlZjQ09FeTIrWFVDSDNMcmt0MUtMM2VLVEhJN05sWHR5QkxLVnpFWm13b3gz?=
 =?utf-8?B?UHRMblZGU051cEVBSFRsdk9BbUNKbDhUMUdPek5FVFdaT241UVV3SUFVMVI0?=
 =?utf-8?B?SFJid1BsOXRVQmZmQlNEZFN3Vm9Vb1RJRlFGL2lnQXpjU2JFL2diSzF5b0g0?=
 =?utf-8?B?VUNBYXFPcW5vWU1jMm9leGo3VWdUM0ZVYTZLKzdiRnZzQjhSa2FRVU1SeUhl?=
 =?utf-8?B?WEVuaTVrdW1pdzhTamF6NGhvbU1XM2I0NmxBMTd6RFNZa003R0xKOHJmcGFB?=
 =?utf-8?B?Vm1vV3ZCL3RSR015QmQ3ZU1EaURNUUhoRE9FY00ydzBDZmVyM2RPdGZTeW0y?=
 =?utf-8?B?Y0hmMzlacDVqYjV2Y1h3QjN0ekFiMkk0L09jdlJBbkhoRDJxeWZUbk9oL2FB?=
 =?utf-8?B?SmxMZEp2a1lsQTg0ei9VK2IwZmFnRGordDhEOTcxSmQ5N1hVQno0VUdPdWlQ?=
 =?utf-8?B?cFVRdFhhOG5YSVZURUdrZzlqeUgvQ0R5Rm9vcjNJS3BiM2hWcldtYTZPSXl0?=
 =?utf-8?B?YTUwM1E5dGJGN2ViSUJBZUMvMGZrc2Iyb0ZzbzM1ei9LQ0ZlK0kvSUlSRUFG?=
 =?utf-8?B?eEhxY0hQa2kycUpGQVNVd0xibVFVVjhYTEU2am1FOTFVVEFzTXZhMHBBQXMx?=
 =?utf-8?B?aUptQWdqeFpSd1AyNkxmVEEzU3R2QjRBVWtnZzJLbHc1MVIxMUJqRDIrdEJP?=
 =?utf-8?B?UzMrVFBZWTFtTDRIRFZlVXJ6bTNnWFIwbWU0YmZtQkdud21TWU1pM29GSkEr?=
 =?utf-8?B?bThyb2dnaDlWTmVtbWEvUitzR2MxeXVzWDdOQ1dyUE5rM1FUd1MyeXpHNzVu?=
 =?utf-8?B?eEtpTi82dU1mWjRiUFpERWtvVHlkMzEwK1NoTGp3VXpQWWhNRWU3R0EyYnhw?=
 =?utf-8?B?aTV6SlpjZlBVOEVKRHphcnZ3WndCejZwbUt2YWxyc3JaRWtOblh0T2praWxo?=
 =?utf-8?B?eGZkaXZFY1VSQ3ZXSTJpbkRic1JUQTVYR3BUbi9yV3lQRnA5QzRPb0t5cnRG?=
 =?utf-8?B?WGcyNjc5OFpNRGpSWGVDd2NYN3NGWkQ4VGlNaGZrQWUzajQyaFBCL3VSU3U5?=
 =?utf-8?B?MUxhRHhLdHdmR3Z6cUFuQVpaVjlDMTEwL3dFM3p3dUJXcjY5em41Q0l6a2NH?=
 =?utf-8?B?dy9oWnBiblZheUF1SUlFNUhBMWpPNVFkZkdieEZZTEQvUkZ4a1pGMmJSWUZx?=
 =?utf-8?B?Q0x5QXM4Z0RURnN1Z3d2SVJtbzhBZVdpWjF5MitpWU9YK1REakZwNXJLQnZP?=
 =?utf-8?B?dWZ6a3F6ampLTG5ZWUJNRUpuSmZXcm9KVlU3ZmNjWTUzMnJpckV4dGpIUnEr?=
 =?utf-8?B?dTFmNmRhbUkyS3M0YWs3eU5HNVpsT0orVXNEY2dINEFMSWZzZmhLelFQZDZz?=
 =?utf-8?B?K0JRZ0xTQXFwQ3krbWVwMU1vbU5tQXRqSmJZTXJWZm0wbjdVOFRsdjdyNjYy?=
 =?utf-8?B?aTdvSC81K0wvK2tBcy8yNEtLWFBTbHBHa0M5b1NaZ0cyTjhWeU5JUVlUTWRE?=
 =?utf-8?Q?Njx7hYNyR+g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d2xDRzk3QXoyTGdQRURsMjhOdWp1TmNTeEdaN1ZtLzQ3Tk50YUV1OWhoZjJx?=
 =?utf-8?B?WDNrcmN3dVEvM2xhT05OMlV4RG1JL0hOaWxPVTVhT0JINFM3QVFqenFVNm9G?=
 =?utf-8?B?RW9NVlo5YXRlU3gyYnNRckJCU2RiZGpVaEgzNzl3WnFBRERPcTJ0M3d2N3NF?=
 =?utf-8?B?SUJndjh6dUlueG53VHcyZ1U3MS95a3hLNExFcjA4eTNTSFRxZE1BVW1DT1gr?=
 =?utf-8?B?SGxaN2VCSTRhRlliOVdHSE03Wi9WbHRxeWp4S0tzRFN0Vzk2NzhpUVJ2cWpX?=
 =?utf-8?B?SWFXSjg1cnduREVvMlpKWW42ZGlTMlZCY3k5d1UrdHl3ZEpCTVNVMlRaUzI0?=
 =?utf-8?B?YXVNV1A3TUVlN2ZteUhNaklJdEZIRUVpSGpQa0cxbDFpT01XSlFSdXVlOVdu?=
 =?utf-8?B?bW1ZS2FpcmNXcTBKV1ZaN1IxbWlKYVVTQzNxeEtTMUgxcnFUczBrSk5hUkpx?=
 =?utf-8?B?R2ROUHozbHQxSFVZenpvdk00cjYrSzRoazdySzJNeGoyZWZYei9WNWNrbkhB?=
 =?utf-8?B?aG92Ryt6b2V6VmV5dnZkMGhzVVE3bXYvcFAvQldTbldXdVJCWWtwVDF4L2VJ?=
 =?utf-8?B?ZmhQREFEaXdGRUw5Z3BIaHNpYXVCbHgyMldRNFdQS2pTYTQ4SVRGejJ0T1BV?=
 =?utf-8?B?dXdLUTdybDkzR1hHcWUxT1lHQmtSK25UV1ZrS3pacHQxQkltaktIcVFNVEoy?=
 =?utf-8?B?blo3TXZzYnVRL2NveWVGWVAzYUZwRHBhd0NyUTNxdjBQRnpsbWZwdjZjbTFP?=
 =?utf-8?B?ZXhjUWFhNFRyYW5KOFkvYkh5K2VKMTdaQ0JZUVpaamRhUnNsbS9pbi9GK1l3?=
 =?utf-8?B?bC9iOVFaMDQ5OEdIM0dHUit5M0MyckFmWVp2V3dHelJKdjQrd0VuMURZbm9E?=
 =?utf-8?B?M281d2JPK0JEWHhOTE9BTGR3Wkt3L3BQN3pnM1N5WVltQVBBOTFIQU9PMUhj?=
 =?utf-8?B?d3hNcjlWT1k4RW5Xa3NzMTc2eWJWMFVPWEc1TG5sWHhvTHJDTGFySnlGM0FQ?=
 =?utf-8?B?WEovMk1qOWlsUzdFb2NaS094V04wQUtIcjViaG96RkpGM3c5aVh0OEdOL0da?=
 =?utf-8?B?RFhqY05mZVJnZVM0SkJiSW5UMy95am1Jdnc2ck9wb0M5dzdwOVhsazR4WDY4?=
 =?utf-8?B?K2pqSG80djBaWFN1UWlZTHgxN3k2b3J2TU1iQU84UVBHY1JJcTVyOVh6TTBq?=
 =?utf-8?B?NXI2a1luaEJUZE9ncXlwSHNMdldXbFh4M2k1SzBybE04WVB4anlnZW1IZXVs?=
 =?utf-8?B?WUxlSEsrWi9PdU9LQndqdkUxWFcxRWY0SjQzZWJvbWR6N2xCQjVSbUdnSnR3?=
 =?utf-8?B?TGMycEV1NWpuOWFGUjZEdnVBcFBQMGdpSVR4NWJwbjhReEZxcERIcmZFZ01n?=
 =?utf-8?B?MkE1bGhsbGVRamxVVlphRHlrbnJRazJyZWdUMnNNOHhPaGRhUkYrTE1tNkNq?=
 =?utf-8?B?QzZyTUNEaDBJZ011SlFGRk4zaDBXUFY0M1RVRTdTVXY2RUtMak10ZFY3Wmt0?=
 =?utf-8?B?ZSs1OVNBNHZVT1pvb3pKTFNiK3NwaEVGcVZVL0kwd21vd1hHSFl6UitWN1ZQ?=
 =?utf-8?B?SFArTEJ0KzF6OS9WcGRhM0VVNGhKdG1HRjlLUHlFYkN4a2M1TUs0aVA0bGs3?=
 =?utf-8?B?UEoxR2xQMHNsLzJGdVpRVGF0VkZPcVhMbjB4MGdGeWZHRDFSNjliVXBSclpt?=
 =?utf-8?B?eHE1WU9ZaUdnWmg5QVI0Y3JhR01rNmVXcEE3Tm1JQXpMdTljRUQ1NjFHWGMw?=
 =?utf-8?B?bHpvaGgwQThkb25mZlpZVEZ4c0s3cXVKK3pLZzR0aXpIOFRZR1IvTXMyd0xJ?=
 =?utf-8?B?Y2xxd0c3NDN2dzBiRTBnMWZyY0ZiUnlPQWJYaW14ZmtsbjJLS2E4OW5CVjRD?=
 =?utf-8?B?RGV5RHdvbVFoN1BTQndEbjNwRktDUklBdHpuejd2TUZBWmxQVkFNSkVCWEIr?=
 =?utf-8?B?Wi80NGpsQ1VkTjZ4K2VCZU9yUGRnMlNxeXhZSFdUcnRydmtXRTQ1M09xVVVW?=
 =?utf-8?B?MldFaXljM2pNUzhRVmkrU3g3amF2TG1kd0xUeDdzRFBZMHNXQ2dHVHF1S2xs?=
 =?utf-8?B?K3REa05VeGFlcDlud0RNRENEY2oxMW5yUktYQ0o2K3JQdnRSVURtZVA3V2xu?=
 =?utf-8?B?RkpKR1F1T0cwQldOUys2Z2FucC9iT1o0VW5yaDhkMjBNcnh3czhTYkJCaEhX?=
 =?utf-8?B?UUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 94dde18c-b1ca-432d-da7c-08ddb3e304fe
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 12:22:58.0921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zk+hxqjS5xJlrtWBj4646vbHTxQQzCFT354XRXLHjDe2BVTDf1z2brzG8sPfHAmrCBV7FnkUL2aCMMpbYYo4ReAJJrGBV9Qs3XJAsPCCrQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6062
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Currently in the drivers we have defined VRAM regions per device and per
tile. Initialization of these regions is done in two completely different
ways. To simplify the logic of the code and make it easier to add new
regions in the future, let's unify the way we initialize VRAM regions.

v2:
- fix doc comments in struct xe_vram_region
- remove unnecessary includes (Jani)
v3:
- move code from xe_vram_init_regions_managers to xe_tile_init_noalloc
  (Matthew)
- replace ioremap_wc to devm_ioremap_wc for mapping VRAM BAR
  (Matthew)
- Replace the tile id parameter with vram region in the xe_pf_begin
  function.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  13 ++-
 drivers/gpu/drm/xe/xe_query.c        |   3 +-
 drivers/gpu/drm/xe/xe_tile.c         |  38 +++----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  16 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |   3 +-
 drivers/gpu/drm/xe/xe_vram.c         | 149 ++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_vram.h         |   1 +
 drivers/gpu/drm/xe/xe_vram_types.h   |   8 ++
 8 files changed, 134 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 3522865c67c9..9cb50e0ed9f5 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -23,6 +23,7 @@
 #include "xe_svm.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 struct pagefault {
 	u64 page_addr;
@@ -74,7 +75,7 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 }
 
 static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
-		       bool atomic, unsigned int id)
+		       bool atomic, struct xe_vram_region *vram)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -84,14 +85,16 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	if (atomic && IS_DGFX(vm->xe)) {
+	if (atomic && vram) {
+		xe_assert(vm->xe, IS_DGFX(vm->xe));
+
 		if (xe_vma_is_userptr(vma)) {
 			err = -EACCES;
 			return err;
 		}
 
 		/* Migrate to VRAM, move should invalidate the VMA first */
-		err = xe_bo_migrate(bo, XE_PL_VRAM0 + id);
+		err = xe_bo_migrate(bo, vram->placement);
 		if (err)
 			return err;
 	} else if (bo) {
@@ -138,7 +141,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		err = xe_pf_begin(&exec, vma, atomic, tile->id);
+		err = xe_pf_begin(&exec, vma, atomic, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (xe_vm_validate_should_retry(&exec, err, &end))
 			err = -EAGAIN;
@@ -572,7 +575,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		ret = xe_pf_begin(&exec, vma, true, tile->id);
+		ret = xe_pf_begin(&exec, vma, true, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (ret)
 			break;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index ba9b7482605c..f02987753779 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -27,6 +27,7 @@
 #include "xe_oa.h"
 #include "xe_pxp.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wa.h"
 
 static const u16 xe_to_user_engine_class[] = {
@@ -409,7 +410,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 			gt_list->gt_list[id].near_mem_regions = 0x1;
 		else
 			gt_list->gt_list[id].near_mem_regions =
-				BIT(gt_to_tile(gt)->id) << 1;
+				BIT(gt_to_tile(gt)->mem.vram->id) << 1;
 		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
 			gt_list->gt_list[id].near_mem_regions;
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 6f50c15d0cfc..1c3112233b7a 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
@@ -19,6 +20,7 @@
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vram_types.h"
 #include "xe_wa.h"
+#include "xe_vram.h"
 
 /**
  * DOC: Multi-tile Design
@@ -112,11 +114,9 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 	if (!IS_DGFX(xe))
 		return 0;
 
-	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
-	if (!vram)
-		return -ENOMEM;
-
-	vram->tile = tile;
+	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
+	if (IS_ERR(vram))
+		return PTR_ERR(vram);
 	tile->mem.vram = vram;
 
 	return 0;
@@ -154,21 +154,6 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 }
 ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() */
 
-static int tile_ttm_mgr_init(struct xe_tile *tile)
-{
-	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	if (tile->mem.vram->usable_size) {
-		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
-		if (err)
-			return err;
-		xe->info.mem_region_mask |= BIT(tile->id) << 1;
-	}
-
-	return 0;
-}
-
 /**
  * xe_tile_init_noalloc - Init tile up to the point where allocations can happen.
  * @tile: The tile to initialize.
@@ -186,17 +171,20 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	err = tile_ttm_mgr_init(tile);
-	if (err)
-		return err;
 
 	xe_wa_apply_tile_workarounds(tile);
 
 	if (xe->info.has_usm && IS_DGFX(xe))
 		xe_devm_add(tile, tile->mem.vram);
 
+	if (IS_DGFX(xe) && !ttm_resource_manager_used(&tile->mem.vram->ttm.manager)) {
+		int err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
+
+		if (err)
+			return err;
+		xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
+	}
+
 	return xe_tile_sysfs_init(tile);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 585bc1232658..c00f5782cb63 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -338,12 +338,18 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini, mgr);
 }
 
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
+/**
+ * xe_ttm_vram_mgr_init - initialize TTM VRAM region
+ * @xe: pointer to Xe device
+ * @vram: pointer to xe_vram_region that contains the memory region attributes
+ *
+ * Initialize the Xe TTM for given @vram region using the given parameters.
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram)
 {
-	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_vram_region *vram = tile->mem.vram;
-
-	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
+	return __xe_ttm_vram_mgr_init(xe, &vram->ttm, vram->placement,
 				      vram->usable_size, vram->io_size,
 				      PAGE_SIZE);
 }
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index cc76050e376d..87b7fae5edba 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -11,11 +11,12 @@
 enum dma_data_direction;
 struct xe_device;
 struct xe_tile;
+struct xe_vram_region;
 
 int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 			   u32 mem_type, u64 size, u64 io_size,
 			   u64 default_page_size);
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr);
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram);
 int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      struct ttm_resource *res,
 			      u64 offset, u64 length,
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index cf92a9aa2435..6cf85077d196 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -19,6 +19,7 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_sriov.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 
@@ -137,7 +138,7 @@ static bool resource_is_valid(struct pci_dev *pdev, int bar)
 	return true;
 }
 
-static int determine_lmem_bar_size(struct xe_device *xe)
+static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *lmem_bar)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
@@ -148,17 +149,16 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
 	resize_vram_bar(xe);
 
-	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe->mem.vram->io_size)
+	lmem_bar->io_start = pci_resource_start(pdev, LMEM_BAR);
+	lmem_bar->io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!lmem_bar->io_size)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram->dpa_base = 0;
+	lmem_bar->dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram->mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram->io_start,
-						xe->mem.vram->io_size);
+	lmem_bar->mapping = devm_ioremap_wc(&pdev->dev, lmem_bar->io_start, lmem_bar->io_size);
 
 	return 0;
 }
@@ -286,6 +286,65 @@ static void vram_fini(void *arg)
 		tile->mem.vram->mapping = NULL;
 }
 
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
+{
+	struct xe_vram_region *vram;
+	struct drm_device *drm = &xe->drm;
+
+	xe_assert(xe, id < xe->info.tile_count);
+
+	vram = drmm_kzalloc(drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return NULL;
+
+	vram->id = id;
+	vram->placement = placement;
+	vram->tile = &xe->tiles[id];
+
+	return vram;
+}
+
+static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
+{
+	struct drm_device *drm = &xe->drm;
+
+	if (vram->io_size < vram->usable_size)
+		drm_info(drm, "Small BAR device\n");
+
+	drm_info(drm,
+		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
+	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
+		 &vram->io_start, vram->io_start + (u64)vram->io_size);
+}
+
+static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
+			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
+			    u64 region_size, resource_size_t remain_io_size)
+{
+	/* Check if VRAM region is already initialized */
+	if (vram->mapping)
+		return 0;
+
+	vram->actual_physical_size = region_size;
+	vram->io_start = lmem_bar->io_start + offset;
+	vram->io_size = min_t(u64, usable_size, remain_io_size);
+
+	if (!vram->io_size) {
+		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+		return -ENODEV;
+	}
+
+	vram->dpa_base = lmem_bar->dpa_base + offset;
+	vram->mapping = lmem_bar->mapping + offset;
+	vram->usable_size = usable_size;
+
+	print_vram_region_info(xe, vram);
+
+	return 0;
+}
+
 /**
  * xe_vram_probe() - Probe VRAM configuration
  * @xe: the &xe_device
@@ -297,82 +356,52 @@ static void vram_fini(void *arg)
 int xe_vram_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
-	resource_size_t io_size;
+	struct xe_vram_region lmem_bar;
+	resource_size_t remain_io_size;
 	u64 available_size = 0;
 	u64 total_size = 0;
-	u64 tile_offset;
-	u64 tile_size;
-	u64 vram_size;
 	int err;
 	u8 id;
 
 	if (!IS_DGFX(xe))
 		return 0;
 
-	/* Get the size of the root tile's vram for later accessibility comparison */
-	tile = xe_device_get_root_tile(xe);
-	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
-	if (err)
-		return err;
-
-	err = determine_lmem_bar_size(xe);
+	err = determine_lmem_bar_size(xe, &lmem_bar);
 	if (err)
 		return err;
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
 
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->io_size);
+	remain_io_size = lmem_bar.io_size;
 
-	io_size = xe->mem.vram->io_size;
-
-	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
-		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
+		u64 region_size;
+		u64 usable_size;
+		u64 tile_offset;
+
+		err = tile_vram_size(tile, &usable_size, &region_size, &tile_offset);
 		if (err)
 			return err;
 
-		tile->mem.vram->actual_physical_size = tile_size;
-		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
-		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
+		total_size += region_size;
+		available_size += usable_size;
 
-		if (!tile->mem.vram->io_size) {
-			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
-			return -ENODEV;
-		}
+		err = vram_region_init(xe, tile->mem.vram, &lmem_bar, tile_offset, usable_size,
+				       region_size, remain_io_size);
+		if (err)
+			return err;
 
-		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
-		tile->mem.vram->usable_size = vram_size;
-		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
-
-		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
-			drm_info(&xe->drm, "Small BAR device\n");
-		drm_info(&xe->drm,
-			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
-			 id, tile->id, &tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
-		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
-			 id, tile->id, &tile->mem.vram->dpa_base,
-			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->io_start,
-			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
-
-		/* calculate total size using tile size to get the correct HW sizing */
-		total_size += tile_size;
-		available_size += vram_size;
-
-		if (total_size > xe->mem.vram->io_size) {
+		if (total_size > lmem_bar.io_size) {
 			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &xe->mem.vram->io_size);
+				 &total_size, &lmem_bar.io_size);
 		}
 
-		io_size -= min_t(u64, tile_size, io_size);
+		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
 	}
 
-	xe->mem.vram->actual_physical_size = total_size;
-
-	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->actual_physical_size);
-	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &available_size);
+	err = vram_region_init(xe, xe->mem.vram, &lmem_bar, 0, available_size, total_size,
+			       lmem_bar.io_size);
+	if (err)
+		return err;
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 9092ae86df22..802bd57e7c96 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -13,5 +13,6 @@ struct xe_vram_region;
 
 int xe_vram_probe(struct xe_device *xe);
 resource_size_t xe_vram_region_actual_physical_size(struct xe_vram_region *vram);
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index b0807f5af1d8..532f958f315b 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -18,6 +18,12 @@ struct xe_tile;
 struct xe_vram_region {
 	/** @tile: Backpointer to tile */
 	struct xe_tile *tile;
+	/**
+	 * @id: VRAM region instance id
+	 *
+	 * The value should be unique for VRAM region.
+	 */
+	u8 id;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -50,6 +56,8 @@ struct xe_vram_region {
 	void __iomem *mapping;
 	/** @ttm: VRAM TTM manager */
 	struct xe_ttm_vram_mgr ttm;
+	/** @placement: TTM placement dedicated for this region */
+	u32 placement;
 #if IS_ENABLED(CONFIG_DRM_XE_DEVMEM_MIRROR)
 	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
 	struct dev_pagemap pagemap;
-- 
2.34.1

