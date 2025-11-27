Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7F06CFD2F6
	for <intel-xe@archiver.kernel.org>; Thu, 27 Nov 2025 07:37:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96D8C10E776;
	Thu, 27 Nov 2025 07:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dr3+QrCf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D50010E776
 for <intel-xe@lists.freedesktop.org>; Thu, 27 Nov 2025 07:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764229076; x=1795765076;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=67MdHbzUgZYY9iECeY/4DjBBDYtmKWsE0oIPrxMMH4Y=;
 b=dr3+QrCfHoICeHqeeivxhownoGzsJNhDlBAWlIeTdMBYJ/2gVBhKns44
 fZPveE8K2SKleTJZhaz+0ZXtacidNchQR10Xvr4Cdc8PfUAYIFAAfgRUx
 waVicrO48Pu8BN3AP2lqwhJbHybdhucceJ3UUOs1etrTEtjgoxY01lZHA
 YxoVbujSYMpJBVrKbcPlluOnvGS1oR85fABrBXb0tBcvv9q3YdiNhqRFt
 bmGp/HXVPX/UWh2HaM0PQfQYGmFKuwR0bu21bwOq/IeUw0Ib7DwXjOx/R
 vhD73QjUjx9+jzeExW1t+yzGnOrdh9Y2c/7OBJK0xd0G1RZal0ltg7q3j A==;
