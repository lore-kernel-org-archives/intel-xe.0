Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95808C83F17
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 07:14:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D9610E535;
	Tue, 15 Jul 2025 07:14:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RvHeK1dH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775CF10E1A5
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 07:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752563652; x=1784099652;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=A6nKwF4+DuYTzFEv1JcOK5AJ3KL5GvS2W0waBlh4Dtw=;
 b=RvHeK1dHYfk/gyaVUUA9MSep87aixlz+T4oe3dhmUyA97ljELJ/a04Xq
 5UD7R9sUtwbvLuxYkhiLBnPiBvYN5bHSKC708A7VBUduLAB5c9yBm9cn7
 2xp992oKKX6qvJPTfEeA2WcF7Bd/tF2zBjoWcmaKPhNViFju4J8i8y8lK
 HDveVkw2hvRZUC/TQMuuSOSOdEek7ml/kJcwDvhlPPmDybPMwRn/Rh3Y+
 aREFLhpRNbwdUe6N4V2rJM33Blh48RoOan4Jr/hi8a4FWzcXIH+sSvJVC
 BQrKzReBAvoH5+C/FDhp1EA6B/JoO3qbwXkJ3iyKzUouE5Am5NmHz48G3 w==;
X-CSE-ConnectionGUID: jfsgym3JScmyPU1O3eZMJQ==
X-CSE-MsgGUID: K6ZevcnrTlCTs/Uxt5AIzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11491"; a="53992731"
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="53992731"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 00:14:12 -0700
X-CSE-ConnectionGUID: diiwCmScSweZO9z2avj4og==
X-CSE-MsgGUID: 5ppq/MUER0Oy1ciRE3d0EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,313,1744095600"; d="scan'208";a="156959618"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 00:14:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 00:14:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 00:14:11 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.81)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 15 Jul 2025 00:14:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GXrG7Hed+45EWgHBP+RYPyxiWTKPjRecw6P+QBlEDUE/YjHDAx/DuWB+Pkiuv7j/w2JZd61JecXhkiI2hNUI+s8rusFmEpDSPXPBJv36yW8Z1uIWDkZayiH98qclScvWA6DkR7OcHccLQEiZRNSZtwG0YnIrJewJY0qbTeKhOt9EGzFw1nyldcm7qKPBG7DL8JAHsUShGfqs9SFKGywEkPJ43zZSIyZE4/I0rkA8OaqKFEmeiNZaZnw2vJICBpeecjeeTprhP5FflTFU+tOhx8aYWlMR1D9Q1ziV0Ku+hqxOGi9DpeIzLUR8nif/HnJS6TWWgbDL0BLcVMLbJv7iXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4u3rVRwXzgJXitgD+9Tvu8oeKKzC9br5iUtvcPbRkI=;
 b=GzzgHY8EqVLE9HkRakRpa1U+RMWcvnTN+LwxF1OmHmHypYI15lrpVzQx9Vx1WgHZeyyMsRvSi1OuMZt9mXykCd3WSuO6sUJJQS1mrulARWKLMab6pmXSUCyGhjlJkVhbxOzdwKTA91EgzUAeQniAmtgldbPlc5TxDxwa2+86ahNPptPrZTy3ayi6LMQD/TZ1PwVs1KyNDux1+FqCn4So/upssNeIHjnQnDW953jSn2OdcrVNsSFJVjnPkwJ6gXOh4NXtZ22s0sO9xeGd4aV1Of2IixHvLQIJlHv2VHTDXfYMjyjgIcYDeoAaHLdJl/Vg5Ka/8oSBHBSmJLTVuD1yeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6138.namprd11.prod.outlook.com (2603:10b6:930:2a::11)
 by BN9PR11MB5241.namprd11.prod.outlook.com (2603:10b6:408:132::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Tue, 15 Jul
 2025 07:13:50 +0000
Received: from CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74]) by CY5PR11MB6138.namprd11.prod.outlook.com
 ([fe80::f24e:b21e:c458:4e74%4]) with mapi id 15.20.8857.025; Tue, 15 Jul 2025
 07:13:50 +0000
