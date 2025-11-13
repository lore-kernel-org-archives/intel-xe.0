Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 493BFCD5BA0
	for <intel-xe@archiver.kernel.org>; Thu, 13 Nov 2025 08:43:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B5B110E7D9;
	Thu, 13 Nov 2025 08:43:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Iiz0tcHm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8E6E10E7D9
 for <intel-xe@lists.freedesktop.org>; Thu, 13 Nov 2025 08:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763023413; x=1794559413;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=GpektfNPrw5eoYzQ+S4k3j+OJHKCTI1yUt2UrN3QytY=;
 b=Iiz0tcHmAiroD49CtIkcJxnrSgEIKln7a4XuZNQM6Si6lvK0zZZEBkri
 uyeYJJ0sDG3PxGhGFAOop2UggVTkyS87J2DBH1fm5tPePEaVN/BNrGcPn
 q3SIr+TgrPKdZ6aNvv0wjOYykE5yZziojSMeoYqiaWZkKw9Uva8ZQe9JX
 oYHlpD12FAylCxs7pzTVltNlv2MYan+GPkNOTBrNIb3DOrwJB34l6VsUE
 hJEWFPbOm1UJ6V/i/zn+0WYMB/UTVBCLO63qF9cXSzf8x0IFKf4VhRfGi
 /6IPJTXz7BFx/s5hb6/0OzhrhHp6p/dSfIQ+wGt0zSjzIPt+xNFD4Z0Ye g==;
