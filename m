Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF5FDCF9C6B
	for <intel-xe@archiver.kernel.org>; Tue, 24 Sep 2024 17:27:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8AA3510E096;
	Tue, 24 Sep 2024 17:27:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Xzxshueu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A5E810E096
 for <intel-xe@lists.freedesktop.org>; Tue, 24 Sep 2024 17:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727198836; x=1758734836;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=lPqbl223SQzLhVFJkJpykJttfdYVPppEqvNMAbI1rBI=;
 b=XzxshueuP2DUrMhp+NmS8hwm2X8sx17IldeSbe74cJVL1TC+7HiE4Nxl
 EwhA/wgtLy8O1C9r1BXN8/4PxsVdBL/0wlI+DB7jcYhgBDsTPB1TXmuWi
 5aROkXmXVYnYjD6uM+GOxPT/5/yQ+4nU8vRsB0r+Puz7cPpv0DyhSSuwY
 u6Z2UhCQHlfiQd7Q4ny258psNEQ8+1+fAlQpvADHDBWnhEB2n2HH7p+Dj
 m4eE2EG2YceFDl1+ac4i415QK6v4WpOSfbP2g+K/O9h4tkW0I2o6kNjFL
 krqznTexB9tYMB+1nHm4YrgRHVF07SmGpVOIwos6/Pe3NzVbKqAaRlmaj w==;
X-CSE-ConnectionGUID: rELOx63ZQAiOati7fQeprw==
X-CSE-MsgGUID: FAXCqXmcRlmur5el37YaUw==
X-IronPort-AV: E=McAfee;i="6700,10204,11205"; a="36779470"
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="36779470"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Sep 2024 10:27:16 -0700
X-CSE-ConnectionGUID: nEBAC1HeSu6Z9xbZn3c5eA==
X-CSE-MsgGUID: i8sD1e7nQGG2DhDNQkKBkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,255,1719903600"; d="scan'208";a="71375561"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by orviesa010.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 24 Sep 2024 10:27:13 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 10:27:12 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 24 Sep 2024 10:27:11 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 24 Sep 2024 10:27:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 24 Sep 2024 10:27:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=INp505/tD/3k6SR8nTj0k2xMRwnVTh2VcmEbj1hjtngS4WTY8BaKdZbuzDf3D9iArlJqbg7K/Kpf/QW0wMFDpojCywXLOOD2LLZ0DoOrEeXiRT1iosuIBlz4w5/MdYwdDgqaqN+gHb2ZFS7kKyAa0zYUW0SOIMaUb7K+z/Dy5OGl0Z220GzDzjhvtqXRj1ixsEgXh9nTcQlLn0XmuNgKX5sFTeQ2gSXZbr6zUEPqkDKfEmHcxwacwxfBb0qgk/nDYozpNqEuBqb4qEz7mEYQr4cdOax14usDB3/DbEJHYNr9zVkbvgzPsQjrjRUNl2Qsd2FRdhV7s0RACfEta4CguA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T94plYb+YbN4P6ywymBzKSjfGGghXn/3l1PgeWVke90=;
 b=csmpZz9nG4K3jeLEY5iCWfxVxtWgi632RwoVIm63vruQ6+gSl8565X5yimDRHBw9Ic0hqpyVzmlFK3dwKlHF7j11cE0XDE65WgJrAQKh+dmQBdNLRJBT/LyHhju1ofeCp5bp4PcA/PaCIDHXkMGDgXHEhYImRYWBp1nR5RjDvFYfEkjXrFSLPLx+InaNQ0LC2kBoqt4ZB/qhT8agV0WTTxwnzb99DMUYbQrPb12CSJ3wE57n5djJ18oQT/r/z4BnlezvHX4b6661EtkhgknKAPiThu1DEe37VK+w28fjuIA1i0g514x4KiAo1PoFt1DMLTaP7ijGSPa0aQlV0ierDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by DS0PR11MB8687.namprd11.prod.outlook.com (2603:10b6:8:1be::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 17:27:07 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%5]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 17:27:07 +0000
Message-ID: <b76291a0-5f02-4601-86ec-c6da607705f1@intel.com>
Date: Tue, 24 Sep 2024 22:57:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/23] drm/xe: Error handling in xe_force_wake_get()
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Michal Wajdeczko <michal.wajdeczko@intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, "Nirmoy
 Das" <nirmoy.das@intel.com>
