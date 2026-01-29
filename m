Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16150D358E4
	for <intel-xe@archiver.kernel.org>; Thu, 29 Jan 2026 09:10:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA4A10E83D;
	Thu, 29 Jan 2026 09:10:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DrH5qnBw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C96410E83D
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Jan 2026 09:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769677814; x=1801213814;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FUXrWpbjnKX3dTFfGCuEzfvwMitHc5DVxjMrtyUADpk=;
 b=DrH5qnBwHyg3llUf1/jgUJiiCt5X22VfA5G7wjz/523JwT7xPlGpfYWJ
 TTMgmPwrqH7dnyvNlvaorac4p1ujGcwiqzAbV/8UR9EcqvOQMsW0BJYZT
 SKa2KEC4h5nmR40Ufe08TZ4Hhkywo3VviWGkzZubVnmApp2GMqgm5LHdW
 ELhv7aqChvrOLSFlzC9KR13suiPsouVGBP3bO9ezB01B9041ob7eHx9iE
 outHtpre4rGjFTCl8j1ChVIu8OJCC3WTBIvfn74VrC7wf4Jcy96wJPEhB
 Jn8d8aP7uJ5bHhjk0ZSvBDyhjIhSy/FF0TH0mfb9lSQVF3YTHCYGcASgg w==;
X-CSE-ConnectionGUID: 7l9MMEOmTVGefMOBtMp0mA==
X-CSE-MsgGUID: V0usYCa5SqeCgdmLY8EM1A==
X-IronPort-AV: E=McAfee;i="6800,10657,11685"; a="70961409"
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="70961409"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 01:10:13 -0800
X-CSE-ConnectionGUID: W9J8XODbQUWDWRMzbVJfEw==
X-CSE-MsgGUID: Pt0isWgmS3CFkHP+nDvoEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,260,1763452800"; d="scan'208";a="208625867"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2026 01:10:13 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 01:10:12 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Thu, 29 Jan 2026 01:10:12 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.52) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Thu, 29 Jan 2026 01:10:12 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9waR24aDz+tFypl6XOXToMHg9VQsdyVHZspTO9kkPMV82TuYR2+UhCsD9r+PBoK/DDjMnX1WYe6JQjvXIpk2ETglQYWJ2wf+gzWGkdkUvKZcfn0ka4vyWSpDmHXav81qBA5RvcFrSgtqTfgi/mtLEobx9ovzsrSb5PuiKqv50ECV9d2X0NI2vUZBlgjAD5AiQZ6v1yASFlMQItb7mMrE3E5rnxGJ16KZYkiQh2u7/mOiv98YVwUSRKbMf/CueaJUkvy8XyvYhaNOkQdNwD7Iz0ZXLId0WCwA82eC5H5leCQtd/pkwk0Rxj6p05AVuXNpYdlS7QaxoFH21dczVIk6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sj/FGY0/U/z9aQaOii007niQDRDyujHpqjNdQm1pv/I=;
 b=sKIasS0SRgr93rKMzdoU6/qJ9qNx38lhhUrYx8r0vhjGAxoewV9J0tDkVoLLAGCSZpbBwHS5vHAdWMwkVDMaXYqmUBVbqPThZeMk3UA3O4cdsmP4JiwoCT3kL77f1Sukfna0MigyxhpuKGKG1SyZ8V+OpyGUKeEaUBMeWKfQd/J9uhRYHwPdlMsLzR4QIpXVLGSzYuor43DSoUzqAwaZphN2ywI3RpX9B9GEKx+F1YfIGry4bApauX/y8LDhO4YHw66bv0HzKyWbXKI7BfmxaHMpvayaZE/tDHxSBN8MDioG0gF91r+8e0TgGlTR3pJEU6R3rk9u1FtmMPQagWYVow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by IA0PR11MB8418.namprd11.prod.outlook.com (2603:10b6:208:487::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.7; Thu, 29 Jan
 2026 09:10:04 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9564.006; Thu, 29 Jan 2026
 09:10:04 +0000
Message-ID: <baf0c1db-6904-4e3a-8a30-1f56c015796c@intel.com>
Date: Thu, 29 Jan 2026 14:39:54 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/8] drm/xe/xe_pci_error: Implement PCI error recovery
 callbacks
