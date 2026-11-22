Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C787D606A32C
	for <intel-xe@archiver.kernel.org>; Sun, 22 Nov 2026 07:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=e+ltWEDQ;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=kQW5GVa4
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E72810E3D3;
	Sun, 22 Nov 2026 07:15:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D85510E1AD
 for <intel-xe@lists.freedesktop.org>; Sun, 22 Nov 2026 07:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795331719; x=1826867719;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=BuS3Q5iFzRePJLAUDUvHGglFXwsRJ6fB6sp8x/3i5dI=;
 b=e+ltWEDQAWMpTfRm5sBFzbm/g66MLqDiPx7lMkMSQFssQTXCRGXBaqZU
 7fHzHSp3p8PGtlVGgrDsatHnlQU1+H76G4xeYm1xKpOmQoROOKBxBjeeH
 xUUXKNqgIYbxsGyBwJCzXWiVk5gExUxscbQGMGkJmk9GTPszMY68gdunr
 oo6H+1Yn59sGvdNngp3LUD5el9+n4QNkwQJz+2k0OoKT7SpmKsz6ARwd2
 izvT2EbShP2Qod3bo71PskrCFbZPgtaO4BhMNZ1EXugyBkEjzhaIoxxQH
 BcAsckiaYmFqOiL7q4VMUbGsFKH5wXCsHT3fTgKTb4cwatlEzojoUDY9X g==;
X-CSE-ConnectionGUID: l6vQOIdMRiO7BPoExWPbWQ==
X-CSE-MsgGUID: H0ya4qPOSISh8VI7hg+8Kw==
X-IronPort-AV: E=McAfee;i="6800,10657,11973"; a="4192594"
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; d="scan'208,217";a="4192594"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 23:15:18 -0800
X-CSE-ConnectionGUID: mkpcJy7IQIu/vCzu4JXiWA==
X-CSE-MsgGUID: LujLamLkRtei/Moik++wXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,226,1787036400"; d="scan'208,217";a="11375554"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2026 23:15:18 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 21 Nov 2026 23:15:17 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Sat, 21 Nov 2026 23:15:17 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.57) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Sat, 21 Nov 2026 23:15:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=plg8HkA47oFV7bHJct6wG7+AmLE+o34LNoM4bXAGrMRHBx+90riTrv0IvuEDcBK6ImCw5yg25NSL9iKH1DSqoLdGjMcCJRKXxKj7z0X39ZAxSzjSbJKpQUY24RjqOElc/aztDVx5zewSRTkpJCCHe2ECr05Bx7RZpskV1utGi8GkKwa2aRZOVEm6XElcfzcEetCUmV03BhlCFrBlh9ezLy28EjsDc77nFdOpq+mbyyqXzTcUFb3idZxizC/QEtd1Bv9eJWyhnHeRPUzNiLtil2eWxhQWMIkHAinJtinUsQghSr/rIJD8mFBmM5ey31h8M8wxEjnV6mhddni8PkHHeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGBl+aMGwALRcb63RBIo7MMdnlIDUfYeLyoajXmZOMY=;
 b=gVXApbS85RzUdK2vJpMuB2O8trVJJZicFXo44TURxzRFfk2v6AspCP7wMECM5HIcZQSloE1dtXpbFPbtFqynonZq8CMSeGCIv5OdR7yaFjZtx20sUnr0FfzSzxuiTWXJgGHV4MjwpYSTZqmKews1GiEZXi9ViVAfLwQhYs2ekudKCdKsc5Ym8tqT+E9SpD2dp0bvXzATg/uBk4IMTIlLqLDe+MEr19Ba2JP+BorCBYKld6s57vzvpFKzjDO2fHgi9lqbt2sPpNTeJ0SofFeFP7A9yFXbuLwPBFWMEVlFGIV3S6PIStbdIMBDfVXpiXoV5OquTTreCsxcnykgEEzOAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGBl+aMGwALRcb63RBIo7MMdnlIDUfYeLyoajXmZOMY=;
 b=kQW5GVa45AUk+EpEmW5K6rlY4n+Z6UcfRn724ikiX+edOw8uujD7l+uhsj0yAC3oGY1TFwb7qC177g+rOsYCGnzoBfukeSNw2l6Nr6LYNOYK45Z/nk8OG8MKAdcRcmfLBx2UVf0pdubzvDcj7oUCqO1P2v5zMrsZ115R+SoBYlE=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by IA3PR11MB9062.namprd11.prod.outlook.com (2603:10b6:208:577::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Sun, 22 Nov
 2026 07:15:14 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0639.012; Sun, 22 Nov 2026
 07:15:14 +0000
Content-Type: multipart/alternative;
 boundary="------------st68XdObGZHKyH5sqHnNUqgV"
Message-ID: <7fd3ca6b-c4db-4827-b812-74462fdcab1a@intel.com>
Date: Sun, 22 Nov 2026 12:45:04 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/3] drm/xe/xe_ras: Add support to retrieve info queue
 data
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <daniele.ceraolospurio@intel.com>,
 <riana.tauro@intel.com>, <mallesh.koujalagi@intel.com>,
 <aravind.iddamsetty@intel.com>, <himal.prasad.ghimiray@intel.com>,
 <arvind.yadav@intel.com>, <syed.abdul.muqthyar.ahmed@intel.com>,
 <nitin.r.gote@intel.com>, <matthew.d.roper@intel.com>
References: <20261121064545.168470-5-badal.nilawar@intel.com>
 <20261121064545.168470-7-badal.nilawar@intel.com>
 <awGGnkZvDvpAwAEu@black.igk.intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <awGGnkZvDvpAwAEu@black.igk.intel.com>