X-CSE-ConnectionGUID: A/NGvlrJSjOWpe61AdChew==
X-CSE-MsgGUID: rwvlEPg9Saq3Tw2+ruKM2A==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="70134001"
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="70134001"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 23:37:01 -0800
X-CSE-ConnectionGUID: mX8xxnI8R2S3D6K5AjERnw==
X-CSE-MsgGUID: q+kq/GEBT729u3ypXO6zww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,230,1758610800"; d="scan'208";a="197651475"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 23:37:02 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 23:37:01 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 26 Nov 2025 23:37:01 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.34) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 26 Nov 2025 23:37:00 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gs0kR7F/9OUpADPTwjVVrfqxh3RZS4dq9Fbj8lm6TMVNsuUudc5a4TrCuFZB5dvd2EEZJr+IkKj/B6//eMtwWCkIPlBMphJDeq8iQWfiU69l5YsKBdVb5p/E0JuHV0uxh7W3o4Z3DmJBUyboefXEs4dm7qopN+26iEtB4lAwbVh+Rk5GYz331GrEgmUd2LXBMVkyEvuUP5apzehvWWszgUD0wQkuh7t+m1tAk3vKVfvviVvsHanrYPC+ar+0ZWYPnW7MNiTtIgBOrV9Ze/sykHPTGNDbWYBBOHV6/krfWJsp14p4sKwHmXbYs1utCnLz/1QjJPkvabae7F6PcHvRRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WxynfH9bZn3Hq6RatAYvR0RohiyHVZ2GMUjbE8B8Rv4=;
 b=mQV8XR7/VFlhJ19DaDpIhDDxuvIKFhyNLjQMlwstGWM9xUIQ5haO3vy8xQkbOfAhaWJYw13fPu78S11KZx4GvIIhahXzgZ0tUnCkTQRl/mM6uMqJHhkTUkz39Oclc52f0RHowXSCLv8nneCiGwYhW7wz/LycovcrsuYDenTx5VPPyL2VySA71wnFtnW5yQRNojoM1eQzqoIkQFlRC3Zjb1Hbppk3e7+7g6uLDS3rEuTZO+UNF3bFVgb1phsusiOwgCHfj9AG/dwER5XSlw0T2ZRfk3tRM8vi+vlnVj4/gm7E3kN719wSTH9yXFzLlVUFGR1P1PoErNXjXqJZC6ICGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by IA1PR11MB7776.namprd11.prod.outlook.com (2603:10b6:208:3f9::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Thu, 27 Nov
 2025 07:36:59 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9366.012; Thu, 27 Nov 2025
 07:36:59 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>
Subject: [PATCH v2] drm/xe: Move VRAM MM debugfs creation to tile level
Date: Thu, 27 Nov 2025 08:36:43 +0100
Message-ID: <20251127073643.144379-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0029.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:46b::18) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|IA1PR11MB7776:EE_
X-MS-Office365-Filtering-Correlation-Id: 70a56e0b-ec26-4788-7080-08de2d87bf7b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NlErWGFtaTE2MS91UmJ2aWdCR0c3MUdwVHJkaGc0NFl1R0oyUU1HT041c1dS?=
 =?utf-8?B?RXNBRFNRTzRxV0UveXZ1U0UzQThLeklWSlgrblVPSE1zc3ExbFlZR1dvQU5E?=
 =?utf-8?B?ajJnenFwUWN3bFFFVTVvemx5NXVHZDlhZ2pTMUZndTRGek80RnJTd09sZWpT?=
 =?utf-8?B?UU1qMmZFTS92YlBJeGF1anpQMjRIN1dWVWZ5RlM3Y3Q4ZlhWUlVBWmthM24z?=
 =?utf-8?B?eDVpclFncE96THJrdklwak83NlRjd3hKYXQ0WHZIYVlwY29ubXIrUUsvNWw4?=
 =?utf-8?B?azRTYUs5NkUza25zTDJkNnR2MVppcTY3YnFSZG5nK1NZNE1HMkxIWjFMekNV?=
 =?utf-8?B?Mnc5YUhmbmIwVDdxeDN2UUZBUkpyajhzWVZpOVlRTmltdFRPUE1mL3lZUjVM?=
 =?utf-8?B?dkNlQUx6SFZna3UyTk9vOXE2QVBEbENjaHdYQ1dSTGpvN0N4eVIzQnZuekt6?=
 =?utf-8?B?bVFoUjNxa1F0K3NEcGZHZ2VXVFFNK25YTzE3K1dFaGRPUEUrSEdJZ3dlVE4r?=
 =?utf-8?B?NGdxYjljdnpMenk2UnpDalBoaEFBSy9zaWY5WDVBTWJrRjROTTZScC9GZ0hz?=
 =?utf-8?B?MW9Ma1ZxVlZKWHZQWjNFcnFpV2M3NktnbEVpNGM5UW02Q0t4TXZTQTFpb2py?=
 =?utf-8?B?QWh6TEhQQVZkNzlrTWllYkFNdkY3NE9KMlVMM0R0RHcxdVRwbXhTMDZqMkdF?=
 =?utf-8?B?R01OQ2JDMGVDU3lRTGZtMmNyYm81d1hmR0EzZTVWQzk1T2lRTWJ5c2phMjJm?=
 =?utf-8?B?TXB0ZHEwNkFNcUVXeWpUa2NOQ1AwKzZacGpjbFdWdzUraWZsQ1FxMUVCM0lN?=
 =?utf-8?B?NmhYNWhMREdUUm4relMwWW5SdW1wNTl1a1VqUThzTzRoUGN2bFhIcDI3V1hi?=
 =?utf-8?B?MTN5ZFpETjc3TWI2aUdhUDRvNGk1ajltVGRPMEJKNkZNUndJYkIxRW90eE5R?=
 =?utf-8?B?K0lNVC80b1JGNHJ0MGt6Z3A4RndYWDh6V01yRUE4VVVFZTNBSmlIeHp3SkUz?=
 =?utf-8?B?N3ozZG5hOU1hN0paOVgxZVg5ZTArdXYrODR1Y1k5WDZET1h2Tzl3bnZqY3cz?=
 =?utf-8?B?YlJIZGJWYW1ZdHkwb0haQVlFTnhRdExObDB5bllBRTY1OFMvclFIYk1LWEY4?=
 =?utf-8?B?RHFJSnJkN0JGZUlVUlgrWk54enBCTy9SQWRNcXp5c0MxZHB0dXdJcmM2RHlX?=
 =?utf-8?B?S3p0RmVpMGJ6QzFxY0lYejlJUldKRGV4MmNWdHdxTWp4NERzZVRwdm9Dck1n?=
 =?utf-8?B?b2ZMVlRPLzZKRXgzSURCdVoxMWE4ZEYya05IK0c2MzhxYXE3cFRidkU1cTdh?=
 =?utf-8?B?MWNocndRdXc4R1VZaDFBYWhEWVN5bURHbGNCbUQ4aThPVG1oQVNBZ28vV3BG?=
 =?utf-8?B?Q01ZRzJ4R01EOUhOQUVvbituamZZZGNyZWFtemFva3BZOE4xWm56amg0ekV3?=
 =?utf-8?B?UDNadXlSNXNHdmVxb1d4R1cwa3NCSzN0SDZ0cDgvVFoxU2gyL01oOVRIY2Vh?=
 =?utf-8?B?VHJZME5vQm5NbVlUaUZzUHVBWjdLd0R0UVJLUm1SV3ArU25NVGEvWlV3WkhP?=
 =?utf-8?B?S28rc0RlM240bDdVSkp0R0FDV3N2MjRvVk9NUDlic0pheS9mNGZFMWw1bi9E?=
 =?utf-8?B?LytsV0ozSkxvMkpmUlltaUpQbFlmajl1QnFWaGhlRDBVc3FDWW9LZEdiK0I3?=
 =?utf-8?B?bXo5ZmtoanZMRkNWV3U3T1N0cEFGR3BoeldsY1duRGR1RXV2Um95MjVQd1Jq?=
 =?utf-8?B?Z3BSU1NPYWVPZmZCWDZUUG0wN2pscFk5c0E4dHBCWlFGWGlmU1RQMXVpcTFV?=
 =?utf-8?B?OVBtNStxV1ZrSlN5aFNxSmVxdjN3dnIrbSs0LzJJUVBCQ01NMkt2N3hLNHZx?=
 =?utf-8?B?bFJQLzhnR2tWUXBZS2ZtM2h4M0lUR3pVdnlQbEdENEhpLzJoZzN5eWhINkll?=
 =?utf-8?Q?pQztLEaybKEml856iqz84IlCIYMTG1hN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SWIzcmNIc1lzM1lPZ1Y2eUFNN0xDL0JSUWJQcWlCb2NSRUlPVjZIcVMzUTdu?=
 =?utf-8?B?dW9RalNXSUFRQnQyN3o4NFlSK3BzUEZNTENVenJQWHFaT2t4c0x3djkzWDZY?=
 =?utf-8?B?b3N5dVpDNktzWUVwOEJoOFZMQmVaaDVWcEF2bGpsUmF3TzdpZzZDaDExRGha?=
 =?utf-8?B?UmFDajFNS3NhNXJnSEd5SEVYY3lPbmpIcXJoV3F2ckczN3UzM0kwSE9BYWFu?=
 =?utf-8?B?VUFhaTBaNEE0SWRHVTlWS29jKy9pRGcrcjFmQWRhdE9sdmV5VG1RZ3UwT0Iy?=
 =?utf-8?B?ZDAzck0xS1FoZ3NYbWphTW1GcHp4RDJ3Z3RNMjBGQ1pnd0ErUlJBZkF4K0Fv?=
 =?utf-8?B?N1JIbnB5SXBQb1hDRk1JWUtNR3BkQnZJM3F6YklHUjR6TkxjWW5FZHpIU3Rl?=
 =?utf-8?B?alB0aU05UzBCdjIxRGhvamJQSVB0YStTb0dJd1phOGQxSTY4NDB1ZzdhZ2Rl?=
 =?utf-8?B?WXlMVUY1aXJvMWtkWDZQYzlNaE10QlovdlJVdEhBeThvYXY1Y3htVVpGRlZ3?=
 =?utf-8?B?VjFCM2ZNOEFRYTFqRnFjdzJ3M0YyM1Y2bnl0STVtaEM1VnpFZWxXb0lSeTlt?=
 =?utf-8?B?R1orek5kUTFLVnRtN05ieGNjb3BRdjl3QjN6RmJNOWd2WFN3WWFaS285SUxM?=
 =?utf-8?B?WVhyMGpqMHh1U3hBU3FwblZCVG9kdDUwaStLV2RVVCtmbEZEOHJyS2VHZTFx?=
 =?utf-8?B?eFB2UjlIS0N4d0s5T3Btbng0akFPNXZhdDhTVmtNRWVKejZJRUNOcjVJc2xh?=
 =?utf-8?B?QXlTRlZ1Uk9sZTBYakQ0M2VCTUJFSk9tT2JXVzd6Ri9xVnMreEZyMFBrT21L?=
 =?utf-8?B?NEhSMEJKSXJTdWJmN1ZMZ1JZNm9SeEFYakxzVk1GSWV5cWFxR0hRb2lCSy9o?=
 =?utf-8?B?VU1MR2Uwc3FqNXg4VDQ1bHBPSDJZN3AyRDZoWWEzcFgrNVlJZ0tnbWxrUkdR?=
 =?utf-8?B?NzRyRHJPdFpEN1hDS25DWDEvdW5sQm81cHRLUXRYMzE3MG1UOXdKY0hpVHli?=
 =?utf-8?B?eVZ0ODZWbHpNVml2bEtZSjJUZXcrSWVISVZwMDRKM2Y1Sm05Umk4RTgySWtH?=
 =?utf-8?B?dFhiNWJ0VXo3cXlDZWl1bENXZ3dxa0dPRzFtUWJTckJGbEV5NThLVEhjZ1Nv?=
 =?utf-8?B?SHhGTWplekUycmVUQzgwMHM2Q3MrVmZtWnhNRDFWRU1OaWVhVHRocjlvTHJy?=
 =?utf-8?B?a201aEF2N2dTclQ4RlBHaURaK0sxSEkrVUwwWmc4bmNvbFFMN3NJK0J5aXhG?=
 =?utf-8?B?bC9YTUljK1V2b0JraHo0ak16Y2xXMmJXTUFURWdRNE5tR1FmamN1QUwzOC9L?=
 =?utf-8?B?QmdvTUZDZXJSbGVFcXpaK1VBNWEya3QxYUhVZ1Z0NkZ1RVhJamFHTHB2R2Jy?=
 =?utf-8?B?WFlhWmo3WHV3K3VJTks3akxJTnN3a1hLNDczeng0MjJEajQ5MlE0cVRKOXh1?=
 =?utf-8?B?MVVvdGhudmEyWG91YUJJS0lPOW9uSldKTmZ5Qkc5b05sZlJNaGRBc2hDU1lm?=
 =?utf-8?B?bjJyVnZUK3hJSHpEV3hQL20zY3V5dUZEN3hXYXlDN3VDa0l2VWR5b3BtdUV5?=
 =?utf-8?B?R05CT1BkZ2pOU2V5eXJ6UU1xbUp2V3lkQ05zOG1tM3dTQWtsYWdqVFFwdm5G?=
 =?utf-8?B?czdHY2JKMXFHMW8yb2ZCZ0VEVVk0L3BVZWo5QlZXajRlUFdmMHFLeE1ZY0Vm?=
 =?utf-8?B?WG81MGRlMnZTVVI5dE03amxmQlFJTkdidXEvenhCM1hZbVlGQjM1d003ODli?=
 =?utf-8?B?SUxsMDFKN3FxMFVwYnhWY2tKMGdnNE5nNjh0cWVxWktMaWtMRFpRR2wwUlVO?=
 =?utf-8?B?M1JBdFVCZjNDVm1Ub2xlbVVsWkFUdW9FYkdSNXR4S1UxbS9SUUtGd3Job2J0?=
 =?utf-8?B?bE5oa1VFcGgwWnJFZHVJSWpPZklBSkhLYitZajRCUzRIdFJVNGlqWDdjYm9I?=
 =?utf-8?B?aWRRMDY4Qncyb3dVSkdkMHpkZE1uRTVQNlcxSGkyZWhJeGhTTUJQSWVXc2pY?=
 =?utf-8?B?NVBERnZmczBYbHRIZE8zVzA1L0dXRU52UXI5WlBBcDA0Y0J3OHEyMVNOYXJn?=
 =?utf-8?B?QnpFVHhXNi8vUnpURnRhTGdYSi9pSXJROXhQZWZKcDhJNW9JdTk2anErRDFh?=
 =?utf-8?B?MUhvMmJZNjkrUVZSL09aUXVnelZRVzZhSDdXMlo1aHgyN1F1Sko3V2tUdysw?=
 =?utf-8?B?Qnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a56e0b-ec26-4788-7080-08de2d87bf7b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2025 07:36:59.0821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DtvAljKEqMtqsO+cQtXBBUeUTws+5RcB66B9hJdEwaz0iRb+MJIQevFcBTb4G3eExb9keSDsl6VUkVD5lyOvkKpiAMRIRzXTzYzxMjKNMGI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7776
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