References: <20240924121641.1045763-1-himal.prasad.ghimiray@intel.com>
 <20240924121641.1045763-2-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20240924121641.1045763-2-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1P287CA0014.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a00:35::31) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|DS0PR11MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 194e0702-2fb7-4779-fc71-08dcdcbe1d3c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?anpFbjZkQnp5MGx2eWJJK2NBOWF5eENOeGJZcjdPalVEamtpM1V5VFVDVjNE?=
 =?utf-8?B?YTRQd0hKLzBybjEybmIvNXJwek9DbjYrM1ZDSkQrZ1pwb2JnWmRhc0VEVElO?=
 =?utf-8?B?M01lODByMElCa3pac0VhZ0tvOG5pQXNzOE80am1BRE5KRlg4YzJDSEZQdHds?=
 =?utf-8?B?WDJXeFhSa3J1aWZRYVpQTzVrbDF5T2p0VmxWT1VkdlJ3SVFicjFRWmtvOUEv?=
 =?utf-8?B?YnVZM1BZYk51R1FKUlhtTmdISzRKdVVLT2VyY3R1SGZ0MlVSb013bWdVTDBv?=
 =?utf-8?B?R3JRc0tpMldzTzhxSUlRZ24xUnE5SklsQjRIWjB5OUZKaWRsRm5nTE5vbnpZ?=
 =?utf-8?B?K1hvWXFvTWYyWjQ2VWpmRFhTZlZSVDZUWW56QUs5V0Q0eTdxS0FidzY4amcw?=
 =?utf-8?B?bURNY3hzVnQvbzh3TGZPVHYrMldFUFE4b3JzOXN3TWJXQlk0UWhhbHBNcHlm?=
 =?utf-8?B?UHBCSjY5SGpPNjRlMWs0V3J2YU5iWkgwRGd5ZG8vaUxpYklONFZGaEFZc3hq?=
 =?utf-8?B?UE1HcDFDUDYwYTdneEZDVWI4dzZPV3hjOWlEQWFFdWZrVDZqNWV5U0hvdG01?=
 =?utf-8?B?T0Y5NWdHeHYxbTBBa3VkRkxwYlRHMTJud3RucCtxWFFTNktNQm00WFlFc0dX?=
 =?utf-8?B?VjVlYXFXQ0NGeWhVSXB6Qy93VGovTnZHTmphMWNESjJBY2tCOFR0RTdzSDZY?=
 =?utf-8?B?YmZlZFNnSDEzYW9Lb211UGRHdExCcmwrTmZuK0lTWkdtN0NkQWpiZHdzUm0y?=
 =?utf-8?B?bjBFYXhNSmdVdHRnM1FxVHJiT2M2SEw2MjNHdk81U2RMcURpTEcrMDFhai9M?=
 =?utf-8?B?SDd2aTlFQ3BmNHJNQWZYYm1jMGN3NzM3WFY0ZzMxMU5BMDE2WVIxVnM2VUNo?=
 =?utf-8?B?U0tYRXFLRzJXQVAxcFIvMG15L3VlWHZSaFdka3lLbVV1NjZuN05DaFRBRHpk?=
 =?utf-8?B?Z0t6enEyY3F5N1l5N3BOaFhWaG5VaCs3Z1Vzb0FTK2p2RGZ3UVh3N0dpdnpr?=
 =?utf-8?B?MDhWenZndnljaUU4WkRlOVRDSjgvSVNJSXRZNUN4VW53SHJGcTRSOTJ5aEp0?=
 =?utf-8?B?cHFrTC9nczVGT3NSaHFXVmJ0NUJKT0VEemE2WnZpaUVoVzZjRVZJVmVHVmQ5?=
 =?utf-8?B?Qm8zZE50T2VSa0xlSHhNL1lveXBmei82VHRvbVozNGlqVWdaTkhTNVRyRE5s?=
 =?utf-8?B?ekJ6SG9IY3VWY211TjBqVFNKUTVYbEovR1F4OVF4WXd2TG94Q2tBZ1M1Qmxw?=
 =?utf-8?B?NmZvQnRPK2NIRnc5NnI1WHV1aDd3cW9UMC9UdFQxY3RoSFFVMmFvOFgxYStL?=
 =?utf-8?B?b3RXUDFMblRMMVFvM01DZkI5UWV5WnFTS3JkR0txMVlCS3k5dmJ5ZTl0bE0z?=
 =?utf-8?B?L3R4bEt1dzh4WE1vek9zem1oVS9lUVJpaEF2WHZpUlc4N2hGSUVwM2FDM2VK?=
 =?utf-8?B?cmV3eklLOFc3dzdzbnJOSXFBYzhkak5QYTRzSlI3b3ZKdnlhR0p6TVF2WEti?=
 =?utf-8?B?SXp5M3pKWGtEdFQ4Y2IreGFtVkIwV0hyTXBkSXRGK2I5U2greURsZDIyMXA2?=
 =?utf-8?B?blc0ZzFhNzBZNmJXU203SlFCRk9UajVFdk41cHFKQkxnQTZpdjZpTXBjRURa?=
 =?utf-8?B?V1o2a0FGQVptZ3VtVWl2c2ViTHhxWnc2VE5pMklreFllaFFXSnlMU0d0MTly?=
 =?utf-8?B?QWN6QWhKeFFOTDNlaFZkWGQ0NXVpZXZqT3N6KzNYMi80ZXhoUUxrRHEvdEc2?=
 =?utf-8?B?SDNVTUxaR29FUWhNNHk3TEZ4U0c3R2VYYzZ2R0p2WHUvUEhlMVUxRW9WSnY2?=
 =?utf-8?B?SXBiY3Y4NDA5WHVqT3pVZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3krU3dEZXlxNnFLM1QzVUNVSDUvUzVUUG5rbldZTjkxVkduVVdoYVg3UHdv?=
 =?utf-8?B?MzJxT2llTkY2KzlQdDVtYXZzeURyclpwRGNRazlMeW84VWs5U2djKzZqcXVI?=
 =?utf-8?B?eFppd1g3aWM1UHdEeFJaMnBXYjZsN0JYYkxiR0xZUTU4UzNZOVBlSmFzQURp?=
 =?utf-8?B?Wkc4YW5FNXhNdWtpY1NoSVJ1K2Qxc004aE5TUmluSkFZZ1REOUNVdEZGNFEr?=
 =?utf-8?B?OHVLODh2azNMS05VQzZiYkFHY3pnKzF5R2pQRDRyMXdjdSs4TXZPVXBNU0N6?=
 =?utf-8?B?SENQVGdGZkZLWFo0bjJvb0NtS3QwNXY5ZStlSnJ5NG1iSU5QNGJzWkhYanR3?=
 =?utf-8?B?VTN0M1k4TjZYM2xHWXMrQjJDbHFWQ1N1eHZDZG9UNTE5RzBpbmpSRjNJVHpw?=
 =?utf-8?B?VmhvTFA4bWdKekdHNVJVVGE5VXlMcFoydlErNzRZMXNRZXp0ZjZNTzhvSytF?=
 =?utf-8?B?ZEpwUTlXL2xxcU5XNVB5UC9lSk5kR2IyY05zeGk0Z0IwK2FReVdhRzFPZkdC?=
 =?utf-8?B?WndUcDg0MGgwMjJCeGM4ZUx5Sllna3JDZjl3bnl6a0NobjcxcjVSeU0wcVBh?=
 =?utf-8?B?T2RCa29ZZk9LejBMWnB2b0swaiszQjhxVEVPYTBuV3NCUGJyNkpZR3BuNER3?=
 =?utf-8?B?VlJRUXJFQWRWLzVPK1JqU3RGL2Z4elROcU5uRENUek1wcHQyWklJRTdjbVBO?=
 =?utf-8?B?aVBpL2dEaDAxMjNseU9IWkpqdDc5L21rb29SMXBTcS9FTjg4VHRyQzdKQy8x?=
 =?utf-8?B?N0hIQTZZMUpiVUQvS1lsU2RvUjdyRnQ0dGxmNEl2b3J2SXJPeUV5djZvbVB1?=
 =?utf-8?B?TGREOVFQUXJMSG9RU1g4SHZSQmtrcnVwbCtaYnNUaS9jQzhIUkZSNHpNKzJN?=
 =?utf-8?B?SXgwcG0wM3Y0d3dJaEVPSnBIMXZHMTNVRmM3S2M1TkRBRnBCS3pXSW5lL1lp?=
 =?utf-8?B?Wm53NTEwYkFURmhXSGRtQWhXbXFraGVudkxsdUJaWTdBYmFsM3dJRlBPVEtj?=
 =?utf-8?B?V0JtSWNXaERrUXpBK1QxWnBwL3JtM01uU3dMVmgrenNrTUU1aDBnOWdIZ2FS?=
 =?utf-8?B?M1ZDRVBRKzBMY2poQXF1Vmd3Z3lkM0p3Qm9kV2plZ0tHRXZNL1BsbWlnRWZW?=
 =?utf-8?B?VUNQMmVLSUpSOE04Zy8rcG5OYmEweDIzbHc2WHgxOUFXallmcEx3N2tHSTY2?=
 =?utf-8?B?S3dWclFNYjR2VG8wQlFIdFNiQmJBbUdkL1hoQWx2VzJwRmZkS1ZFZkgxcHN5?=
 =?utf-8?B?OVFNckQ2RVRtZVZkMHMvUGRXT2ExSm9rUFF0QWJSd3NrV3duNGhiaVZYWlJN?=
 =?utf-8?B?dCtQZUQvbm1EYlhkcnU1VldGODEwekZMRXRwZHpySmRmdnhnbTIxNnROeVh5?=
 =?utf-8?B?ZlRmd25DRkZLOURlWkRjUU9XTEVsUGRQVXFTRWFBbXVzRTJtZkxzOGhYN0Vz?=
 =?utf-8?B?SzZDQVFXUGhkOFZ6ZHFPREhPalRSSC85QjkyM1NsVFc3Slk0OTEzYWJGZjc0?=
 =?utf-8?B?b3AxMzhPTDgvcWtna0lreWkzSkVXUzdWcGpWelpHYnBhZ0ZXa2kwdEVlbzdq?=
 =?utf-8?B?VEg4WlZHdUZadHNyRmU0SVVxenVsNTFBMjYyUnVTSnNwMUo4U2tpaVRFSUFa?=
 =?utf-8?B?bGR1U0hMOGlGTjJkL1RSN2JPTXVTcG9RYVlGM3E2YzF0eUQvUlhQWEhzWkZJ?=
 =?utf-8?B?TDlyemRPdEpseTJSU2pza0g4Mlk3dFJiM3E2MGtPazg3V1o1R2JUU1VEQ1R3?=
 =?utf-8?B?T2FNMmtocXNXRUtJVzJrTE1JK2ViWEo3REN6aDNOZGRiSzA0RlN0STFPN3Ar?=
 =?utf-8?B?UG9xOVd5MmRZZ3FGUFFRbk9xSFRwSWppV2RxUmdUZGtJdnBPQncxNDdadHRW?=
 =?utf-8?B?bXpkandBQjRkRjNoK3B6Q2tGbTJIRkt1S1lQMG9iYXlQNms0UFd6ZkhwUWlh?=
 =?utf-8?B?VWV4a1N5SnNVSnRNL0dFZU01Ty9pSlM1L1JnTFhZL1VpajNHVXpsVGpEQ29P?=
 =?utf-8?B?aWtuMGdjdUJhWnQ5ZmNEdWxXazl5V3JtOTJHaElQYTI0aC8ySlU1UEdqLzN3?=
 =?utf-8?B?NGVFbVdhalFKV2xNdkh5N2JJL2V1QVJFOUpYaXlqVWQ5akR3cElIcmk3Qjg5?=
 =?utf-8?Q?/wPw+0utnAmNwq1tn62gkwVFa?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 194e0702-2fb7-4779-fc71-08dcdcbe1d3c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 17:27:07.5086 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KTxbcSsxtnY33Oerm8/49Koau7e0W9TpqH0Jdr26yW7YRtgYQCd3cCx6AF/Op8VvMeNMt0c51TlPTGr/a5Ir3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8687
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