X-ClientProxiedBy: MA5P287CA0026.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::9) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|IA3PR11MB9062:EE_
X-MS-Office365-Filtering-Correlation-Id: c135d5ea-5710-401a-a4dc-08df48685a34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|23010399003|10067099003|4143699003|5023799004|11063799006|56012099006|261021123027099003|261021121427099003|261021133027099003|261021130227099003|261021135927099003|261022105027099003|261022075727099003|261022113327099003|261022115727099003|261009221227099003|261009223027099003|261026135527099003|261026121527099003|261028144727099003|261026130827099003|261026140227099003|261102123227099003|22082099003|18002099003|13003099007|8096899003|3023799007;
X-Microsoft-Antispam-Message-Info: 4Hec8f/2dbvtemys9dHCNc0EdZbfFr6DvsWba9u0laT7gattGWaGqNKVG7HGwYOuiEx0trC4fzO14AhaXYHipEh1DLykmvhbI5aR0FUyLosXqy8AIuMDaPUMu/wL2KXi7/L9DNyiez1hw590FG+XOwZYu14yZxl732WfzMXtrXT3UG5c44k5aBo/DgXBg08hOkPCKnbv/GRE/ZfNag3WCGpFaDx9QlkCZSjxGVtSrHf39ahxT7EAEQNFM+TAIiIhnl9zu+n4Nig8hj44G0LhVdJoih+t/1pPop5RkhkU6haKl6EUQ/trNUsuLKj6NUCQIDLfJ7icR3AKR78o4f0Zn6mbuveQlEgPpjZivB7WHaXGQzTdwxU3XsrYL8IrqWUS/Fytr3yL784BvUrXi2lpYjtq/jweujU4xt+bspJjzI9pImo45i8Z0uFwVs8uRcySCwZTOXjJibCtiS8za0YsbPalkDaEDi8edU/jr15NvnQKtdkIrOqzBX8vcP1otSOgJIh4w1h5tUpVvFL4uOYnohmg9zHuu30o2b2j28zKIkU6rtftuwB0uaBLYJyg4P4acXWaQehCwIa9qi38d/UIHQ4YbR886QooJF93PtvgQBb4dTYYTO36XgARDng5Y38y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(23010399003)(10067099003)(4143699003)(5023799004)(11063799006)(56012099006)(261021123027099003)(261021121427099003)(261021133027099003)(261021130227099003)(261021135927099003)(261022105027099003)(261022075727099003)(261022113327099003)(261022115727099003)(261009221227099003)(261009223027099003)(261026135527099003)(261026121527099003)(261028144727099003)(261026130827099003)(261026140227099003)(261102123227099003)(22082099003)(18002099003)(13003099007)(8096899003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEN5ZEZpZGtPemlRazlkRFo4d2t4amJrWldhdEZtZGE2NjlCdGdldk96eGZW?=
 =?utf-8?B?Z0xveFdFNmNGa3FxeU90clE1M3pTaHhZbUJNR0VNZDhiQnZtOHNiRXF5M2NT?=
 =?utf-8?B?YXNYejB3Qkp5SWZVRGY0MENkTUZSbFhIMVlFbDFzeVBJZG5LZ0xjWlB1Zncy?=
 =?utf-8?B?VUwvMUxMMVFrOFZEZGNKSmJOeit4T1NRVUFxRTNUNzU4QUpGdDluVlBPKzAz?=
 =?utf-8?B?MmVjenlDdEhyNXNZdXhXVTlyOEJXRExpUkJUb1crb2R5MWhYeW1LNlVPcE9X?=
 =?utf-8?B?Q3grTmxQVTMweVgwU2ZQTUtORFUxN1VWNHRSdWxJU3FzSVJ6TDY4Q2t3eURm?=
 =?utf-8?B?K3VSM0VrQVkwRW1xUC9sTUY5MWRDV2YrWnFTdjlaTmVmV2FUb052UmkvOUdZ?=
 =?utf-8?B?b205NmtyQ2pUZjgxRG9vdXRCaTVYaWViUnI2c2lPOEVzYzJoalZKbG42TUxC?=
 =?utf-8?B?czlka2xiVTZUMDhYWEtWemZyQll2MXdnQzExZmdFSzl4VWVCT3FxVEFrK3FX?=
 =?utf-8?B?bk85Y3JJOFZMdnlYaUc3VWFtelM5YVhFeTFhOHgyL3BXdHVqTVEyMUxuRXVn?=
 =?utf-8?B?RUpSUW12dCtTM0JVWWJPZHp4NzhTbzZ0TUY4K0l4VzhhUjlGMWhSR1QwUTJQ?=
 =?utf-8?B?QkdCcWRFU1hCWmhwUDM4aVQ5bUhFVWsrZXRBRHl6dm5SZnJzMmJ1NlhxM2xN?=
 =?utf-8?B?THYyTHBkVkxUa0FnYlBCS2xUdzVoeml6SjBJM1BTOGxTQUF3QUxJS1h1YW5F?=
 =?utf-8?B?a3o4d2xKWUk0dzNIVGd4ZUMxUDhHLzhEb09GM1Awb0t0V0VUU2pRS0gzeWRV?=
 =?utf-8?B?UHJLb21tamtBb2pobmFWYStZS2hGcDVxeThiQWdPUk1GU3prL0RuMDVFN1gr?=
 =?utf-8?B?SkUwa0NJMWhDVndCcGRxcWJzdlVVbnFscmZsTlpaWVhiYzN1V0FRYVpWY3d4?=
 =?utf-8?B?R2ZEYnA5cDdJazFOODRCMkZzcHdCMkkxS2tRTlhzMjRXWU1kNVM5eUNQQklp?=
 =?utf-8?B?WlZZc3NONHpWbEJNK2lvV2YyVHh0eVBDVlA4L3FTUmpzSi94T1paV2M1SDZy?=
 =?utf-8?B?dDU0dVZROUZjSjBUWllWS0JvUWN3MnpFVEl6SFN2bkxJYjdtWGN6aFNCUUJK?=
 =?utf-8?B?YVpYSjZ6eHMzKzlkcmpWWVFuNGhKVU5WN2lLSEtsZzdJeGFveGVWdnluVWVX?=
 =?utf-8?B?OEkrZG5wNjd2QW1leDR0NVUrVXZPMGF1WGRvQmFZY2FleXd2TkJ3WlJSdnp5?=
 =?utf-8?B?aXdCbmNrb3UzZGVhcVV0aXJPZ0xRQ0JWU0hIeFVWZGsvVFVKY21FK2NLWC9Z?=
 =?utf-8?B?MUFOY2xEUTRNN0RVSWRmYlFlYXJGMnlYQkEyL1VtQmF0Nm4rZ0RtQU5lR0da?=
 =?utf-8?B?MXZHNEVuamNpZ3cxNjFsS1djNFM3dHVLY0FpMEtuQytOY2dHQnVIQkVxODZT?=
 =?utf-8?B?dTdZQm1iK1phU05SMCt4S2pkM1ZJTmdCb2t6Q0N5aWxYTFpLT2tpOGhGMkxI?=
 =?utf-8?B?UHZvbTYvZytPcUVuUk4yczJabm5xTVI5Wi9XV3BUNTFsbXM2OS9XUkZ3bkhL?=
 =?utf-8?B?ZG1WK0E4Vzc4RjUyNml6ZmllQ0dUODcwcWJZTjBhU0d3TFhZVDBFNi9Ya0hY?=
 =?utf-8?B?Q3grYTNWdHgxZTV0Umx0Nk5RRWZDK254Y0tkUWRrQ1BIN3VaS0lVcUthejAr?=
 =?utf-8?B?cHJkNlBsNTMwTTJyODhiTkREWmFlVUlpdm4xcUxuMFNxbHBxTDR3RW9IWjN4?=
 =?utf-8?B?Qzdqc2daT0VFb2N6ZXFJUXRRQ09UR1ozYTV4WnI3UFlOQmFEZHo1SjVHUVFC?=
 =?utf-8?B?VUxBSnVnNjRBM1RTTEttc0dUN3NmMHcrNWw0OWFzbGhITEdlYktNUmFoNW8y?=
 =?utf-8?B?d0l3RGs2Q1VMQTdHZHR5eGFtd3BuMmZBai8vK0hUNUV4VW84bkxscjQwQmF2?=
 =?utf-8?B?T0hLeE9rdkJ0a3hFRFJpUXkwa2lONXF6SzVqbDlRUmZrNUh3WXZNUURPVElB?=
 =?utf-8?B?dTRzdlBOQUdRdDdxOVVHY29leDloWWIwd0tOcXgramhiK0svblpiV3UxZklh?=
 =?utf-8?B?N1VxTmFFaGhLYlNUWTdmcW9xelZidEdNWkRuT2hNMHNSRTRYKzZsS2daTGFF?=
 =?utf-8?B?Sms5MFNYMFlSWWlkVTFveUErQzNrNk1QQmNhWG9qcThTM0hNN0tBcFpxMDhH?=
 =?utf-8?B?UWtyOFpoY3ZwcXVVVmtNN0dWMlkreXZFYzNFZllFNFNMM1VmanY3SjFjM0dj?=
 =?utf-8?B?V1ZTaUM3bm1EaDRQSEduVEZ0S0JXVmVFTmN0NFcwTEo0QWxYQUdiVjQ5MWFl?=
 =?utf-8?B?T0JhczdqK2EvclBBNVpRQzg5Mm0xc0QwNDBaVmpraDB4Q3hsd2VDQT09?=
X-Exchange-RoutingPolicyChecked: Uq/0f/fg7OttsEqWiHVgtnjYl4AwOFnTTHrnVEqWRQYUUWUD84NIKDfDP1f/namhwHmDu8gsrmKsgL/vY/j9HbqrqyMASfBKMDilplPjLx/5+zmxJfC/OsiwygHSitm21TOh7xUVaqiDhOWD2HmmIVpHVu6CNM3ZzAYRiJ+4Ng+O2Dlch8A6TREAS41qQzhb5VTu1sORjb6BUS41a1bbJD3i3nVXZihcOvJrhUiCA36CLnksvPzsZVj+Xi6Ia6MUAK/pz7Wl1QRvs88lzrzIUTGd0eVBy8HBjt7VX7Npz59kJcUKs9DbILvNDzuexdv7uuVc4PJ21IkURqUH2+rWhw==
X-MS-Exchange-CrossTenant-Network-Message-Id: c135d5ea-5710-401a-a4dc-08df48685a34
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2026 07:15:14.0869 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cu1hwq3C+BrA+deSMEtVPSF3ASKh7TeYNU1llemX/ALr+ZHv926UW89DV/AHNQZvZ+2CqJcZsMz22O1uiiiqeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9062
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------st68XdObGZHKyH5sqHnNUqgV
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 21-11-2026 17:25, Raag Jadav wrote:
> On Sat, Nov 21, 2026 at 12:15:48PM +0530, Badal Nilawar wrote:
>> Retrieve the RAS info queue data, in multiple chunks, and assemble it into
>> a flat buffer.
>>
>> Signed-off-by: Badal Nilawar<badal.nilawar@intel.com>
>> ---
>> v6:
>>    - Replace destination buffer checks with xe_assert() (Raag)
>>    - Extract get_first_chunk() and get_remaining_chunks() helpers (Raag)
>> v7:
>>    - Move RAS has_info_queue check from CPER to RAS (Raag)
>>    - Also check that the reported total size is consistent across all chunks
>>    - Limit info queue fetches to 2x XE_SYSCTRL_FLOOD_LIMIT (Raag)
>> v8:
>>    - Align info queue logs with existing messages (Raag)
>>    - Assert buffer bounds on each iteration and simplify the loop (Raag)
>>    - Use min_t() for chunk-size and returned-size calculations (Raag)
>>    - Assert has_info_queue and return early when the first chunk fills
>>      the buffer (Raag)
>>    - Check for an incomplete drain on loop exit (Raag)
>> v9:
>>    - Stop draining when the destination buffer is full (Sashiko)
>>    - Validate and reuse the first chunk's total size for subsequent chunks (Raag)
>> ---
>>   drivers/gpu/drm/xe/xe_ras.c                   | 185 ++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h                   |   6 +-
>>   drivers/gpu/drm/xe/xe_ras_types.h             |  91 ++++++++-
>>   drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
>>   4 files changed, 281 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> index e8984c966876..953d40c1c393 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.c
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -1123,6 +1123,191 @@ int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 th
>>   	return 0;
>>   }
>>   
>> +static int get_info_queue(struct xe_device *xe,
>> +			  struct xe_ras_get_info_queue_request *request,
>> +			  struct xe_ras_get_info_queue_response *response)
>> +{
>> +	struct xe_sysctrl_mailbox_command command = {0};
>> +	const struct xe_ras_info_queue_header *hdr;
>> +	size_t rlen;
>> +	int ret;
>> +
>> +	xe_sysctrl_create_command(&command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_INFO_QUEUE,
>> +				  request, sizeof(*request), response, sizeof(*response));
>> +
>> +	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>> +	if (ret) {
>> +		xe_err(xe, "sysctrl: failed to get info queue %d\n", ret);
>> +		return ret;
>> +	}
>> +
>> +	if (rlen != sizeof(*response)) {
>> +		xe_err(xe, "sysctrl: unexpected get info queue response length %zu (expected %zu)\n",
>> +		       rlen, sizeof(*response));
>> +		return -EIO;
>> +	}
>> +
>> +	ret = ras_status_to_errno(response->status);
>> +	if (ret) {
>> +		xe_err(xe, "sysctrl: get info queue command failed with status %#x\n",
>> +		       response->status);
>> +		return ret;
>> +	}
>> +
>> +	hdr = &response->qdata_resp.header;
>> +	xe_dbg(xe, "[RAS]: get info queue: total=%u offset=%u size=%u flags=%#x num_headers=%u\n",
>> +	       hdr->total_size, hdr->chunk_offset, hdr->chunk_size, hdr->flags, hdr->num_headers);
>> +
>> +	return 0;
>> +}
>> +
>> +static bool chunk_is_valid(const struct xe_ras_info_queue_header *hdr,
>> +			   u32 expected_offset, u32 total_size, u32 dest_size)
>> +{
>> +	u32 end;
>> +
>> +	return hdr->total_size && hdr->total_size == total_size &&
>> +	       hdr->chunk_offset == expected_offset &&
>> +	       hdr->chunk_size && hdr->chunk_size <= XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE &&
>> +	       !check_add_overflow(hdr->chunk_offset, hdr->chunk_size, &end) &&
>> +	       end <= min_t(u32, total_size, XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE) &&
>> +	       end <= dest_size;
>> +}
>> +
>> +static u32 get_first_chunk(struct xe_device *xe,
>> +			   const struct xe_ras_get_counter_response *counter_resp,
>> +			   u8 *dest_buf, u32 dest_size, u32 *flags)
>> +{
>> +	const struct xe_ras_info_queue_header *hdr = &counter_resp->first.header;
>> +
>> +	if (!chunk_is_valid(hdr, 0, hdr->total_size, dest_size)) {
>> +		xe_warn(xe, "[RAS]: invalid first info queue chunk (total=%u offset=%u size=%u, expected offset=0)\n",
>> +			hdr->total_size, hdr->chunk_offset, hdr->chunk_size);
>> +		return 0;
>> +	}
>> +
>> +	memcpy(dest_buf, counter_resp->first.data, hdr->chunk_size);
>> +	*flags = hdr->flags;
>> +
>> +	return hdr->chunk_size;
>> +}
>> +
>> +static u32 get_remaining_chunks(struct xe_device *xe,
>> +				const struct xe_ras_get_counter_response *counter_resp,
>> +				u8 *dest_buf, u32 dest_size, u32 offset, u32 flags)
>> +{
>> +	u32 total_size = counter_resp->first.header.total_size;
>> +	u32 requests_left = XE_SYSCTRL_FLOOD_LIMIT * 2;
>> +	int ret;
>> +
>> +	while ((flags & XE_RAS_INFO_QUEUE_FLAG_MORE_DATA) && offset < dest_size) {
> As I already mentioned[1], if MORE_DATA is set with out of bounds offset
> it's more likely a firmware bug which you're now hiding here. Just go
> ahead with get_info_queue() and let it fail.

Agreed. We discussed this earlier, but I missed this change. I’ll fix it 
and send new rev.

Thanks,
Badal

>
> Raag
>
> [1]https://lore.kernel.org/intel-xe/avL3svpNuYn6l9C4@black.igk.intel.com/
>
>> +		struct xe_ras_info_queue_data_request *qdata_req;
>> +		struct xe_ras_get_info_queue_response response = {};
>> +		struct xe_ras_get_info_queue_request request = {};
>> +		struct xe_ras_info_queue_header *hdr;
>> +
>> +		xe_assert(xe, offset <= dest_size);
>> +
>> +		qdata_req = &request.qdata_req;
>> +		qdata_req->offset = offset;
>> +		qdata_req->size = min_t(u32, XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE, dest_size - offset);
>> +		qdata_req->session_id = counter_resp->counter;
>> +
>> +		ret = get_info_queue(xe, &request, &response);
>> +		if (ret) {
>> +			xe_err(xe, "[RAS]: info queue drain aborted: fetch at offset=%u, ret = %d\n",
>> +			       offset, ret);
>> +			return offset;
>> +		}
>> +
>> +		hdr = &response.qdata_resp.header;
>> +
>> +		if (!chunk_is_valid(hdr, offset, total_size, dest_size)) {
>> +			xe_warn(xe, "[RAS]: invalid info queue chunk (total=%u offset=%u size=%u, expected offset=%u)\n",
>> +				hdr->total_size, hdr->chunk_offset, hdr->chunk_size, offset);
>> +			return offset;
>> +		}
>> +
>> +		memcpy(dest_buf + offset, response.qdata_resp.data, hdr->chunk_size);
>> +		offset += hdr->chunk_size;
>> +		flags = hdr->flags;
>> +
>> +		if (!--requests_left) {
>> +			xe_warn(xe, "[RAS]: info queue flooding, aborted at offset=%u\n", offset);
>> +			break;
>> +		}
>> +	}
>> +
>> +	if (offset != dest_size) {
>> +		xe_warn(xe, "[RAS]: info queue drain incomplete, missed %u size\n",
>> +			dest_size - offset);
>> +	}
>> +
>> +	return min_t(u32, offset, total_size);
>> +}
>> +
>> +/**
>> + * xe_ras_get_info_queue_size() - Get the total size of the RAS info queue
>> + * @xe: xe device
>> + * @response: Counter response carrying the first info queue chunk
>> + *
>> + * Return: Info queue size in bytes, capped at the supported maximum, or zero
>> + * if no usable info queue is present.
>> + */
>> +u32 xe_ras_get_info_queue_size(struct xe_device *xe,
>> +			       const struct xe_ras_get_counter_response *response)
>> +{
>> +	u32 total_size;
>> +
>> +	if (!response->has_info_queue)
>> +		return 0;
>> +
>> +	total_size = response->first.header.total_size;
>> +	if (!total_size) {
>> +		xe_warn(xe, "[RAS]: info queue reports zero size\n");
>> +		return 0;
>> +	}
>> +
>> +	if (total_size > XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE) {
>> +		xe_warn(xe, "[RAS]: info queue size %u exceeds max size %u, truncating\n",
>> +			total_size, XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE);
>> +		total_size = XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE;
>> +	}
>> +	return total_size;
>> +}
>> +
>> +/**
>> + * xe_ras_drain_info_queue() - Drain the full RAS info queue into a flat buffer
>> + * @xe: xe device
>> + * @response: counter response carrying the first embedded chunk
>> + * @dest_buf: destination buffer supplied by the caller
>> + * @dest_size: size of @dest_buf in bytes
>> + *
>> + * Copies the first chunk already embedded in @response, then loops
>> + * issuing GET_INFO_QUEUE to fetch any remaining chunks until the queue
>> + * signals no more data or a transport/bounds error is encountered.  On
>> + * transport or bounds errors the function stops and returns whatever has
>> + * been assembled so far.
>> + *
>> + * Returns: Number of valid bytes written into @dest_buf.
>> + */
>> +u32 xe_ras_drain_info_queue(struct xe_device *xe,
>> +			    const struct xe_ras_get_counter_response *response,
>> +			    u8 *dest_buf, u32 dest_size)
>> +{
>> +	u32 flags, offset;
>> +
>> +	xe_assert(xe, response->has_info_queue);
>> +	xe_assert(xe, dest_buf);
>> +	xe_assert(xe, dest_size);
>> +
>> +	offset = get_first_chunk(xe, response, dest_buf, dest_size, &flags);
>> +	if (!offset || offset == dest_size)
>> +		return offset;
>> +
>> +	return get_remaining_chunks(xe, response, dest_buf, dest_size, offset, flags);
>> +}
>> +
>>   static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
>>   {
>>   	struct xe_ras_get_health_response response = {0};
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> index f7b587ac84e3..5d41c4543c55 100644
>> --- a/drivers/gpu/drm/xe/xe_ras.h
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -25,7 +25,11 @@ bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
>>   u32 xe_ras_get_max_pages(struct xe_device *xe);
>>   int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
>>   				struct xe_ras_get_counter_response *response);
>> +u32 xe_ras_get_info_queue_size(struct xe_device *xe,
>> +			       const struct xe_ras_get_counter_response *response);
>> +u32 xe_ras_drain_info_queue(struct xe_device *xe,
>> +			    const struct xe_ras_get_counter_response *response,
>> +			    u8 *dest_buf, u32 dest_size);
>>   bool xe_ras_is_aer_internal_error(struct xe_device *xe);
>>   void xe_ras_set_aer_internal_error(struct xe_device *xe);
>> -
>>   #endif
>> diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
>> index 0ff5803d495b..1a03de84074c 100644
>> --- a/drivers/gpu/drm/xe/xe_ras_types.h
>> +++ b/drivers/gpu/drm/xe/xe_ras_types.h
>> @@ -19,6 +19,10 @@
>>   #define XE_RAS_MEMORY_POISON			BIT(2)
>>   #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
>>   
>> +#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE	200
>> +#define XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE	5120
>> +#define XE_RAS_INFO_QUEUE_FLAG_MORE_DATA	0x02
>> +
>>   /**
>>    * enum xe_ras_page_action - Page offline actions for page offline request
>>    *
>> @@ -110,6 +114,83 @@ struct xe_ras_threshold_crossed {
>>   	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
>>   } __packed;
>>   
>> +/**
>> + * struct xe_ras_info_queue_header - Metadata for large info queue data transfers
>> + *
>> + * Provides chunk metadata for commands that support extended info queue
>> + * functionality. Used when the total data exceeds a single mailbox response.
>> + */
>> +struct xe_ras_info_queue_header {
>> +	/** @total_size: Total size of the complete info queue data in bytes */
>> +	u32 total_size;
>> +	/** @chunk_offset: Offset of this chunk within the total data in bytes */
>> +	u32 chunk_offset;
>> +	/** @chunk_size: Size of the data in this chunk in bytes */
>> +	u32 chunk_size;
>> +	/** @reserved0: Reserved for future use */
>> +	u32 reserved0;
>> +	/** @flags: Info queue control flags (XE_RAS_INFO_QUEUE_FLAG_*) */
>> +	u32 flags:8;
>> +	/** @reserved1: Reserved for future use */
>> +	u32 reserved1:4;
>> +	/** @num_headers: Number of detailed counter headers at start of the data */
>> +	u32 num_headers:5;
>> +	/** @reserved2: Reserved for future use */
>> +	u32 reserved2:15;
>> +	/** @reserved3: Reserved for future use */
>> +	u32 reserved3;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_info_queue_data_request - Request for a specific chunk of info queue data
>> + *
>> + * Allows the driver to request continuation of large info queue transfers
>> + * by specifying an offset and size within the full data set.
>> + */
>> +struct xe_ras_info_queue_data_request {
>> +	/** @offset: Byte offset of the requested data chunk */
>> +	u32 offset;
>> +	/** @size: Maximum size of the requested chunk in bytes */
>> +	u32 size;
>> +	/** @session_id: Session ID to correlate multi-chunk transfers */
>> +	struct xe_ras_error_class session_id;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved;
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_info_queue_data_response - Generic response for commands with info queues
>> + *
>> + * Standard response format for any command that returns an info queue
>> + * payload. May be embedded in a command-specific response structure.
>> + */
>> +struct xe_ras_info_queue_data_response {
>> +	/** @header: Info queue metadata for this chunk */
>> +	struct xe_ras_info_queue_header header;
>> +	/** @data: Info queue data for this chunk */
>> +	u8 data[XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_get_info_queue_request - Request for XE_SYSCTRL_CMD_GET_INFO_QUEUE
>> + */
>> +struct xe_ras_get_info_queue_request {
>> +	/** @qdata_req: Info queue request parameters */
>> +	struct xe_ras_info_queue_data_request qdata_req;
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved[16];
>> +} __packed;
>> +
>> +/**
>> + * struct xe_ras_get_info_queue_response - Response for XE_SYSCTRL_CMD_GET_INFO_QUEUE
>> + */
>> +struct xe_ras_get_info_queue_response {
>> +	/** @status: Status of the retrieval operation */
>> +	u32 status;
>> +	/** @qdata_resp: Info queue data chunk */
>> +	struct xe_ras_info_queue_data_response qdata_resp;
>> +} __packed;
>> +
>>   /**
>>    * struct xe_ras_get_counter_request - Request structure for get counter
>>    */
>> @@ -132,8 +213,14 @@ struct xe_ras_get_counter_response {
>>   	u64 timestamp;
>>   	/** @threshold: Threshold value for the counter */
>>   	u32 threshold;
>> -	/** @reserved: Reserved  */
>> -	u32 reserved[57];
>> +	/** @reserved: Reserved for future use */
>> +	u32 reserved:9;
>> +	/** @has_info_queue: Set if info queue is available */
>> +	u32 has_info_queue:1;
>> +	/** @reserved1: Reserved for future use */
>> +	u32 reserved1:22;
>> +	/** @first: First info queue chunk, if @has_info_queue is set */
>> +	struct xe_ras_info_queue_data_response first;
>>   } __packed;
>>   
>>   /**
>> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> index cdacceebca06..50b1d9abaf1f 100644
>> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
>> @@ -37,6 +37,7 @@ enum xe_sysctrl_group {
>>    * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined queued pages from firmware
>>    * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
>>    * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
>> + * @XE_SYSCTRL_CMD_GET_INFO_QUEUE: Retrieve a chunk of info queue data
>>    */
>>   enum xe_sysctrl_gfsp_cmd {
>>   	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
>> @@ -50,6 +51,7 @@ enum xe_sysctrl_gfsp_cmd {
>>   	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
>>   	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
>>   	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
>> +	XE_SYSCTRL_CMD_GET_INFO_QUEUE		= 0x0D,
>>   };
>>   
>>   /**
>> -- 
>> 2.56.0
>>
--------------st68XdObGZHKyH5sqHnNUqgV
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 21-11-2026 17:25, Raag Jadav wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:awGGnkZvDvpAwAEu@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">On Sat, Nov 21, 2026 at 12:15:48PM +0530, Badal Nilawar wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">Retrieve the RAS info queue data, in multiple chunks, and assemble it into
a flat buffer.

Signed-off-by: Badal Nilawar <a class="moz-txt-link-rfc2396E" href="mailto:badal.nilawar@intel.com">&lt;badal.nilawar@intel.com&gt;</a>
---
v6:
  - Replace destination buffer checks with xe_assert() (Raag)
  - Extract get_first_chunk() and get_remaining_chunks() helpers (Raag)
v7:
  - Move RAS has_info_queue check from CPER to RAS (Raag)
  - Also check that the reported total size is consistent across all chunks
  - Limit info queue fetches to 2x XE_SYSCTRL_FLOOD_LIMIT (Raag)
v8:
  - Align info queue logs with existing messages (Raag)
  - Assert buffer bounds on each iteration and simplify the loop (Raag)
  - Use min_t() for chunk-size and returned-size calculations (Raag)
  - Assert has_info_queue and return early when the first chunk fills
    the buffer (Raag)
  - Check for an incomplete drain on loop exit (Raag)
v9:
  - Stop draining when the destination buffer is full (Sashiko)
  - Validate and reuse the first chunk's total size for subsequent chunks (Raag)
---
 drivers/gpu/drm/xe/xe_ras.c                   | 185 ++++++++++++++++++
 drivers/gpu/drm/xe/xe_ras.h                   |   6 +-
 drivers/gpu/drm/xe/xe_ras_types.h             |  91 ++++++++-
 drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h |   2 +
 4 files changed, 281 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
index e8984c966876..953d40c1c393 100644
--- a/drivers/gpu/drm/xe/xe_ras.c
+++ b/drivers/gpu/drm/xe/xe_ras.c
@@ -1123,6 +1123,191 @@ int xe_ras_set_threshold(struct xe_device *xe, u8 severity, u8 component, u32 th
 	return 0;
 }
 
+static int get_info_queue(struct xe_device *xe,
+			  struct xe_ras_get_info_queue_request *request,
+			  struct xe_ras_get_info_queue_response *response)
+{
+	struct xe_sysctrl_mailbox_command command = {0};
+	const struct xe_ras_info_queue_header *hdr;
+	size_t rlen;
+	int ret;
+
+	xe_sysctrl_create_command(&amp;command, XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_GET_INFO_QUEUE,
+				  request, sizeof(*request), response, sizeof(*response));
+
+	ret = xe_sysctrl_send_command(&amp;xe-&gt;sc, &amp;command, &amp;rlen);
+	if (ret) {
+		xe_err(xe, &quot;sysctrl: failed to get info queue %d\n&quot;, ret);
+		return ret;
+	}
+
+	if (rlen != sizeof(*response)) {
+		xe_err(xe, &quot;sysctrl: unexpected get info queue response length %zu (expected %zu)\n&quot;,
+		       rlen, sizeof(*response));
+		return -EIO;
+	}
+
+	ret = ras_status_to_errno(response-&gt;status);
+	if (ret) {
+		xe_err(xe, &quot;sysctrl: get info queue command failed with status %#x\n&quot;,
+		       response-&gt;status);
+		return ret;
+	}
+
+	hdr = &amp;response-&gt;qdata_resp.header;
+	xe_dbg(xe, &quot;[RAS]: get info queue: total=%u offset=%u size=%u flags=%#x num_headers=%u\n&quot;,
+	       hdr-&gt;total_size, hdr-&gt;chunk_offset, hdr-&gt;chunk_size, hdr-&gt;flags, hdr-&gt;num_headers);
+
+	return 0;
+}
+
+static bool chunk_is_valid(const struct xe_ras_info_queue_header *hdr,
+			   u32 expected_offset, u32 total_size, u32 dest_size)
+{
+	u32 end;
+
+	return hdr-&gt;total_size &amp;&amp; hdr-&gt;total_size == total_size &amp;&amp;
+	       hdr-&gt;chunk_offset == expected_offset &amp;&amp;
+	       hdr-&gt;chunk_size &amp;&amp; hdr-&gt;chunk_size &lt;= XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE &amp;&amp;
+	       !check_add_overflow(hdr-&gt;chunk_offset, hdr-&gt;chunk_size, &amp;end) &amp;&amp;
+	       end &lt;= min_t(u32, total_size, XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE) &amp;&amp;
+	       end &lt;= dest_size;
+}
+
+static u32 get_first_chunk(struct xe_device *xe,
+			   const struct xe_ras_get_counter_response *counter_resp,
+			   u8 *dest_buf, u32 dest_size, u32 *flags)
+{
+	const struct xe_ras_info_queue_header *hdr = &amp;counter_resp-&gt;first.header;
+
+	if (!chunk_is_valid(hdr, 0, hdr-&gt;total_size, dest_size)) {
+		xe_warn(xe, &quot;[RAS]: invalid first info queue chunk (total=%u offset=%u size=%u, expected offset=0)\n&quot;,
+			hdr-&gt;total_size, hdr-&gt;chunk_offset, hdr-&gt;chunk_size);
+		return 0;
+	}
+
+	memcpy(dest_buf, counter_resp-&gt;first.data, hdr-&gt;chunk_size);
+	*flags = hdr-&gt;flags;
+
+	return hdr-&gt;chunk_size;
+}
+
+static u32 get_remaining_chunks(struct xe_device *xe,
+				const struct xe_ras_get_counter_response *counter_resp,
+				u8 *dest_buf, u32 dest_size, u32 offset, u32 flags)
+{
+	u32 total_size = counter_resp-&gt;first.header.total_size;
+	u32 requests_left = XE_SYSCTRL_FLOOD_LIMIT * 2;
+	int ret;
+
+	while ((flags &amp; XE_RAS_INFO_QUEUE_FLAG_MORE_DATA) &amp;&amp; offset &lt; dest_size) {
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
As I already mentioned[1], if MORE_DATA is set with out of bounds offset
it's more likely a firmware bug which you're now hiding here. Just go
ahead with get_info_queue() and let it fail.</pre>
    </blockquote>
    <p>
      <style>a {
    text-decoration: none;
    color: #464feb;
}tr th, tr td {
    border: 1px solid #e6e6e6;
}tr th {
    background-color: #f5f5f5;
}</style></p>
    <p>Agreed. We discussed this earlier, but I missed this change. I’ll
      fix it and send new rev.</p>
    <p>Thanks,<br>
      Badal</p>
    <blockquote type="cite" cite="mid:awGGnkZvDvpAwAEu@black.igk.intel.com">
      <pre wrap="" class="moz-quote-pre">

Raag

[1] <a class="moz-txt-link-freetext" href="https://lore.kernel.org/intel-xe/avL3svpNuYn6l9C4@black.igk.intel.com/">https://lore.kernel.org/intel-xe/avL3svpNuYn6l9C4@black.igk.intel.com/</a>

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">+		struct xe_ras_info_queue_data_request *qdata_req;
+		struct xe_ras_get_info_queue_response response = {};
+		struct xe_ras_get_info_queue_request request = {};
+		struct xe_ras_info_queue_header *hdr;
+
+		xe_assert(xe, offset &lt;= dest_size);
+
+		qdata_req = &amp;request.qdata_req;
+		qdata_req-&gt;offset = offset;
+		qdata_req-&gt;size = min_t(u32, XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE, dest_size - offset);
+		qdata_req-&gt;session_id = counter_resp-&gt;counter;
+
+		ret = get_info_queue(xe, &amp;request, &amp;response);
+		if (ret) {
+			xe_err(xe, &quot;[RAS]: info queue drain aborted: fetch at offset=%u, ret = %d\n&quot;,
+			       offset, ret);
+			return offset;
+		}
+
+		hdr = &amp;response.qdata_resp.header;
+
+		if (!chunk_is_valid(hdr, offset, total_size, dest_size)) {
+			xe_warn(xe, &quot;[RAS]: invalid info queue chunk (total=%u offset=%u size=%u, expected offset=%u)\n&quot;,
+				hdr-&gt;total_size, hdr-&gt;chunk_offset, hdr-&gt;chunk_size, offset);
+			return offset;
+		}
+
+		memcpy(dest_buf + offset, response.qdata_resp.data, hdr-&gt;chunk_size);
+		offset += hdr-&gt;chunk_size;
+		flags = hdr-&gt;flags;
+
+		if (!--requests_left) {
+			xe_warn(xe, &quot;[RAS]: info queue flooding, aborted at offset=%u\n&quot;, offset);
+			break;
+		}
+	}
+
+	if (offset != dest_size) {
+		xe_warn(xe, &quot;[RAS]: info queue drain incomplete, missed %u size\n&quot;,
+			dest_size - offset);
+	}
+
+	return min_t(u32, offset, total_size);
+}
+
+/**
+ * xe_ras_get_info_queue_size() - Get the total size of the RAS info queue
+ * @xe: xe device
+ * @response: Counter response carrying the first info queue chunk
+ *
+ * Return: Info queue size in bytes, capped at the supported maximum, or zero
+ * if no usable info queue is present.
+ */
+u32 xe_ras_get_info_queue_size(struct xe_device *xe,
+			       const struct xe_ras_get_counter_response *response)
+{
+	u32 total_size;
+
+	if (!response-&gt;has_info_queue)
+		return 0;
+
+	total_size = response-&gt;first.header.total_size;
+	if (!total_size) {
+		xe_warn(xe, &quot;[RAS]: info queue reports zero size\n&quot;);
+		return 0;
+	}
+
+	if (total_size &gt; XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE) {
+		xe_warn(xe, &quot;[RAS]: info queue size %u exceeds max size %u, truncating\n&quot;,
+			total_size, XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE);
+		total_size = XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE;
+	}
+	return total_size;
+}
+
+/**
+ * xe_ras_drain_info_queue() - Drain the full RAS info queue into a flat buffer
+ * @xe: xe device
+ * @response: counter response carrying the first embedded chunk
+ * @dest_buf: destination buffer supplied by the caller
+ * @dest_size: size of @dest_buf in bytes
+ *
+ * Copies the first chunk already embedded in @response, then loops
+ * issuing GET_INFO_QUEUE to fetch any remaining chunks until the queue
+ * signals no more data or a transport/bounds error is encountered.  On
+ * transport or bounds errors the function stops and returns whatever has
+ * been assembled so far.
+ *
+ * Returns: Number of valid bytes written into @dest_buf.
+ */
+u32 xe_ras_drain_info_queue(struct xe_device *xe,
+			    const struct xe_ras_get_counter_response *response,
+			    u8 *dest_buf, u32 dest_size)
+{
+	u32 flags, offset;
+
+	xe_assert(xe, response-&gt;has_info_queue);
+	xe_assert(xe, dest_buf);
+	xe_assert(xe, dest_size);
+
+	offset = get_first_chunk(xe, response, dest_buf, dest_size, &amp;flags);
+	if (!offset || offset == dest_size)
+		return offset;
+
+	return get_remaining_chunks(xe, response, dest_buf, dest_size, offset, flags);
+}
+
 static ssize_t gpu_health_show(struct device *dev, struct device_attribute *attr, char *buf)
 {
 	struct xe_ras_get_health_response response = {0};
diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
index f7b587ac84e3..5d41c4543c55 100644
--- a/drivers/gpu/drm/xe/xe_ras.h
+++ b/drivers/gpu/drm/xe/xe_ras.h
@@ -25,7 +25,11 @@ bool xe_ras_get_disable_vram_page_offline(struct xe_device *xe);
 u32 xe_ras_get_max_pages(struct xe_device *xe);
 int xe_ras_get_counter_response(struct xe_device *xe, const struct xe_ras_error_class *counter,
 				struct xe_ras_get_counter_response *response);
+u32 xe_ras_get_info_queue_size(struct xe_device *xe,
+			       const struct xe_ras_get_counter_response *response);
+u32 xe_ras_drain_info_queue(struct xe_device *xe,
+			    const struct xe_ras_get_counter_response *response,
+			    u8 *dest_buf, u32 dest_size);
 bool xe_ras_is_aer_internal_error(struct xe_device *xe);
 void xe_ras_set_aer_internal_error(struct xe_device *xe);
-
 #endif
diff --git a/drivers/gpu/drm/xe/xe_ras_types.h b/drivers/gpu/drm/xe/xe_ras_types.h
index 0ff5803d495b..1a03de84074c 100644
--- a/drivers/gpu/drm/xe/xe_ras_types.h
+++ b/drivers/gpu/drm/xe/xe_ras_types.h
@@ -19,6 +19,10 @@
 #define XE_RAS_MEMORY_POISON			BIT(2)
 #define XE_RAS_MEMORY_DATA_PARITY		BIT(5)
 
+#define XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE	200
+#define XE_RAS_INFO_QUEUE_MAX_TOTAL_SIZE	5120
+#define XE_RAS_INFO_QUEUE_FLAG_MORE_DATA	0x02
+
 /**
  * enum xe_ras_page_action - Page offline actions for page offline request
  *
@@ -110,6 +114,83 @@ struct xe_ras_threshold_crossed {
 	struct xe_ras_error_class counters[XE_RAS_NUM_COUNTERS];
 } __packed;
 
+/**
+ * struct xe_ras_info_queue_header - Metadata for large info queue data transfers
+ *
+ * Provides chunk metadata for commands that support extended info queue
+ * functionality. Used when the total data exceeds a single mailbox response.
+ */
+struct xe_ras_info_queue_header {
+	/** @total_size: Total size of the complete info queue data in bytes */
+	u32 total_size;
+	/** @chunk_offset: Offset of this chunk within the total data in bytes */
+	u32 chunk_offset;
+	/** @chunk_size: Size of the data in this chunk in bytes */
+	u32 chunk_size;
+	/** @reserved0: Reserved for future use */
+	u32 reserved0;
+	/** @flags: Info queue control flags (XE_RAS_INFO_QUEUE_FLAG_*) */
+	u32 flags:8;
+	/** @reserved1: Reserved for future use */
+	u32 reserved1:4;
+	/** @num_headers: Number of detailed counter headers at start of the data */
+	u32 num_headers:5;
+	/** @reserved2: Reserved for future use */
+	u32 reserved2:15;
+	/** @reserved3: Reserved for future use */
+	u32 reserved3;
+} __packed;
+
+/**
+ * struct xe_ras_info_queue_data_request - Request for a specific chunk of info queue data
+ *
+ * Allows the driver to request continuation of large info queue transfers
+ * by specifying an offset and size within the full data set.
+ */
+struct xe_ras_info_queue_data_request {
+	/** @offset: Byte offset of the requested data chunk */
+	u32 offset;
+	/** @size: Maximum size of the requested chunk in bytes */
+	u32 size;
+	/** @session_id: Session ID to correlate multi-chunk transfers */
+	struct xe_ras_error_class session_id;
+	/** @reserved: Reserved for future use */
+	u32 reserved;
+} __packed;
+
+/**
+ * struct xe_ras_info_queue_data_response - Generic response for commands with info queues
+ *
+ * Standard response format for any command that returns an info queue
+ * payload. May be embedded in a command-specific response structure.
+ */
+struct xe_ras_info_queue_data_response {
+	/** @header: Info queue metadata for this chunk */
+	struct xe_ras_info_queue_header header;
+	/** @data: Info queue data for this chunk */
+	u8 data[XE_RAS_INFO_QUEUE_MAX_CHUNK_SIZE];
+} __packed;
+
+/**
+ * struct xe_ras_get_info_queue_request - Request for XE_SYSCTRL_CMD_GET_INFO_QUEUE
+ */
+struct xe_ras_get_info_queue_request {
+	/** @qdata_req: Info queue request parameters */
+	struct xe_ras_info_queue_data_request qdata_req;
+	/** @reserved: Reserved for future use */
+	u32 reserved[16];
+} __packed;
+
+/**
+ * struct xe_ras_get_info_queue_response - Response for XE_SYSCTRL_CMD_GET_INFO_QUEUE
+ */
+struct xe_ras_get_info_queue_response {
+	/** @status: Status of the retrieval operation */
+	u32 status;
+	/** @qdata_resp: Info queue data chunk */
+	struct xe_ras_info_queue_data_response qdata_resp;
+} __packed;
+
 /**
  * struct xe_ras_get_counter_request - Request structure for get counter
  */
@@ -132,8 +213,14 @@ struct xe_ras_get_counter_response {
 	u64 timestamp;
 	/** @threshold: Threshold value for the counter */
 	u32 threshold;
-	/** @reserved: Reserved  */
-	u32 reserved[57];
+	/** @reserved: Reserved for future use */
+	u32 reserved:9;
+	/** @has_info_queue: Set if info queue is available */
+	u32 has_info_queue:1;
+	/** @reserved1: Reserved for future use */
+	u32 reserved1:22;
+	/** @first: First info queue chunk, if @has_info_queue is set */
+	struct xe_ras_info_queue_data_response first;
 } __packed;
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
index cdacceebca06..50b1d9abaf1f 100644
--- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
+++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox_types.h
@@ -37,6 +37,7 @@ enum xe_sysctrl_group {
  * @XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE: Retrieve list of offlined queued pages from firmware
  * @XE_SYSCTRL_CMD_GET_HEALTH: Retrieve gpu health
  * @XE_SYSCTRL_CMD_SET_HEALTH: Set gpu health
+ * @XE_SYSCTRL_CMD_GET_INFO_QUEUE: Retrieve a chunk of info queue data
  */
 enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_SOC_ERROR		= 0x01,
@@ -50,6 +51,7 @@ enum xe_sysctrl_gfsp_cmd {
 	XE_SYSCTRL_CMD_GET_OFFLINE_QUEUE	= 0x0A,
 	XE_SYSCTRL_CMD_GET_HEALTH		= 0x0B,
 	XE_SYSCTRL_CMD_SET_HEALTH		= 0x0C,
+	XE_SYSCTRL_CMD_GET_INFO_QUEUE		= 0x0D,
 };
 
 /**
-- 
2.56.0

</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------st68XdObGZHKyH5sqHnNUqgV--
