Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AC87CCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 10:46:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA2210E369;
	Tue,  7 Oct 2025 10:46:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="CeiWF5oH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1843B10E369
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 10:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759833982; x=1791369982;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=7+qb9GbqB3s2yhsTBiyfwhBkzT48Vok6wQV8TjzK2fM=;
 b=CeiWF5oH35+XQq8wb5QrrDc1Mhl1lQduUkPNujGREKoQSiEfIdM5CACA
 Mv2WjZZEflV2pfttAjH0rE5k9UfGLgXQhnZnifhuUpx6xV9kNcO+ragS5
 MaeonZaEr8Inlp6/yYTNRjkTjfzgf7U5thGnRo/eBUjxJZNVwrFYdsX+E
 RF5SOo2IHoWwnmd0YLmba3mWLuTStiUnBJaZclQx+Pc9TNOTSm/Ysw7UM
 uHOT5mNMEpEOM2Ad95lTV2txQsWdqIMP8LlKL+4QgYWEFrWP5IUtlLGt3
 UmlV5O+JQKjzjjBBGwzgF7obJ7+SndppRi3ovm1Zt+ZUlBe80iGBtT1B4 A==;
X-CSE-ConnectionGUID: 6n2YIO5wRTGfdFg3eIwaKA==
X-CSE-MsgGUID: 0i40ngPLRr6HzG6RqCPUJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11574"; a="62056991"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="62056991"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 03:46:21 -0700
X-CSE-ConnectionGUID: VpDsAoWHQU+r7M2+/ruPqQ==
X-CSE-MsgGUID: VtJdwk7aSoehr1r1cijmTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="179398827"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 03:46:21 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 03:46:20 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 03:46:20 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.27) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 03:46:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nNRIRagU4KZHcbIcXoazbG4pd+e32ZNHBJbqh0OUMEY3ALVhd3mp2WnFvIQkNB34HpjbJi8AWTZySvHv6gNLnMa0LzdUWipwur97piFHjd1QN+OP4+lLvBpQVAMwzS9729J6L18WsXOLHPT5FSb3dQ9ZMn8hLw/kM25URGIMGobVfiVN9t9OE832GUBW8htoqlHx1MAtp2w3AxMxLfKL/WTudYYVzgW72iyWeFpIUjaft/fQGLzKlLrdtlH4+ZxAT32d5GjxaK9nIIpwaLz1TuU2JNSlWTavkYS9h0USqVHj1pLJg0OiYlAXb1w98Ybn2tfUIqnkJzITo3WqA1XFFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JBccQYrX+nsBDSWgjwtn7xLfoG4Ao+x4OF2oA9DvMKA=;
 b=A8RW9ySJ2sR+WgP1PiKkKYcG1lGVRczSUOCWQO2TJGqaAU+Ekuz2CcW76hJ62OGy86nHmv/82Sc17rJHkzMawo6fYLtyBgZLF2mNLaVYP7ui13TBWLEjJ/InEdndsCj1Zc0DrwYAl7+uC49ueHVg0bRcujGaFq2joeenG93RFCmNo3IDxUYAF2vgLIG11oV1vK/TbzIWkEBoyIy3w/aoxi3fxwoj1PVuqNuwuFZE1WnL1v/mDfp4V1WdBskIVH+BtVVArQSrUIj8K2uzPo/Asn9lvysMgElNtL0DzboHQODCzZEkFiCH1qb7Idr2HpaRnwreH7/tgYvDSjVX0AehqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11)
 by MW4PR11MB6617.namprd11.prod.outlook.com (2603:10b6:303:20d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Tue, 7 Oct
 2025 10:46:14 +0000
Received: from CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74]) by CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74%3]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 10:46:14 +0000
Date: Tue, 7 Oct 2025 12:46:08 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Improve reading VF config blob from debugfs
Message-ID: <20251007104608.oosebaoadw6zawfe@intel.com>
References: <20251004162036.1800-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251004162036.1800-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: TL2P290CA0015.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:2::18) To CY5PR11MB6138.namprd11.prod.outlook.com
 (2603:10b6:930:2a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6138:EE_|MW4PR11MB6617:EE_
X-MS-Office365-Filtering-Correlation-Id: 947832b9-f2e8-4056-441e-08de058ebc6f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T0RPZHBBRWdpVHN0U040eCtQMVNKYSs5aFdSVm5TazJqbUFjRHN3TDV6aURj?=
 =?utf-8?B?aEU3V2diMit4TFQrS1llcE5SYUIvK3hCK1RZdnMrSE9ZZUF0MWV1UDcxMWpU?=
 =?utf-8?B?NzZrRXJoSzY2VTZHU1FudTVDNHpWbFhHQUNTSS8wMTJzUTFiT09VdFVvUGxV?=
 =?utf-8?B?OE1EaGZiUk1uWVFKRTE2UGhqcEdPbEd0UHRYWGN4OFNmR1pjT2p6NEFraUpk?=
 =?utf-8?B?Y1FLYW16WHNPLzRHVCtxMm9vVE1nZ0xTK3lDME1COWdzMFdyaktSL1lCdXFP?=
 =?utf-8?B?VUxMUVd1UlRwQmFDQTVQL1lsRHRBbjVSTlhLV2hoL3I0dVh3OTNOK0tWdk9E?=
 =?utf-8?B?U1lQYlFJYnJ3NmlOT0FST0dQR1ZzYXJDM05mYVFZbEVPam85SW1YcUI0My9x?=
 =?utf-8?B?SFA5MmNkNkV5N3RvcEFyak84ZmxqbURpMHlyd2wvYXRPM1RIZDkzVWU0KzhW?=
 =?utf-8?B?ejNiQ3lraWxBOGRHQkw5aFdFRlI5VEIzbTR6ek1ZMng3c2ZqNm1IN2pONjFM?=
 =?utf-8?B?VEdmYUNaN1g3QnJKdndqNWZxQ2Q2NmowU2tmb1owWTg4MWtvTU9WdEk1QzhX?=
 =?utf-8?B?WVFqd083WU1EbklydVIzajFOQTFYZ0Y1eXE0cnptWlArTHJNSWROeFhQaWdU?=
 =?utf-8?B?WjEzbDRDc1JkaHo5cUFIclVuTU40YzVjVlNMdCtlUXBuTTE0NlNTM0tZMU9u?=
 =?utf-8?B?VVFvNmpMQkhCb01BWDJjUEp5cHdVNDdOTUp0NHJjZm5sbTNuTWZwek4wUk9y?=
 =?utf-8?B?c3FWa2Y0L1JkdnhONk5vS1N6UG9vempLUlAwREVrUUtRc2I5WmZlcW9qekZP?=
 =?utf-8?B?MDcveWtwUnJWUDQ0a3BwZjdKWDZqcUkvYTU4bzNtOFlKdTI3QXNZL0lqQnRX?=
 =?utf-8?B?dEFTMnZUK1RSTSt0RUcxendqL3dNcEJabEQ3OFZ5NnYralpMZHNpN3RxanZK?=
 =?utf-8?B?WWpNMFdwRzExNS9WRjNKd2FUMTFZNDFpNEdRcXFpRHNGa1diaDV3VkRVOEVy?=
 =?utf-8?B?RFZLZ0pDYVduUThxNEV1NGw3YjhyUWRwV0IydmcyOEE3bUZRbDNxWDZiRnA0?=
 =?utf-8?B?NkQxUlhwakptUE9tdEYyeHhqWng4SFk0YjFxaWtiWEN5cXRVcHlSOC9aK3Zs?=
 =?utf-8?B?eHhFby9XZ2VUcEZPUDBlekszV01mY2hmVVNuTnNmdDNiT01pMVpmSHhuMmk2?=
 =?utf-8?B?bDJ6MGZpUGdGMlFjQmNyZFZQN0lSWEsvMEo1clpkb1RzRVlhWVNtMEhYZGRv?=
 =?utf-8?B?eHR6S3pmUHdlSWNBREFJOGdhMGF4TVlQa3lhWHJUVkpGdXhRSURvL1VYZ0tG?=
 =?utf-8?B?K2ZHaEc3cDF2ZEtUWkM4UTFVOHpNSDJtVGdBbHJrOEEreWV6SStVeEpOWDVx?=
 =?utf-8?B?WVhMcWltaVhIVGNyMC8yUzBKTWpvSjhxU3k1OGVRSGNDQlk3Q1lOZHdUVmQ3?=
 =?utf-8?B?SWZ5OFNIanZYMTBFaWlwQ0FsR0hNRDI4eHdpUGUwQnAwa0xnYmpudnFLR3NF?=
 =?utf-8?B?dkx1a2pCQ09hOTlmV0xwdE5ONDY5OWdiS29oUlRlazQ4MDZmWjhrczc4SDFU?=
 =?utf-8?B?ejFHM2hMTVhlVXpkTlZWc1Fmd2JneExLTlp2VTE2VGpSbkJxQXpoQVM0RXow?=
 =?utf-8?B?cFVDSWhnT3FoMW82ZnBaaWIwaWRwNHVIUlBuOHhuS05SOFI3eDNSME1jV09Q?=
 =?utf-8?B?Nk9aMXozNnV1Y3VibVNzZHdrcVpJclQ3YWtjR2lkenc0ZWNIK3IzVHJWVVZj?=
 =?utf-8?B?eVhMdUlabGxodzZUZmtUSTk1S002aXMzSXhsTVVrZFcxSkh1THkzSE5FYXE5?=
 =?utf-8?B?MUF4S0kwTWRhRHcyVTNyVzFlVksvMWN2K3QxOG84b2swVTByQzYzdUxsSFk2?=
 =?utf-8?B?SisrRUt2SG8yWklMRy9tYllWZ1N0MlJxeEd3TFJtWVlabVF2SXBxRlZkb1Iy?=
 =?utf-8?Q?hnLtdH29ebqy+8BqZBv8J6EnzqucYGEy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6138.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dXlkek5tNTlCLzNFb21LZjlhRzJRUzRob3dHS0VaaHAvdlFuemxicThOK0Vi?=
 =?utf-8?B?RHdqSDdxVjU2ZHlOc3R4VFFFWGtCUTdGM0N2QmVteXJPMDJ5ZWRZS0pxSEV4?=
 =?utf-8?B?V0tpWVBlUzZMYTRlTWRSUzN3K2JxTDVSRG01S2ozV3JCK0VDcUxINFlxcW5t?=
 =?utf-8?B?S3JqU3JEeTl1cGFESGRwU1VVSkp6cVJKcThMbHorR3pkcHdWVzQxSkFwVGhC?=
 =?utf-8?B?cXo4RWgzQTNkTEF2N1VEWTZvMnBVZFdsdm1WUVRwL3VRbUV6bkxoUS9Jamhz?=
 =?utf-8?B?VzJuWlZiVFhJL1N1RVlqZk9qZ3h6VWk3UnRvekw2ck04SDdYVmVTV0JQL0Y0?=
 =?utf-8?B?N0lzRi8rWEZ3UUlPcEFpemVwdUxNU3VHTkp2Zzcydk1rNmovbTg1TEVZT0RK?=
 =?utf-8?B?b0xWdHZ0YTkvbHU0RWNTQ05OL0hSREdmYmlIQjdLZTN3Q3pRV01YU2ZhelUw?=
 =?utf-8?B?UTlMeXZlOXVRaTgxNFVHdG9vV0dFRGZ4T3VZeVdyeXVJdE5FQ0t2NGE1Zlds?=
 =?utf-8?B?Rk9SR2c1eUFrSFExK0pLYXlsWm9wOG1Ldk1YZ1ZOQ0tGanlPTGFFY0NzUDBx?=
 =?utf-8?B?U2xrOVNlbTFvMk9WakR2Zk83elZVdEdDWTExb1lYZW54QkM2anhmM0NPU3N3?=
 =?utf-8?B?RXB2eHFtZ2M5bXpYVWczTjlWN205cmxlT25TaGpxQmZFSW9GYVJIaTJCdjJU?=
 =?utf-8?B?OWlzOW5IRWtCWlFlRWpNN0FNa043MElsZDM4ZE1ld0w1WnZiK2J4bnpkUFhY?=
 =?utf-8?B?SmQ0bzgvRjM3bnlCR2wwRVV5SlBSRjk4UzBNa01Jb3V4UDBRRDBoRW1rS0tF?=
 =?utf-8?B?aG81TTh3VzdxYSs5NDVLbnJZM0l0UmVaZUh5TExUY25jdmh0enJhUFdxT1NS?=
 =?utf-8?B?QlVJQTRwVFRsSFV5ZTduNG9zWFZlK1BLZitRU3gxNG0yTjRZY053Y2JjU1ho?=
 =?utf-8?B?VDY2NUkzWm1DZjUwWjJEbGZSV2ZQZlZQQWIyUXhWb1dWa3ZNd24vdnVTalpn?=
 =?utf-8?B?MXdvdTM2Vld0OEdyZFFNVkZuZHpxWFRnMTdzdjBDdmpjTU1yU1FIU1JWVnEw?=
 =?utf-8?B?c2NldnIvMnpudWljaFBUWVJoRlMxdGZleGk0WElNMkFvVWpJdHIrMFJMR2I4?=
 =?utf-8?B?VFRjL3VoVVNDZXBhd3d5OTJzNWhkanFwVkFueCtVV3BnRnpVdjU4dmhIQjJZ?=
 =?utf-8?B?akdZZFdPNzAzSFduRnNDZm9KQ3dmUTJxQlNHQTFFeDFPR21hYlBMZWdBZFA3?=
 =?utf-8?B?MkhndkVRbjAyUDlMUVpzZmZHZjYwQnZxbGM1L0tqOEtBcndBdHNWK2U4dmwx?=
 =?utf-8?B?cWYraFRVaDVPUlNnUVdqcXlMOWo3b0tSbkFDMFhyK0Y0di9sZDhxVWNFWGdS?=
 =?utf-8?B?cEp0MUlxcE80a24zVXdSRXBiUmJtUzduVHlWUFV4Vks3NkFpSXZSMk15SnlT?=
 =?utf-8?B?a3h6RUVROXgvT0xqeUxUZDM1YUMxZFBPb2VVNjdvb0ZudnFLaHBIKzNocFdC?=
 =?utf-8?B?NjlybG0ydFFaUDMySjZhbzN0eHF3UWNOeERaZWFhR1R2OGFQdDIzODVWMTFn?=
 =?utf-8?B?Mi94YWNrMjkrMnd5emo5RXpNdW1tRXU3bngrYlVzcGJ4UkZJZVplSnVUQmYw?=
 =?utf-8?B?SFJmY0lHMXJ5SU4rVG5IVE9ZV21VeHE3MFpRTUJteFViK3FPcm42NXlVa2t3?=
 =?utf-8?B?OHltaVg5Zk91N1UwVEpqLzVYYVl0dzZRbVdlQ2V0aHd1dUhpOHdtUzZRa080?=
 =?utf-8?B?Y05VcXVaK2xsQnZQQVRIRmE4UFl0ZFNJRHg3QkE2YWwwSHJPcEN1TGJoS3J6?=
 =?utf-8?B?NkhFZkhudWZkUmxXY0FzOExDZi9vZFNyM0UzeHcvMXpBRDNKQ3FDMU1zM1BL?=
 =?utf-8?B?ZXdaWFVNUHFuRGdLZWdmd29iSlRPR0NjTTlQYVZma2FZek51NHJYWU9wWWt2?=
 =?utf-8?B?REZJYnVYODNaLzM5UGpaV25HNFByUzhmWUZ5Z0l4YXV5dHdoeU9mRmNlSVNl?=
 =?utf-8?B?VUVrZno0QU05SUlUVHQyeHJEdFZoMTlEZC9nUmNqNzBRVXZhTDNXY1hvRkF2?=
 =?utf-8?B?ZzdyN3JGK3YyeGVSMERJZHlDTmc2ZFJqVUR0VEljbkw1TFhTbW9veFhLanQr?=
 =?utf-8?B?UkkyRFovdThFUFAwcGcyWEwyMDJxejVSY1VWdU9rN1E5VUt3MzFRSUVWZTBB?=
 =?utf-8?B?YlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 947832b9-f2e8-4056-441e-08de058ebc6f
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 10:46:14.2020 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qw60EJ+UJPVNU8MkKg+OGW+eSM3cloxlxXQdKaFpEHFuFM7PurN1uyGxewornmBvQnVjuX2Lev8I5h0DbR/17q9x5PElJOTJNOehDMS1Ftc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6617
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on sob [2025-paź-04 18:20:34 +0200]:
> Due to the use of the file operation flows, we might encode the
> VF config blob multiple times. Avoid that by capturing it once
> during the open() operation instead of the read() operation.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c | 44 +++++++++++++++------
>  1 file changed, 33 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> index 44fec2aae536..c026a3910e7e 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c
> @@ -436,15 +436,19 @@ static const struct file_operations guc_state_ops = {
>   *                  :   ├── config_blob
>   */
>  
> -static ssize_t config_blob_read(struct file *file, char __user *buf,
> -				size_t count, loff_t *pos)
> +struct config_blob_data {
> +	size_t size;
> +	u8 blob[];
> +};
> +
> +static int config_blob_open(struct inode *inode, struct file *file)
>  {
>  	struct dentry *dent = file_dentry(file);
>  	struct dentry *parent = dent->d_parent;
>  	struct xe_gt *gt = extract_gt(parent);
>  	unsigned int vfid = extract_vfid(parent);
> +	struct config_blob_data *cbd;
>  	ssize_t ret;
> -	void *tmp;
>  
>  	ret = xe_gt_sriov_pf_config_save(gt, vfid, NULL, 0);
>  	if (!ret)
> @@ -452,16 +456,27 @@ static ssize_t config_blob_read(struct file *file, char __user *buf,
>  	if (ret < 0)
>  		return ret;
>  
> -	tmp = kzalloc(ret, GFP_KERNEL);
> -	if (!tmp)
> +	cbd = kzalloc(struct_size(cbd, blob, ret), GFP_KERNEL);
> +	if (!cbd)
>  		return -ENOMEM;
>  
> -	ret = xe_gt_sriov_pf_config_save(gt, vfid, tmp, ret);
> -	if (ret > 0)
> -		ret = simple_read_from_buffer(buf, count, pos, tmp, ret);
> +	ret = xe_gt_sriov_pf_config_save(gt, vfid, cbd->blob, ret);
> +	if (ret < 0) {
> +		kfree(cbd);
> +		return ret;
> +	}
>  
> -	kfree(tmp);
> -	return ret;
> +	cbd->size = ret;
> +	file->private_data = cbd;
> +	return nonseekable_open(inode, file);
> +}
> +
> +static ssize_t config_blob_read(struct file *file, char __user *buf,
> +				size_t count, loff_t *pos)
> +{
> +	struct config_blob_data *cbd = file->private_data;
> +
> +	return simple_read_from_buffer(buf, count, pos, cbd->blob, cbd->size);
>  }
>  
>  static ssize_t config_blob_write(struct file *file, const char __user *buf,
> @@ -498,11 +513,18 @@ static ssize_t config_blob_write(struct file *file, const char __user *buf,
>  	return ret;
>  }
>  
> +static int config_blob_release(struct inode *inode, struct file *file)
> +{
> +	kfree(file->private_data);
> +	return 0;
> +}
> +
>  static const struct file_operations config_blob_ops = {
>  	.owner		= THIS_MODULE,
> +	.open		= config_blob_open,
>  	.read		= config_blob_read,
>  	.write		= config_blob_write,
> -	.llseek		= default_llseek,
> +	.release	= config_blob_release,
>  };

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
>  static void pf_add_compat_attrs(struct xe_gt *gt, struct dentry *dent, unsigned int vfid)
> -- 
> 2.47.1
> 

-- 