Hi Himal,

On 24-09-2024 17:46, Himal Prasad Ghimiray wrote:
> If an acknowledgment timeout occurs for a domain awake request, do not

s/acknowledgement/forcewake acknowledgement/

> increment the reference count for the domain. This ensures that
> subsequent _get calls do not incorrectly assume the domain is awake. The
> return value is a mask of domains whose reference counts were
> incremented, and these domains need to be released using
> xe_force_wake_put.
> 
> The caller needs to compare the return value with the input domains to
> determine the success or failure of the operation and decide whether to
> continue or return accordingly.
> 
> While at it, add simple kernel-doc for xe_force_wake_get()
> 
> v3
> - Use explicit type for mask (Michal/Badal)
> - Improve kernel-doc (Michal)
> - Use unsigned int instead of abusing enum (Michal)
> 
> v5
> - Use unsigned int for return (MattB/Badal/Rodrigo)
> - use xe_gt_WARN for domain awake ack failure (Badal/Rodrigo)
> 
> Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_force_wake.c | 37 +++++++++++++++++++++++-------
>   drivers/gpu/drm/xe/xe_force_wake.h |  4 ++--
>   2 files changed, 31 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.c b/drivers/gpu/drm/xe/xe_force_wake.c
> index a64c14757c84..d190aa93be90 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.c
> +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> @@ -150,28 +150,49 @@ static int domain_sleep_wait(struct xe_gt *gt,
>   					 (ffs(tmp__) - 1))) && \
>   					 domain__->reg_ctl.addr)
>   
> -int xe_force_wake_get(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains)
> +/**
> + * xe_force_wake_get() : Increase the domain refcount
> + * @fw: struct xe_force_wake
> + * @domains: forcewake domains to get refcount on
> + *
> + * This function takes references for the input @domains and wakes them if
> + * they are asleep.
> + *
> + * Return: mask of refcount increased domains. If the return value is
> + * equal to the input parameter @domains, the operation is considered
> + * successful. Otherwise, the operation is considered a failure, and
> + * the caller should handle the failure case, potentially returning
> + * -ETIMEDOUT.
> + */