Previously, VRAM TTM resource manager debugfs entries (vram0_mm / vram1_mm)
were created globally in the XE debugfs root directory. But technically,
each tile has an associated VRAM TTM manager, which it can own.
Let's create VRAM memory manager debugfs entries directly under each tile's
debugfs directory for better alignment with the per-tile memory layout.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Reviewed-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/gpu/drm/xe/xe_debugfs.c      | 12 ------------
 drivers/gpu/drm/xe/xe_tile_debugfs.c |  9 +++++++++
 2 files changed, 9 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index 1d5a2a43a9d7..0f8a96a05a8e 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -369,7 +369,6 @@ void xe_debugfs_register(struct xe_device *xe)
 	struct ttm_resource_manager *man;
 	struct xe_tile *tile;
 	struct xe_gt *gt;
-	u32 mem_type;
 	u8 tile_id;
 	u8 id;
 
@@ -397,17 +396,6 @@ void xe_debugfs_register(struct xe_device *xe)
 	debugfs_create_file("disable_late_binding", 0600, root, xe,
 			    &disable_late_binding_fops);
 
-	for (mem_type = XE_PL_VRAM0; mem_type <= XE_PL_VRAM1; ++mem_type) {
-		man = ttm_manager_type(bdev, mem_type);
-
-		if (man) {
-			char name[16];
-
-			snprintf(name, sizeof(name), "vram%d_mm", mem_type - XE_PL_VRAM0);
-			ttm_resource_manager_create_debugfs(man, root, name);
-		}
-	}
-
 	man = ttm_manager_type(bdev, XE_PL_TT);
 	ttm_resource_manager_create_debugfs(man, root, "gtt_mm");
 