X-CSE-ConnectionGUID: xTJ603ocTqienNGoX9AD4Q==
X-CSE-MsgGUID: Aa+V5sTlS7Ce81RDSizNxg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="64303532"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="64303532"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:43:32 -0800
X-CSE-ConnectionGUID: rXyTQDKgSxyB8FkDRrixrw==
X-CSE-MsgGUID: rcJzmfTdQai0/wJUipBhyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; d="scan'208";a="194618128"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 00:43:32 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 00:43:31 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 13 Nov 2025 00:43:31 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.27) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 13 Nov 2025 00:43:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P7ymlr3eLkpYC6OmzPGaJDqKOxEUs29/m3SrmLdR0nRCuKHONHEYhtRUoo9AT7oKrCTf7A3+cGXg4ZLg9MjA1/jIdPrw1cECaHB8bq9WGjz/uTX5zMqs7/1MeVPmd4SAEL1+LaIzBW9GD9HT81YpV9j9dTQ7Q4Tsjf77c30kc69dMRosZoyGzE5yDSn3gkADDQGtWkDESGnJUokMjwDESV6Snd8R+7Cf5QNKg4o8Ldyq/udWejptQmtAQTxlD3uk+FTD3Ty71KbeoqESMJhODcOkj8qHQ1DbrTntFiC2ksPL7d3Ubzbu0g0wC6DB9JYt6+9zjuyFA1DYxxSrqX0M+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j7Kq3FLz+/69t0zpu+fT0PbelusJ/6J8MyZZAADRpSk=;
 b=q5TaPDpsohhPGFAGBZkLALjRG+pXlP1Z7y8Y1KfxruYruqty8qFVgi+FLNVHQlKYaFP6SnKNh8Fk5A88N5JYI6cVPs0C4bSMD6JPTFn4MSG5KBp5x1G4oN6VJIOAEaLeo017WDplrsBLfC190ktDOlYv3Bpe7MQ2rmLdxJDUJ1SlIlRYKSM9C3Po1kLbT6xHCzvmnGU9jwojDdB/uSYwW3Vq4OEmo8hnP+cq2kvHIMSYI4xP5rcKcoi4ln4VKc3vWGUEwfTx5KtiimD628uOZI74h6A/G//zzFv24Sno4EiwIGWpH7WpWr/N93ZopmCpfGFKdN5Agg7PqZQ4PNu18w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11)
 by SN7PR11MB6828.namprd11.prod.outlook.com (2603:10b6:806:2a3::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 08:43:28 +0000
Received: from CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74]) by CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74%3]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 08:43:28 +0000
Date: Thu, 13 Nov 2025 09:43:24 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH] drm/xe/pf: Use migration-friendly GGTT auto-provisioning
Message-ID: <20251113084324.csjoba36t3xuyq5b@intel.com>
References: <20251112124408.8094-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251112124408.8094-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: TL2P290CA0019.ISRP290.PROD.OUTLOOK.COM
 (2603:1096:950:3::14) To CY5PR11MB6138.namprd11.prod.outlook.com
 (2603:10b6:930:2a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6138:EE_|SN7PR11MB6828:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a025f03-74ef-47bc-9f08-08de2290b7b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?c0xzSnVVRXU0MXFDSzEyamoyUHY3M2RJSlZ3NTZidTZkb29Vc2J6SmpKbSsw?=
 =?utf-8?B?UGZGOXdFdXVva0J4SU9Ya1d3bVZTNnNJeXJiaVRETFFla1psT1hLUjRCSFdw?=
 =?utf-8?B?cjdHeDRIN2g3bklSZ0VNdUVRaWFUaU55OTcwV1NzZTlwU3R1c0J0dWNNN0s4?=
 =?utf-8?B?MGx2bklzNWt0SjJ6cVErVWl4bjNiR0hvK0phbTQzRTNQT0graXdOa3NHN2xG?=
 =?utf-8?B?ckptWEMzVk1mSm9QTmVWNE1QSDIrN0pQd1VMQXkycHlHdHFKQmk5YjY3U3Nl?=
 =?utf-8?B?TFdZa2NLeU04SkQxN0VxelBoQndWZlU4MjRvei9lek94blFaZ1dtbVEyOFdy?=
 =?utf-8?B?SnkzakFGbTJ3eWw0UGFlZkEvMUxXaExKWldpYS9KN0diRERYcDhOK2Z5ZHdr?=
 =?utf-8?B?Y1N0THZXazJXN2JPUnAxTXUyenI1c1VhcDNRUG5oQVl4Y1doS1BKbFUwS2FU?=
 =?utf-8?B?SjNxbVVodDA5cDNxM1VOdGFGSmxzK2FwS1JiY1lKLzhkN21ielUzYjN4VVZE?=
 =?utf-8?B?L0V0RG9obnRuMWlXdko3TDR0dzZYYXhlS2NNMlU4SDlJWnA5ODBmN25oaEJa?=
 =?utf-8?B?VFZTbEhJNlNHR0o0TkZFd2dNNVFpN1ZycWhqVDhvUDg4NzRrT1dLZVV1eVpC?=
 =?utf-8?B?TURTamRNQVFGdlJTSjZzS3RzNEpBVVdZTkl5Y1FxdUQ5eGNNQnc3MVk2SUhv?=
 =?utf-8?B?d0c5LzZOTHpPMER1VmN3TXZaWHZCT0ZiV2dRdmZWdGhSdE1FLzZFSENkaWQ1?=
 =?utf-8?B?ZDM2UC9JNUdnbEh4elNJc2d4WDBZUTllTURJTitCYS9BNlZ1TmRFU3RRcENU?=
 =?utf-8?B?MVVDRFFFbXFMQjZ3T09GNXVnUUxRa3ZFb3hjUURXUGhuRFkyY3Y2Tk1MbFVE?=
 =?utf-8?B?SG01bmdPMHFWbkx6OGlYWTQ4eFJyT1hPM2FadWJoUk0xZUNBYk9rYmRHMWFj?=
 =?utf-8?B?RHVacHI5a1ZJeS9ZRXJ0RmF4N0Z1OXZUVnUyL1M2UXZWb1EwVER5TnpSRmVn?=
 =?utf-8?B?UFZKcktnaGN1M0NLN3E2VmM1eHp1dVY4YmNtcGRUZVE5M1dpZzRSQWs0VzdS?=
 =?utf-8?B?TlJ3cmhSTGgyYzQxSFpDdGlFWVBKeU4zSlpFZGYvQUsvaEZKeUhxNXVlMnRr?=
 =?utf-8?B?OXFlMXp3WElYM1c5V3BEUzVPV0VrYmZpMURTdjcwNFp0MGdvRmFyV2w0Z09N?=
 =?utf-8?B?U2ltTk9Rc2tQMW9xVTVuVkRhK01pMlNDa0o5anIzeXhQdHJuZzFxZWJiQzRq?=
 =?utf-8?B?QWdjMWJEa0hqSi9RRDhMamF3ZGxSRUNyTXFiaW9iMlVHOHRKYndHdlhrUHZZ?=
 =?utf-8?B?Q1B1Y3pXSFd5VFoxazdid1RrbzdUaDhiY2tCTjNuWDRPaHV3alk5bXdpMSsw?=
 =?utf-8?B?OXlhd1ZXY0pwbzh4TStDREtTY0NBL2dmM0NLcm9KTUFnRHhBN0JGc3lMQWN3?=
 =?utf-8?B?Nm05bWlTNjJtVHgrcUVRcGExUWg2blNMWlRIenJVRjF6YWtYcEdzRC9rTG1m?=
 =?utf-8?B?cTB4L1BEQnhCUzZKd08wc2VJbGZiUXRpV0RKN3RwQU85ZmhVVHVtNVZZOWtE?=
 =?utf-8?B?QTVyRmEyUHgvWTk2cnBhM0d1WFpQNjZBaWhPZ2VKTENtSW5WRk9LSGNjdmc2?=
 =?utf-8?B?UGxQRFlvRkQzbXAyS3lYbXcvQ3BNT2dRenAwY0ZyQVVXQTFsbnZ4UTNIZHpq?=
 =?utf-8?B?TDVOcllLalVnZ2VRcE9rNWcvZUl6QklGOERMMTFrV3ZlNmg1b216cVNid1dX?=
 =?utf-8?B?RGlLcU9lbHZONHhJREx3NDFGZTdmZHpzeEZJeUNTOHk2Qms1ME95SjAxRnNG?=
 =?utf-8?B?QUlSZmM2eFRFU2pxZUsvTHkrRG95YUl2OHluUGFkNEc2bWM3SlBra2RqMzBC?=
 =?utf-8?B?d2RDRWpyNmxUNHdsVDlXZ01LN2NwV2tMU01vaVZIVXFTdFl5K09RaXl3OEd2?=
 =?utf-8?Q?iAyjbIb8mor7eujz9lPr6CB89K2vEnNo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6138.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODVFL1ZIR0oxRGhtcDdhR0RMNEJCQUh5ZkVzaTRmdTlOY01xTlNsLzZlT1V0?=
 =?utf-8?B?Q1NsZmNraCtCQm9FOVE5WFN3T1N3MktyUUhkdU5BWDN5b2p0VHR1ZnJNZDUz?=
 =?utf-8?B?UytXT1RQRzhIQVRNZ1ptREkrRzJtcWQzRHVWUTJWQjZNVWcxa0wrUUVJSmR3?=
 =?utf-8?B?WmY0L2YzTDhvME4rdEFHQ0lMbG5WVGNaOEk1UzFhbGVpZi9ta1JUR0JOUUJL?=
 =?utf-8?B?d0l2MDRSeVRXSkIyVThNZ3d0VTdoSHFiVjJ4QkN0Qjcvb2VqV051VmlwOVg3?=
 =?utf-8?B?aTVpcGFMUEdkMWx1SkdpMUl0VGNRSDBJd3k5eDBhN01oOGxxQ2RLOEZmVEtR?=
 =?utf-8?B?VGprVFYxdk9ySnM4YVpsNHVNQU5WTERRTE9WVXpGL1RwMUFjMlVtSEhnaFVO?=
 =?utf-8?B?d3I2RU15aUJEOGdpUnV0UjljZEpnVHVEOXNERXdISWU5Z3pjZXN4QkhrWUR0?=
 =?utf-8?B?SkNiZ3lWL0JkRm42eEMzZGwycWtGU2lDTC8zSXp4RmZoRTJnMEZZU0U3Vkxn?=
 =?utf-8?B?Vk5ERi81YVNDc3BNVHFsMzRQMEIzSGU2L2lhQlNTOTRUNHJYRm0yRnJ2MTMr?=
 =?utf-8?B?UUtBYUhVekZaWnhEMzRMSkwyaTZwWnJ3SzhqQWo0OHliTXRKMGhCMnNtRDYv?=
 =?utf-8?B?MHFsdS9GSE1WZ1EwcmtoZGJkYmlDbmNicWNMSXBuWXRDcnFpbEJQV3BlUndp?=
 =?utf-8?B?UkRWOGhvSlU5UDVCWXZBcUpyT2owUHVsZDJrSlVjRjhablEzd2hiUnlleDRF?=
 =?utf-8?B?SUVvRGRqL3BHTXlCM053TE0wYjJ2MVk4TDQvYVl5L09wa3RXRGpzdUNWL1Bi?=
 =?utf-8?B?NjV5bi91MzZxTmZqNDM0bDFFWlhiVVVaRGw1ZEFpYXNnbzVmWEJqeUFScjJt?=
 =?utf-8?B?OE91Mmp2TkVaVmg4bWVrMXJRRjNKNmpTVUJXUlJRd1ZFZHVnZGxDT0MxZW1s?=
 =?utf-8?B?TjdPbFlxbTRNb0JRQkV4bm9DaGNyYkJSR08yNDRkZG9ydDE5Q2Q5NVBQb3FU?=
 =?utf-8?B?WjVoWncrVFlvRjA3Yi9GdUg1ZTF3V3UxN1NqVGlaZ3oxbkhHUElzcnhJSWZP?=
 =?utf-8?B?RzlLQzB1cWo2OTRQVkxGRS94aENQY0FmL0F0bzBQc2ZDS2Y4L1NJQVQrZ3dq?=
 =?utf-8?B?WE1BcmhySFA1MkgvR0pRSURrRTdaTkJmSjlFTHRDemFyRVdRejYvTXJHdjlo?=
 =?utf-8?B?N1FTS3UyTG5kRWFyVXVjM054ZWk2U1ZzN3JUNDhjZG8raXFrb2VWb3prVytI?=
 =?utf-8?B?cXcvckhsRXlXRnVlRFlYeHA2M1NUb3ZYWlBDNks0VUlacStsbk43ZVZVOFlL?=
 =?utf-8?B?ZDVwK2dnN0tYdnN3aHVuSnZ1YXZXSDdCclJmQ1NXNG5JK0NoYUtRUVFxVEcv?=
 =?utf-8?B?UU9MdlU0KzFhNGlZOU5GUEFPOU1EQkYwbGtoekdPdjI2QjRMUUhNT1lUc1Rn?=
 =?utf-8?B?Y01rY25VT0NDRTVwOEhHMXkwcDJDam5UaFBxTDY5RGQ3b1cwTldFb09DR1VW?=
 =?utf-8?B?Q1BzMDRUM2dhV3FWNldRdW5jUlJJeHhhL2srZitrYTFONjlnalR4RmlCNVhz?=
 =?utf-8?B?Zk9va0dTaE1NOW5vWDRRdmZZKzFhYmJ5c1Vuck1LTkNLS3M4RXF3RmRyUDFp?=
 =?utf-8?B?bGM1Uy9tV0JDYTFHWXM2YklTanNBalJFdGlsa0dBVUZmTXZzQzNKVzVaNXBG?=
 =?utf-8?B?VHZJelowMnJ5cjdTZ1Y5K0JEQmpFSUlUUlZUbFRzVzBTQjk5bWI5aDlENVBK?=
 =?utf-8?B?eDhEQUMveDRZUTI1SXVXSFF2UHJkNVNqZHNoZUR2clh1OUx4TDFwNmJiQzBU?=
 =?utf-8?B?VHQxQlB4eXQvQkZhTWlBUisydC9HWHBUUmVaemt4NWZpMms4Y1M5YXlRMGZ2?=
 =?utf-8?B?ZGdEekhGLzhFTWNxR2VEbFR3aGlSSDlRUitOVG5GVTBHS1lhTzE2ejZZQitS?=
 =?utf-8?B?UUYxL2pmTnlrcWhCVmhmeXFSeFoyT0ZCVEFsN2RvRmxNOEtqU1hQVzR2NTFV?=
 =?utf-8?B?cVNaNUJFY01vMS96OWZ1ejhFY1Z5SVM1a3BXdDFEUTVjSzM1YmRuVGNHWFVP?=
 =?utf-8?B?ckdDTnNGTzYyWTd0V2FyZGkxQ2FoOVAzS1lVRDhZYXgyUFJiTXo2Uks3QWU0?=
 =?utf-8?B?NDM1YjFPbnlzbDRzTXBuUWRreERWQWJ1QS9DL1kwbXQ0ZFVoVXlLTEF6cVlZ?=
 =?utf-8?B?MGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a025f03-74ef-47bc-9f08-08de2290b7b5
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 08:43:28.7393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gG/ibSZMrmIhfSR4Bv2MmRwn2azpD1rwcuDt5ClRkAqAboSNE3SKphcRlEYJnISiEbce26L1Mr/9zvKjhy+Vh/HSkzdPr6oyhxK9SbeIQA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6828
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on śro [2025-lis-12 13:44:08 +0100]:
> Instead of trying very hard to find the largest fair GGTT size that
> could be allocated for VFs on the current tile, pick some smaller
> rounded down to power-of-two value that is more likely to be
> provisioned in the same manner by the other PF instance:
> 
>   num VFs | GGTT space (MiB)
>   --------+-----------------
>    63..57 | 56
>    56..29 | 64
>    28..15 | 128
>    14..8  | 256
>     7..4  | 512
>     3..2  | 1024
>        1  | 2048 (regular PF)
>        1  | 3584 (admin only PF)
> 
> Note that due to FW/HW limitations we can't share all 4GiB GGTT
> address space with VFs, so for the larger (>7) number of the VFs
> the change in the outcome is happening at different points than
> we have in case of GuC contexts/doorbells IDs.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  .../xe/tests/xe_gt_sriov_pf_config_kunit.c    | 46 +++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 23 ++++++++++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> index cb3db3e793e1..42bfc4bcfbcf 100644
> --- a/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> +++ b/drivers/gpu/drm/xe/tests/xe_gt_sriov_pf_config_kunit.c
> @@ -145,11 +145,57 @@ static void fair_doorbells(struct kunit *test)
>  		KUNIT_ASSERT_EQ(test, SZ_128, pf_profile_fair_dbs(gt, num_vfs));
>  }
>  
> +static void fair_ggtt_1vf(struct kunit *test)
> +{
> +	struct xe_gt *gt = test->priv;
> +	struct xe_device *xe = gt_to_xe(gt);
> +
> +	pf_set_admin_mode(xe, false);
> +	KUNIT_ASSERT_FALSE(test, xe_sriov_pf_admin_only(xe));
> +	KUNIT_EXPECT_EQ(test, SZ_2G, pf_profile_fair_ggtt(gt, 1));
> +
> +	pf_set_admin_mode(xe, true);
> +	KUNIT_ASSERT_TRUE(test, xe_sriov_pf_admin_only(xe));
> +	KUNIT_EXPECT_EQ(test, SZ_2G + SZ_1G + SZ_512M, pf_profile_fair_ggtt(gt, 1));
> +}
> +
> +static void fair_ggtt(struct kunit *test)
> +{
> +	unsigned int num_vfs = (unsigned long)test->param_value;
> +	struct xe_gt *gt = test->priv;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u64 alignment = pf_get_ggtt_alignment(gt);
> +	u64 shareable = SZ_2G + SZ_1G + SZ_512M;
> +
> +	pf_set_admin_mode(xe, false);
> +	KUNIT_ASSERT_FALSE(test, xe_sriov_pf_admin_only(xe));
> +
> +	KUNIT_EXPECT_TRUE(test, IS_ALIGNED(pf_profile_fair_ggtt(gt, num_vfs), alignment));
> +	KUNIT_EXPECT_GE(test, shareable, num_vfs * pf_profile_fair_ggtt(gt, num_vfs));
> +
> +	if (num_vfs > 56)
> +		KUNIT_ASSERT_EQ(test, SZ_64M - SZ_8M, pf_profile_fair_ggtt(gt, num_vfs));
> +	else if (num_vfs > 28)
> +		KUNIT_ASSERT_EQ(test, SZ_64M, pf_profile_fair_ggtt(gt, num_vfs));
> +	else if (num_vfs > 14)
> +		KUNIT_ASSERT_EQ(test, SZ_128M, pf_profile_fair_ggtt(gt, num_vfs));
> +	else if (num_vfs > 7)
> +		KUNIT_ASSERT_EQ(test, SZ_256M, pf_profile_fair_ggtt(gt, num_vfs));
> +	else if (num_vfs > 3)
> +		KUNIT_ASSERT_EQ(test, SZ_512M, pf_profile_fair_ggtt(gt, num_vfs));
> +	else if (num_vfs > 1)
> +		KUNIT_ASSERT_EQ(test, SZ_1G, pf_profile_fair_ggtt(gt, num_vfs));
> +	else
> +		KUNIT_ASSERT_EQ(test, SZ_2G, pf_profile_fair_ggtt(gt, num_vfs));
> +}
> +
>  static struct kunit_case pf_gt_config_test_cases[] = {
>  	KUNIT_CASE(fair_contexts_1vf),
>  	KUNIT_CASE(fair_doorbells_1vf),
> +	KUNIT_CASE(fair_ggtt_1vf),
>  	KUNIT_CASE_PARAM(fair_contexts, num_vfs_gen_param),
>  	KUNIT_CASE_PARAM(fair_doorbells, num_vfs_gen_param),
> +	KUNIT_CASE_PARAM(fair_ggtt, num_vfs_gen_param),
>  	{}
>  };
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 80cc3f2cd047..56c03e6cb849 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -9,6 +9,7 @@
>  #include "abi/guc_actions_sriov_abi.h"
>  #include "abi/guc_klvs_abi.h"
>  
> +#include "regs/xe_gtt_defs.h"
>  #include "regs/xe_guc_regs.h"
>  
>  #include "xe_bo.h"
> @@ -697,6 +698,22 @@ static u64 pf_estimate_fair_ggtt(struct xe_gt *gt, unsigned int num_vfs)
>  	return fair;
>  }
>  
> +static u64 pf_profile_fair_ggtt(struct xe_gt *gt, unsigned int num_vfs)
> +{
> +	bool admin_only_pf = xe_sriov_pf_admin_only(gt_to_xe(gt));
> +	u64 shareable = ALIGN_DOWN(GUC_GGTT_TOP, SZ_512M);
> +	u64 alignment = pf_get_ggtt_alignment(gt);
> +
> +	if (admin_only_pf && num_vfs == 1)
> +		return ALIGN_DOWN(shareable, alignment);
> +
> +	/* need to hardcode due to ~512M of GGTT being reserved */
> +	if (num_vfs > 56)
> +		return SZ_64M - SZ_8M;
> +
> +	return rounddown_pow_of_two(shareable / num_vfs);
> +}
> +
>  /**
>   * xe_gt_sriov_pf_config_set_fair_ggtt - Provision many VFs with fair GGTT.
>   * @gt: the &xe_gt (can't be media)
> @@ -710,6 +727,7 @@ static u64 pf_estimate_fair_ggtt(struct xe_gt *gt, unsigned int num_vfs)
>  int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
>  					unsigned int num_vfs)
>  {
> +	u64 profile = pf_profile_fair_ggtt(gt, num_vfs);
>  	u64 fair;
>  
>  	xe_gt_assert(gt, vfid);
> @@ -723,6 +741,11 @@ int xe_gt_sriov_pf_config_set_fair_ggtt(struct xe_gt *gt, unsigned int vfid,
>  	if (!fair)
>  		return -ENOSPC;
>  
> +	fair = min(fair, profile);
> +	if (fair < profile)
> +		xe_gt_sriov_info(gt, "Using non-profile provisioning (%s %llu vs %llu)\n",
> +				 "GGTT", fair, profile);
> +
>  	return xe_gt_sriov_pf_config_bulk_set_ggtt(gt, vfid, num_vfs, fair);
>  }

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>



>  
> -- 
> 2.47.1
> 

-- 