Here especially for FORCEWAKE_ALL case caller has to strictly compare 
return mask with FORCEWAKE_ALL instead of just if(!ret) and return. 
Which is fine.

> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
> +			       enum xe_force_wake_domains domains)
>   {
>   	struct xe_gt *gt = fw->gt;
>   	struct xe_force_wake_domain *domain;
> -	enum xe_force_wake_domains tmp, woken = 0;
> +	unsigned int tmp, ret, awake_rqst = 0, awake_failed = 0;
>   	unsigned long flags;
> -	int ret = 0;
>   
>   	spin_lock_irqsave(&fw->lock, flags);
>   	for_each_fw_domain_masked(domain, domains, fw, tmp) {
>   		if (!domain->ref++) {
> -			woken |= BIT(domain->id);
> +			awake_rqst |= BIT(domain->id);
>   			domain_wake(gt, domain);
>   		}
>   	}
> -	for_each_fw_domain_masked(domain, woken, fw, tmp) {
> -		ret |= domain_wake_wait(gt, domain);
> +	for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
> +		if (domain_wake_wait(gt, domain) == 0) {
> +			fw->awake_domains |= BIT(domain->id);
> +		} else {
> +			awake_failed |= BIT(domain->id);
> +			--domain->ref;
> +		}
>   	}
> -	fw->awake_domains |= woken;
> +	ret = (domains & ~awake_failed);
>   	spin_unlock_irqrestore(&fw->lock, flags);
>   
> +	xe_gt_WARN(gt, awake_failed, "domain%s %#x failed to acknowledgment awake\n",

Forcewake domain%s failed to acknowledge awake request.

> +		   str_plural(hweight_long(awake_failed)), awake_failed);
> +
>   	return ret;
>   }
>   
> diff --git a/drivers/gpu/drm/xe/xe_force_wake.h b/drivers/gpu/drm/xe/xe_force_wake.h
> index a2577672f4e3..6c1ade39139b 100644
> --- a/drivers/gpu/drm/xe/xe_force_wake.h
> +++ b/drivers/gpu/drm/xe/xe_force_wake.h
> @@ -15,8 +15,8 @@ void xe_force_wake_init_gt(struct xe_gt *gt,
>   			   struct xe_force_wake *fw);
>   void xe_force_wake_init_engines(struct xe_gt *gt,
>   				struct xe_force_wake *fw);
> -int xe_force_wake_get(struct xe_force_wake *fw,
> -		      enum xe_force_wake_domains domains);
> +unsigned int xe_force_wake_get(struct xe_force_wake *fw,
> +			       enum xe_force_wake_domains domains);

Looks good to me.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

>   int xe_force_wake_put(struct xe_force_wake *fw,
>   		      enum xe_force_wake_domains domains);
>   