Date: Tue, 15 Jul 2025 09:13:45 +0200
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v4 4/6] drm/xe/pf: Force GuC virtualization mode
Message-ID: <20250715071345.jzs7bqko6zfg5gfk@intel.com>
References: <20250711193316.1920-1-michal.wajdeczko@intel.com>
 <20250711193316.1920-5-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250711193316.1920-5-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU7P195CA0009.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:10:54d::10) To CY5PR11MB6138.namprd11.prod.outlook.com
 (2603:10b6:930:2a::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6138:EE_|BN9PR11MB5241:EE_
X-MS-Office365-Filtering-Correlation-Id: 29aef272-4a07-45c9-49db-08ddc36f2537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkk4cEVBRjNaY3JYTkpNTERHT2xZdGdNOGZGWUVFemZQZWRsYTMzYnZUbko3?=
 =?utf-8?B?MUJlVUU1Q3p4RXBRdHI3YnVLUFJXZWVNUEJDU3ZBUFl5QWovbzdMM0kydzdx?=
 =?utf-8?B?QkhRYjlINXZQOHlYMlc3dnB6ZHJ0WWVBREFzSTN6dHBhN081bUIyZVBQa2Yw?=
 =?utf-8?B?UFZVS3p2UkZ3SVJXMVRaNlBNVHdLaDBnR2VxOFk3Mzk3VkdDMm56SFlubTZW?=
 =?utf-8?B?WGlHZlJRSmo3cEVSS1dHenc2dFpSdVZyZTg5VmE5ZzJSUk9zblAwTGxCSG40?=
 =?utf-8?B?eDNXWnVmblFZNWVxKzhKTXZTQ0NoYTQ3U3g0NW94bmF4R3EzM0VoSlRkZ2k5?=
 =?utf-8?B?OG5aK1llNk1wZ3dBM1hSWmFPK2RzT0RMSXN3Q3djejJjSXNmSTdya1A2Z2FT?=
 =?utf-8?B?L0FsYk8xUUNXbEdUcG54emVYWXVKdmJUbzE5Mnl6WllYckJXOUJJaGhoTjZI?=
 =?utf-8?B?NytjTU9pWEt6ckVTVkFLR3dkSzBQUk9oRVlsZ3ZKcUlvWDR4QzlTVG15YUdU?=
 =?utf-8?B?cVlzYzh0eGxJSXRBMGc4RG1XYTQ2RHkxQllDUysxVXo2czhVcHAvU2ZyczJM?=
 =?utf-8?B?bnNaY1Y1YmVSNkdUbENBaHRncnYvYXRvT3B1SDF3TDgwNEU1UHNIMVNMVUR4?=
 =?utf-8?B?UVIwdzRONXdGYmNlTkcvWExyYi9sYzFxeFNaNC9aaDB6SjNtZ05yVC9aN2Vo?=
 =?utf-8?B?ZzhKZDMyWDZOU1RCMGx0OC8zVFZYRkI4SEhWa0szSDd5TGUzNFNpUUwyNWdU?=
 =?utf-8?B?dDJnWjQyaFlJNlZiazE0QVpvajlPbGVHNHNPcm1HQThSa0RFQVBLMmFrdElN?=
 =?utf-8?B?U2pQakh2WmRFZC9CRXBMbGZaRmxkbnZSWUNIOEtqTDE5Zlk3YXZ3aVphR2dz?=
 =?utf-8?B?ODdrcFBkdGxkdEsxTXYzaXpuVTdXamZyOW1ZQWVSRktDZ0dEclE3Rnp0Nkky?=
 =?utf-8?B?Ung4Y01GU3M1TjlmUUJpaytEL21ubklHM2hYV2xmd3M4M1AxZm1uK210eUdk?=
 =?utf-8?B?R0pHM2U5WW9vKzVIYm0vYWhJZ0R1MzVhNWFSMGxmRlFKY1VMRGlDYm42OE9m?=
 =?utf-8?B?ZmhweXJOdHZmcTBOOU1oaHNhWk9VNTM0ZHoxcDltNkI2MjA1SllmNVplMzlZ?=
 =?utf-8?B?bzhxeGl4cVFWeW5CekJKOG5WOHZCaHZlT3REQUMweTFLSitYRG9iTDh3SElu?=
 =?utf-8?B?bHRta3hzTWQ0UUNQVE5UMU11ZURTR1UwVCt4WXJ3REhXbWI1MytaTlRLckNI?=
 =?utf-8?B?ZlVZLzlHLzh4WjhwR3ZwOGVpMkY1WkZ0TkJudDRXb2IrMElUdjBmNDYxT1Jy?=
 =?utf-8?B?MVZycDRKTzJFT1l1Vk5qeXZNTlJwVmdhclEybGxSRHUyKzdCMmdVZGJnZzJ6?=
 =?utf-8?B?VHYyVmJSYy9RWGZuNFBZdy9WNDAwWmNkUVlybm9sM0t1YW9DK2ZXbkdBNXZy?=
 =?utf-8?B?RUxYMjBuUkdRYW9JOGFSQ2RzOXV4SFo5YjZ4Ry96MWlrQUhzWHpaRGhzV2hm?=
 =?utf-8?B?dHFwK0FVMkhlcjhvOUcwb3hXYmhjSlh6cU5GUGMrdlpFRkpRVEZUUHVDMTBy?=
 =?utf-8?B?ZDgyZHpFZ2tnRFcvckVpYitZZHVJcCtOL2RqaTdMZTRjZGNBa0NTRndWb0Y5?=
 =?utf-8?B?bmUvU0xEK21Qb2xRVGZ2RVFURUFqWUsyaG1lN3d6Vzc3ZmdFaVd6TGVSRTFJ?=
 =?utf-8?B?bW1KRkFpSmg2cDNUK1RmbzQzbzJFMDYrdGo4S2U2OXBPUWt4TGIyOVU1VGFD?=
 =?utf-8?B?dmhXMThNdjdaMEhXWnBiZzVxYTltZlpPNmwxUC94QzJYOVYvdlJmYVp3blVK?=
 =?utf-8?B?ZjVkOGJseVcxdi9WMmw4ZWk0NE1CMkxMOHdDYTk2eW95MVl1WVdVc1lJMTdH?=
 =?utf-8?B?Uzh6cjM5akVSMGFBK3BvNGE1dG9LckFhWmJjN1ZZRkJoZytkRTZQVElJWEV0?=
 =?utf-8?Q?bME2na1swkQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6138.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a1IweWtodjVaWk41MU5NOUk4a0pka0UvWDJudWxBNUFpOGRwVHFJc2FDRGxH?=
 =?utf-8?B?bDUwYWRGV1R4WVhkeUFZa0RNblZ0L2ZZakVXRk5rZUNVK1VweFN0aHFzWkYv?=
 =?utf-8?B?Y3gyUzlNVm1IKy84c0VEMmNNd1g5bEFEWXRiRWNsNHgvYzJYMVg5Zi9nanR2?=
 =?utf-8?B?eXBOaEdTV25WbTNtMkF4MWVMWDFOeFBwakFrbk8xSTN2NUNIRW1OMmQ3QTlH?=
 =?utf-8?B?Y2tIVmNhSE1vSVNHYTNrbGNqdEM0OVMrV083c3YzOS9ReWtRZGphekRKb3hR?=
 =?utf-8?B?RTY4N2RiZ2l6QUZtb3NER0FKUVFhdVFPRFd2T1ZpWEhpcU8zYlB4MUtCTmIv?=
 =?utf-8?B?Z1hTR2daZWp6MnZXa09aUCtGSkZsaXh6Tkl2WDVzL0pYWUErbXJDeEtKdkFt?=
 =?utf-8?B?bnV4NnhSWnJWUUNQSUFjcXVEYnNOa1BhaVhIVHBHV0Z6bDVSc1lOQjlaWmFw?=
 =?utf-8?B?dnNocjVoVlJmanNULzlwc3VXc2dXNXVTY2MvaTFRMk1HdGN4QTNqcHpJRGpn?=
 =?utf-8?B?c3hBUHJGNmF0dUg4aFhoTWxvbVFJMWNEYkcxUHh2a0E0Z29pUmpqQk0rbHFB?=
 =?utf-8?B?N25BckxKbTNlVkhwTzEyaGV6Q2JZSUV6RDJxbmE2YldxWDQzQVIwWnRjSHZp?=
 =?utf-8?B?NDNibXAzTEcvbDZnTFhmZ3hzVHJ0aXJxUHFubTArZkFYOHhrWHdUQWVJaVBQ?=
 =?utf-8?B?RDhmODJsNW0zK3c4YW13Ym5Pb2NFVUVtMHlmeXkwNHAxOWNYbmdxbUx6ZTBw?=
 =?utf-8?B?emg5cGZIdjZ2Vng3VHlBM3lhNzZ5Lzg1ZEVicjZOSjI0RDczUm13a0UvaU9Y?=
 =?utf-8?B?a0JFeWpsdHhxdS9VTTQrWDYyQ1J5UkhHek9WWm5IR21YWWtlVlhqeTdYdmFR?=
 =?utf-8?B?WG1RaFkvWHlRZkFJbWlFVHJ4blNDR2ZFb2dERWpHZ1FXdWVWMmU0Z1FhU3hh?=
 =?utf-8?B?UmVwUmdIcHJwTkI2S1NObGNJZm1GcXB2endNYTY4S05weWd4NXowdVBQbzN5?=
 =?utf-8?B?Ryt0Ry9HYVJJVE1nblM1VXh3Y043cDhrL3NwY0Jzdkg4YXdoZFc5b243T3lm?=
 =?utf-8?B?cDdvUWhIRVN3VWdic2dLREdaa0JWZUhSV2RQWWJVV3JKWER3Szg2QkxIS3A5?=
 =?utf-8?B?cDlpb2hTNWJzaDBWY0daYVArZkdRMVZzM09lc0VvT0U3bzhrMGhYUThDMkhw?=
 =?utf-8?B?N29TelVaQlp0ZUkya0xqTWdqMDRKNE1IYnJwbG1QU3ZUWlNUcUhvRVhlcG14?=
 =?utf-8?B?RFNDbzZNaXB0a0ZMTHMxYXMxeXdJejNqOVVlbXBNb2ZqRDMrZjZHVVJmTWVB?=
 =?utf-8?B?ZHJPY1ZJdis5WVJueEZGaWpDMnQ2VXg3dFM0RnVxY1FoMXBrZk9YTjZGUWhw?=
 =?utf-8?B?Q01nbllscXZXNFpQY1VkeVFOZmFxbFZoZDlDbC9KQllCd2xmQTdUbXFkMjRv?=
 =?utf-8?B?M1NHNXhscHVMQkorREpQRms4NzVNUHNuaU1QTjhOeFF5elZXZzRDcnNETkpt?=
 =?utf-8?B?WXYxSCtNQlkyVUxxRXZQRGN4VC9WT3YxWHNPVzBtUlQ1VlJpQng5elFIZ1Nw?=
 =?utf-8?B?MFFGaVZaVGsvUVZiMDZFQVVvckRFbXpYSTlUd2Nldmg5U3RXdlpQK2M0d1Jt?=
 =?utf-8?B?MjdkSTQvQ3c1U2dER0RZd3lVUkNwdUdwRFdMU25HVFhRYjFqU05KUnI1dnIx?=
 =?utf-8?B?VTUwSVlleEVwVWhBVXZNdUVUU3FMTGdRMW12WkREZDRCQXNNN0t4eSs0dTd3?=
 =?utf-8?B?cTdpY25McDA2SndxdXE0bnZqY1RXSVV3SVVicXp4L255N0RDNEtvOE9tcm5h?=
 =?utf-8?B?TjlUekpoTDV1VGYzNHZsU1o3dVE4OE1JcDdzeFBDNFFmWlJoeUNrWi9HNGQ0?=
 =?utf-8?B?cXEvK2xONTlxbzNQUENMMWhnUFdlN3krdHExVmpzUUdPRC9ZUnNibHVpWjUx?=
 =?utf-8?B?VUZicXp4a2dvOU16SjFuQW0zbzBRU3FyYnhnOHdiVEpMcU9OUzRvRmVjbkhT?=
 =?utf-8?B?TzJoSDdGNElUM1EwS25zaDZWTWk0d0JjOHQwWEU2bEc3Z201Ykh6eEJSd21N?=
 =?utf-8?B?QkEwQ3dEWkY3bGtKTzZBRHJNakt0dGJjUkNpSStMWUwrb0tZSzlLUWtPRERv?=
 =?utf-8?B?aVYraFVlcG1STnpvS25ZcTZvR01QeHFwRjFKR3Z2bzlqWHgzSG8rd0FENFE3?=
 =?utf-8?B?MFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 29aef272-4a07-45c9-49db-08ddc36f2537
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6138.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 07:13:50.0314 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ri+Kq2L93+CASkQOXzs2OfQu17HqPPYfOM4eqi2cvGfNWpv5nsRSTY+tAozGZYJD0lg4Ixh/5SFviFhx+GAhfcsglEWQK3Zqr5+ooK90jMw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5241
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on pią [2025-lip-11 21:33:14 +0200]:
> By default the GuC starts in the 'native' mode and enables the VGT
> mode (aka 'virtualization' mode) only after it receives at least one
> set of VF configuration data. While this happens naturally while PF
> begins VFs provisioning, we might need this sooner as some actions,
> like TLB_INVALIDATION_ALL(0x7002), is supported by the GuC only in
> the VGT mode.
> 
> And this becomes a real problem if we would want to use above action
> to invalidate the LMTT early during VFs auto-provisioning, before VFs
> are enabled, as such H2G would be rejected:
> 
>  [ ] xe 0000:4d:00.0: [drm] *ERROR* GT0: FAST_REQ H2G fence 0x804e failed! e=0x30, h=0
>  [ ] xe 0000:4d:00.0: [drm] *ERROR* GT0: Fence 0x804e was used by action 0x7002 sent at:
>       h2g_write+0x33e/0x870 [xe]
>       __guc_ct_send_locked+0x1e1/0x1110 [xe]
>       guc_ct_send_locked+0x9f/0x740 [xe]
>       xe_guc_ct_send_locked+0x19/0x60 [xe]
>       send_tlb_invalidation+0xc2/0x470 [xe]
>       xe_gt_tlb_invalidation_all_async+0x45/0xa0 [xe]
>       xe_gt_tlb_invalidation_all+0x4b/0xa0 [xe]
>       lmtt_invalidate_hw+0x64/0x1a0 [xe]
>       xe_lmtt_invalidate_hw+0x5c/0x340 [xe]
>       pf_update_vf_lmtt+0x398/0xae0 [xe]
>       pf_provision_vf_lmem+0x350/0xa60 [xe]
>       xe_gt_sriov_pf_config_bulk_set_lmem+0xe2/0x410 [xe]
>       xe_gt_sriov_pf_config_set_fair_lmem+0x1c6/0x620 [xe]
>       xe_gt_sriov_pf_config_set_fair+0xd5/0x3f0 [xe]
>       xe_pci_sriov_configure+0x360/0x1200 [xe]
>       sriov_numvfs_store+0xbc/0x1d0
>       dev_attr_store+0x17/0x40
>       sysfs_kf_write+0x4a/0x80
>       kernfs_fop_write_iter+0x166/0x220
>       vfs_write+0x2ba/0x580
>       ksys_write+0x77/0x100
>       __x64_sys_write+0x19/0x30
>       x64_sys_call+0x2bf/0x2660
>       do_syscall_64+0x93/0x7a0
>       entry_SYSCALL_64_after_hwframe+0x76/0x7e
>  [ ] xe 0000:4d:00.0: [drm] *ERROR* GT0: CT dequeue failed: -71
>  [ ] xe 0000:4d:00.0: [drm] GT0: trying reset from receive_g2h [xe]
> 
> This could be mitigated by pushing earlier a PF self-configuration
> with some hard-coded values that cover unlimited access to the GGTT,
> use of all GuC contexts and doorbells.  This step is sufficient for
> the GuC to switch into the VGT mode.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
> v2: rebase and push min config as part of the full PF config
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c | 26 ++++++++++++++++++++++
>  1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> index 55afc5b06371..86dade6f1083 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
> @@ -341,6 +341,17 @@ static int pf_push_full_vf_config(struct xe_gt *gt, unsigned int vfid)
>  	}
>  	xe_gt_assert(gt, num_dwords <= max_cfg_dwords);
>  
> +	if (vfid == PFID) {
> +		u64 ggtt_start = xe_wopcm_size(gt_to_xe(gt));
> +		u64 ggtt_size = gt_to_tile(gt)->mem.ggtt->size - ggtt_start;
> +
> +		/* plain PF config data will never include a real GGTT region */
> +		xe_gt_assert(gt, !encode_config_ggtt(cfg + num_dwords, config, true));
> +
> +		/* fake PF GGTT config covers full GGTT range except reserved WOPCM */
> +		num_dwords += encode_ggtt(cfg + num_dwords, ggtt_start, ggtt_size, true);
> +	}
> +
>  	num_klvs = xe_guc_klv_count(cfg, num_dwords);
>  	err = pf_push_vf_buf_klvs(gt, vfid, num_klvs, buf, num_dwords);
>  
> @@ -2375,6 +2386,20 @@ int xe_gt_sriov_pf_config_restore(struct xe_gt *gt, unsigned int vfid,
>  	return err;
>  }
>  
> +static void pf_prepare_self_config(struct xe_gt *gt)
> +{
> +	struct xe_gt_sriov_config *config = pf_pick_vf_config(gt, PFID);
> +
> +	/*
> +	 * We want PF to be allowed to use all of context ID, doorbells IDs
> +	 * and whole usable GGTT area. While we can store ctxs/dbs numbers
> +	 * directly in the config structure, can't do the same with the GGTT
> +	 * configuration, so let it be prepared on demand while pushing KLVs.
> +	 */
> +	config->num_ctxs = GUC_ID_MAX;
> +	config->num_dbs = GUC_NUM_DOORBELLS;
> +}
> +
>  static int pf_push_self_config(struct xe_gt *gt)
>  {
>  	int err;
> @@ -2418,6 +2443,7 @@ int xe_gt_sriov_pf_config_init(struct xe_gt *gt)
>  	xe_gt_assert(gt, IS_SRIOV_PF(xe));
>  
>  	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
> +	pf_prepare_self_config(gt);
>  	err = pf_push_self_config(gt);
>  	mutex_unlock(xe_gt_sriov_pf_master_mutex(gt));

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
>  
> -- 
> 2.47.1
> 

-- 