diff --git a/drivers/gpu/drm/xe/xe_tile_debugfs.c b/drivers/gpu/drm/xe/xe_tile_debugfs.c
index 39eeca75dded..5df2f461b7b7 100644
--- a/drivers/gpu/drm/xe/xe_tile_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_tile_debugfs.c
@@ -106,6 +106,13 @@ static const struct drm_info_list vf_safe_debugfs_list[] = {
 	{ "sa_info", .show = xe_tile_debugfs_show_with_rpm, .data = sa_info },
 };
 
+static void tile_debugfs_create_vram_mm(struct xe_tile *tile)
+{
+	if (tile->mem.vram)
+		ttm_resource_manager_create_debugfs(&tile->mem.vram->ttm.manager, tile->debugfs,
+						    "vram_mm");
+}
+
 /**
  * xe_tile_debugfs_register - Register tile's debugfs attributes
  * @tile: the &xe_tile to register
@@ -135,4 +142,6 @@ void xe_tile_debugfs_register(struct xe_tile *tile)
 	drm_debugfs_create_files(vf_safe_debugfs_list,
 				 ARRAY_SIZE(vf_safe_debugfs_list),
 				 tile->debugfs, minor);
+
+	tile_debugfs_create_vram_mm(tile);
 }
-- 
2.34.1