To: Riana Tauro <riana.tauro@intel.com>, <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-12-riana.tauro@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260122100613.3631582-12-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1P287CA0007.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::24) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|IA0PR11MB8418:EE_
X-MS-Office365-Filtering-Correlation-Id: d3720329-eca3-4858-9c80-08de5f163085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MStpREFPQzUvajNlcW9IbkY5a3dkenZ6eGxXNlFGcGZKUWFMWGJSQ3JXNGlJ?=
 =?utf-8?B?SzBHdmtxUDVXRnl5OXpZQkZ0NzZhV2lxRkV2VGZCcmZ4aFJLOWtDOTFBZ1JM?=
 =?utf-8?B?bkc4NU15V1lNS0hNVjFSYmVYREFzTndKcjZlcnF5clFKaTZibFRubDJuNEw4?=
 =?utf-8?B?Smw1NnpBRERLSTFLUm5HL3FQdHhGUmxlQXgzRGpiVWVDbnFTaUZoMS9iYlk5?=
 =?utf-8?B?VzFSdVcrL3RUZjZNTlp0NGpJMzhHYXdpZGp6dDFSZmJlS0FrdTdGcWloL3I1?=
 =?utf-8?B?bjI5K0V3b0ttMUdRWmdZUGdqdllaSHFXS09yT3FnMHZ3VzByV29MczNDcVJu?=
 =?utf-8?B?bTlFWVEzQzJkZG15S3Eya0JYMTAzWW5ldnRPV0FZWldtaHhvVTA4TFBpU0Fw?=
 =?utf-8?B?Y3pvcWE0Y2ZpRXcyOGlSeDhlQW1SaFFKMno4Um5xRFFDRldRaGhGY2RjUXVo?=
 =?utf-8?B?RGl5Z25ZVncxTWNBUHUxTTVjOVNJcW9oTUR6QlM5b2tyOGIxNzJUSHJkcDlS?=
 =?utf-8?B?b0dzRmhjcFJiakEyU2Fya0RBakg3MkxOa08zTXdvUnhYdEs3clc3MEQ5VVBw?=
 =?utf-8?B?dXI4Mm5RQlZMVkY1cmNVMkxQYlVRSFBzUUNtY3U1Z2pEWFJwSGxlTGx4Q0VI?=
 =?utf-8?B?VmhSU1M2TUl5S2tRbkY1bEx2cUxEcVZUZWZoR0VPSlgvcUJpZWJoUnZGbWlO?=
 =?utf-8?B?YU15eDJnU1dBeXptSGlocWxvK3V6Qy9ISnA0ZFNya0o3Q200MldQcUIzREFl?=
 =?utf-8?B?TC90ckdiaXJvMHNscldkejZiU2xFNVpmZG9IRjFsTVNTWE1pZC9sUU9tanpr?=
 =?utf-8?B?akhLblNPZTVxeGI0UE53UzdHUEVxTVpMaEVPbXptYzdDVWlSbWdFZmU1WDRh?=
 =?utf-8?B?L3VCS2UycDV1djQyZkhTK2ZXTFhDdzNSaU4xM1lWRENIQTBQeXFaaTVLVjR2?=
 =?utf-8?B?Z0xkelEzcWQwMU9iQ3pxTUhMRkxtY3pKY1ZBYWpTbHowRjZ3UjhzYTFrRXcz?=
 =?utf-8?B?M2NzVUpzOWJ3L2s0dE9wQmZObm52SEZ5akVKN2FYSUp2N0NmTGhFQ0h1bUpS?=
 =?utf-8?B?bzNHK2tTSW1nZ2Z4QitmaGM4OWlwcUhXa3R6OUhBWXh5Vmp2VC80dVVPUzJQ?=
 =?utf-8?B?THY0M1NPNDY5NDBTd2R3STdoUW1XYnV2MmtpaW9KZ0h4UGpPbmtYdGNMWklh?=
 =?utf-8?B?RFM0NkFlZ241d2JwN251OUVFYUgzZllyZEVFZ1hyd1VWZ2tqaGFrL3BVZWxQ?=
 =?utf-8?B?NTNnbkxNY1RmelNna0ljMy9pSEd5dkZRM043RUNwU3pWL3hOSncwZEZTbzMz?=
 =?utf-8?B?NFZNNm5tR2psbnZTM3VTcXJYQ1FUUWhvdXlFTG1wK25wbEVTSzZvdnF3TVVn?=
 =?utf-8?B?K2VVVTN4b0RhZ1ZXMCs4WE1ZWjhjM0FVTFpoUU5jVUpEY09USHlmdEJVTU9S?=
 =?utf-8?B?bzgwK293WDcya2hTSGJ0ZlhWYXJyUUFQTHpSd01ZOFZ1TmpPakRaUzYrcWpn?=
 =?utf-8?B?eTI0YjFnUlFMOWtON2oxVElzMUxmeHhpRTV4UEtNaXFER0cwMWxIQWk4dnRH?=
 =?utf-8?B?Tjk2dVd5WTFqUnBmaU13VVJVMmpMTHQyT2JSVDAzUnBxczBibTJWZDg4cjVB?=
 =?utf-8?B?Nm4xKzRMdys4OU9QNTZRZzBkUzluanpqcndOVGlhZWRleU9ia09PV2czNkEw?=
 =?utf-8?B?N1cwU2w4UWZ6RDBkOHVZUEpaeUdQbHpwdFdxRVNickZmT3ZxWlZqSjMxaFZH?=
 =?utf-8?B?RkJjOGdwTGNVc1ZYSHdhQWl3NEVvbit4M2swc2h2bzY2Qkc1T1VLUXlQS1RO?=
 =?utf-8?B?SU9nb1VvK3hxREtDSE1mWjhHbktWcUtudDU4Vk9QMHl6YjVMeU1UZjZyS3N3?=
 =?utf-8?B?aG02dEJyNXU1bUFQSGlXNmJDU2NxeXJSWXlqY1ZkdTZxVEh6ZUtOU2JvbVNC?=
 =?utf-8?B?K1IwMDdUN1RsTVhxTTliai9laUl5QzdPdkppWXNHZ2k1WXJ4bkxUYXdIdzBY?=
 =?utf-8?B?OURidnFnWlFRL3JkRnpxSWxMdDlGTUhEZ2dWRmE1QU1YRStTR0l2STZZWGFI?=
 =?utf-8?B?SzBLKzBTQkRwN1hvUnZXVlBManRPdXJtZS9sUXVaS0N2REhrYS9sWFc2dlli?=
 =?utf-8?Q?R/mg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WlhYWEVSSFB1bGNzT2Y5OWg2SDhyYUJJR1pzZTErTzhXVGxxaDREZHZmMEU0?=
 =?utf-8?B?MU5HVXM0Wmc1RWgxOHphaThNQkxjV2RWV0VGaXQrdmNiQkQ3eTZaa2kzOGtl?=
 =?utf-8?B?d0FTbFBNeDhJb2JlNEtyRjRFL0srTzltdGpxQzhUc0t0Z1pmZ2daUlNFcnhs?=
 =?utf-8?B?SStpdFdGYWlKaW1yY2ZESEthQ0Y2ek1MaUpBdkRDdTc2WTczbUM2aW51RVFr?=
 =?utf-8?B?OXhSczdjRkFiZnVMZCs0VC9vZkY2elFzZTFnaUxCaXRNckpuMUVaMklWRXNJ?=
 =?utf-8?B?bUpLZTNjRWFYNHJpYzJxZW9TYlRCREZnaVNkL2d0dWJtdzBQQ0tjeklmZms1?=
 =?utf-8?B?ZkFlUFE0WTI2N0w3a0I5VTRTUXBxMnVnT09hVEtZMW5kTVZ6cjZTbzN6R25y?=
 =?utf-8?B?N2xNd3dLbXBlbis0SWVENG1GUm93T2xxYTA3U2ladVppd0pycjVhMlZQY0FB?=
 =?utf-8?B?VWREcGN3ckhSOGtmODIxYzd0NEZPMXp5WXFIRVFKSG55dm5xYXgySXZldlYx?=
 =?utf-8?B?QXZvZTdJYXVEMCtRWGgwQmxzRGtQSnVYRWpuMEluRkU5QlJjNTMxSDAwNHd2?=
 =?utf-8?B?bjB0TTU3dllFZ3JpQW5qMG8xczl1QW5IN2tJeTVTTXEyZk5PdngxbWpJamZV?=
 =?utf-8?B?VVRnWmZuUVlISzBIUjJMbjV5QndLSURlMGplcGRJU1RiRVJ2V2NHT0hNb05V?=
 =?utf-8?B?bDBVUllpdXhLbWcvM0Z2QVlram92VlJ0WWc5UmtmVFVXMnJkeFhvS1RTZHEr?=
 =?utf-8?B?SkVkT21Mc3oyWmQwbEFlU2doQWd6cnk4dEMvUS80YWxXV1hqTGlUellZeGdM?=
 =?utf-8?B?WDZ0UDVxQlk2SDNvb3hHOHFRV2UxdDNuNE1TNFkxNHpCaXFEVnlPMWoraHB0?=
 =?utf-8?B?V2NabXRkbEloRm9jR2s3T3dBQStzSXBUSTMyZnBSbnNqUTVHc0FQU1ZIcXFW?=
 =?utf-8?B?QXZhRVFTbXBPWmRkOXh5RmlIVDl5WUl2djZVWVM4RVp1MHk0TDM2R3R4Y2Vl?=
 =?utf-8?B?bEsyam4yM1pmbTk3b2xmL2Ywa3Q2NDFuNks2VWt5MWZ2NjdqZWM1Vk1tM3pK?=
 =?utf-8?B?bE9ST1o4ZXEzNHBHVnQvNWoreTRXOEpwQmN6b0hsNmlkNEhiU3h4K1NUT0sx?=
 =?utf-8?B?WVA0SEdhbFh2TEowcHRRRWZ6eVlhUGd4STBkY1czQnNESEZGT05XWTExS2xJ?=
 =?utf-8?B?MlpMYzhUVlk0N3duZG1TYk1sZzhXVlcrZkQ0Z0VhTlEzS3NlbkhaK0Z5a1Ex?=
 =?utf-8?B?VEJqMVp4bmRVZ0xIb0luakdVWE9Bblk0Z0tWSWZHY2U1a294OGkrUFlmdDgx?=
 =?utf-8?B?YWVOYVNSQnp4bVN5cHhycTZHU0QzYVZEbmxPT0Y4djlsOVV2ZmFEYzdzaEYv?=
 =?utf-8?B?OVZNMGEva09nQ0syeDJPa2ZoZisrQ0I2VXFJaHhWVE5NZFBPWkJmcjgrQmxl?=
 =?utf-8?B?Wnp3Q0I0TzE1SllWZVNHbkxlSm9DVDRIQWQwdU5aTnVUTVJMbzlDTzJaamU1?=
 =?utf-8?B?N0YvTUpVME1DbXZyQlpOQ3pKUzVOb2UrN1plK1krejkwOXF3allFdW53MEVi?=
 =?utf-8?B?ZFZ1L2ZEZk84dGlqekhSNmd5UmQrT0lTZzN1cWNNTTE2VDFLYVpJVU5IcVl5?=
 =?utf-8?B?YXJvYmhjMjJPVDJIeWJEWE9iL1Z4Z3VqNDYxVWliajBvNHhWVkR6cHpDUWkz?=
 =?utf-8?B?d3NlcTYvQm9kL0tGbzdDd3ovQUtmRGRkeG1Wei9JamJnbnRYZEsrb2VqZWNi?=
 =?utf-8?B?b0s1cnoxMzJVd2VQbXA0YldYa3piMzgrVnBsbXYwaWd5clAvTVVzUXBPRFNw?=
 =?utf-8?B?dHBocHVxdmo0S2g2aitoV2N3clp0bndWNWhVSVBUVjBhdU9vNGlpR1RHdXB0?=
 =?utf-8?B?WTVsdUs4NHJDOU85QnI3dVQ2eklZcEFuVk5zaTNtaVpqdjBTVUdrVGpvNDhy?=
 =?utf-8?B?ak5aLzBDNTdBK29yTXovcys4N2J2ZWVDYTdHUmhrK2d6ZEp3Rk9PL1lSM2tO?=
 =?utf-8?B?Qmt5dkF0M1BEQ3lKb2paMm05WTg0M01kUUluK0RBZXFaMS83TlYzb3ZtRUp4?=
 =?utf-8?B?UkpzNEJHRFFZMzNDa1V1ZWQvcGtMV202VmV1MWgrS3RPSTBGWTBZbS9oT3FJ?=
 =?utf-8?B?UVkwbGEvNERjWjZxMHl4UDNjSmVRVVVyYmlHNm9MK3BZV3FKem9vclJyZmg0?=
 =?utf-8?B?a0lpV1ZMM0tNNXZDQ053L0ZLRUVHeWdMWGZwclQ3Tmc2eFFhYXZCNEV1clNu?=
 =?utf-8?B?YkRPNTQ4eHE0LzlBcXU4dGdyWDhpMmM2S2lVSDVPTW14NVlyczRQSjJNRUZC?=
 =?utf-8?B?QjRaK3hGQVFBZG1GdFRxaU8wNWJhVnh4TzNHQlpSeXk3TU5BZ1lkdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d3720329-eca3-4858-9c80-08de5f163085
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jan 2026 09:10:04.2770 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Py3I/zOAv9vGuwlopUoggY8lqehqDJli1PEzGyZquHOrLjAOpHClibkTGzP0yHelqERCRXIsd5Q5+afMaRgNkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8418
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

Hi Riana,

On 22-01-2026 15:36, Riana Tauro wrote:
> Add error_detected, mmio_enabled, slot_reset and resume
> recovery callbacks to handle PCIe Advanced Error Reporting
> (AER) errors.
>
> For fatal errors, the device is wedged and becomes
> inaccessible. Return PCI_ERS_RESULT_SLOT_RESET from
> error_detected to request a Secondary Bus Reset (SBR).
>
> For non-fatal errors, return PCI_ERS_RESULT_CAN_RECOVER from
> error_detected to trigger the mmio_enabled callback. In this callback,
> the device is queried to determine the error cause and attempt
> recovery based on the error type.
>
> Once the secondary bus reset(SBR) is completed the slot_reset callback
> cleanly removes and reprobe the device to restore functionality.
>
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   drivers/gpu/drm/xe/Makefile          |  1 +
>   drivers/gpu/drm/xe/xe_device.h       | 15 +++++
>   drivers/gpu/drm/xe/xe_device_types.h |  3 +
>   drivers/gpu/drm/xe/xe_pci.c          |  3 +
>   drivers/gpu/drm/xe/xe_pci_error.c    | 85 ++++++++++++++++++++++++++++
>   5 files changed, 107 insertions(+)
>   create mode 100644 drivers/gpu/drm/xe/xe_pci_error.c
>
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index f6650ec3ab42..5581f2180b5c 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -98,6 +98,7 @@ xe-y += xe_bb.o \
>   	xe_page_reclaim.o \
>   	xe_pat.o \
>   	xe_pci.o \
> +	xe_pci_error.o \
>   	xe_pci_rebar.o \
>   	xe_pcode.o \
>   	xe_pm.o \
> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> index 58d7d8b2fea3..81480248eeff 100644
> --- a/drivers/gpu/drm/xe/xe_device.h
> +++ b/drivers/gpu/drm/xe/xe_device.h
> @@ -43,6 +43,21 @@ static inline struct xe_device *ttm_to_xe_device(struct ttm_device *ttm)
>   	return container_of(ttm, struct xe_device, ttm);
>   }
>   
> +static inline bool xe_device_is_in_recovery(struct xe_device *xe)
> +{
> +	return atomic_read(&xe->in_recovery);
> +}
> +
> +static inline void xe_device_set_in_recovery(struct xe_device *xe)
> +{
> +	atomic_set(&xe->in_recovery, 1);
> +}
> +
> +static inline void xe_device_clear_in_recovery(struct xe_device *xe)
> +{
> +	 atomic_set(&xe->in_recovery, 0);
> +}
> +
>   struct xe_device *xe_device_create(struct pci_dev *pdev,
>   				   const struct pci_device_id *ent);
>   int xe_device_probe_early(struct xe_device *xe);
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 944f909a86ad..2d140463dc5e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -669,6 +669,9 @@ struct xe_device {
>   		bool inconsistent_reset;
>   	} wedged;
>   
> +	/** @in_recovery: Indicates if device is in recovery */
> +	atomic_t in_recovery;
> +
>   	/** @bo_device: Struct to control async free of BOs */
>   	struct xe_bo_dev {
>   		/** @bo_device.async_free: Free worker */
> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> index c92cc176f669..e1ee393b7461 100644
> --- a/drivers/gpu/drm/xe/xe_pci.c
> +++ b/drivers/gpu/drm/xe/xe_pci.c
> @@ -1255,6 +1255,8 @@ static const struct dev_pm_ops xe_pm_ops = {
>   };
>   #endif
>   
> +extern const struct pci_error_handlers xe_pci_error_handlers;
> +
>   static struct pci_driver xe_pci_driver = {
>   	.name = DRIVER_NAME,
>   	.id_table = pciidlist,
> @@ -1262,6 +1264,7 @@ static struct pci_driver xe_pci_driver = {
>   	.remove = xe_pci_remove,
>   	.shutdown = xe_pci_shutdown,
>   	.sriov_configure = xe_pci_sriov_configure,
> +	.err_handler = &xe_pci_error_handlers,
>   #ifdef CONFIG_PM_SLEEP
>   	.driver.pm = &xe_pm_ops,
>   #endif
> diff --git a/drivers/gpu/drm/xe/xe_pci_error.c b/drivers/gpu/drm/xe/xe_pci_error.c
> new file mode 100644
> index 000000000000..a3cc01afa179
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_pci_error.c
> @@ -0,0 +1,85 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2026 Intel Corporation
> + */
> +#include <drm/drm_drv.h>
> +#include <linux/pci.h>
> +
> +#include "xe_device.h"
> +#include "xe_gt.h"
> +#include "xe_pci.h"
> +#include "xe_uc.h"
> +
> +static void xe_pci_error_handling(struct pci_dev *pdev)
> +{
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	xe_device_set_in_recovery(xe);
> +	xe_device_declare_wedged(xe);
> +
> +	pci_disable_device(pdev);
> +}
> +
> +static pci_ers_result_t xe_pci_error_detected(struct pci_dev *pdev, pci_channel_state_t state)
> +{
> +	dev_err(&pdev->dev, "PCI error detected, state %d\n", state);
> +
> +	switch (state) {
> +	case pci_channel_io_normal:
> +		return PCI_ERS_RESULT_CAN_RECOVER;
> +	case pci_channel_io_frozen:
> +		xe_pci_error_handling(pdev);
> +		return PCI_ERS_RESULT_NEED_RESET;
> +	case pci_channel_io_perm_failure:
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +
> +	return PCI_ERS_RESULT_NEED_RESET;
> +}
> +
> +static pci_ers_result_t xe_pci_error_mmio_enabled(struct pci_dev *pdev)
> +{
> +	dev_err(&pdev->dev, "PCI mmio enabled\n");
> +
> +	return PCI_ERS_RESULT_NEED_RESET;
> +}
> +
> +static pci_ers_result_t xe_pci_error_slot_reset(struct pci_dev *pdev)
> +{
> +	const struct pci_device_id *ent = pci_match_id(pdev->driver->id_table, pdev);
> +	struct xe_device *xe = pdev_to_xe_device(pdev);
> +
> +	dev_err(&pdev->dev, "PCI slot reset\n");
> +
> +	pci_restore_state(pdev);
What is the significance of restore state here? In reset path any where 
pci_save_state() is happening?
> +
> +	if (pci_enable_device(pdev)) {
> +		dev_err(&pdev->dev,
> +			"Cannot re-enable PCI device after reset\n");
> +		return PCI_ERS_RESULT_DISCONNECT;
> +	}
> +
> +	/*
> +	 * Secondary Bus Reset wipes out all device memory
> +	 * requiring XE KMD to perform a device removal and reprobe.
> +	 */
> +	pdev->driver->remove(pdev);
> +	xe_device_clear_in_recovery(xe);
> +
> +	if (!pdev->driver->probe(pdev, ent))
> +		return PCI_ERS_RESULT_RECOVERED;
> +
> +	return PCI_ERS_RESULT_RECOVERED;

Is it correct to return PCI_ERS_RESULT_RECOVERED if driver probe fails?

Thanks, Badal

> +}
> +
> +static void xe_pci_error_resume(struct pci_dev *pdev)
> +{
> +	dev_info(&pdev->dev, "PCI error resume\n");
> +}
> +
> +const struct pci_error_handlers xe_pci_error_handlers = {
> +	.error_detected	= xe_pci_error_detected,
> +	.mmio_enabled	= xe_pci_error_mmio_enabled,
> +	.slot_reset	= xe_pci_error_slot_reset,
> +	.resume		= xe_pci_error_resume,
> +};
