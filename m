Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 874FFC83F27
	for <intel-xe@archiver.kernel.org>; Tue, 15 Jul 2025 22:48:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CBF10E08D;
	Tue, 15 Jul 2025 22:48:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IHBzGQKZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F5C10E08D
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Jul 2025 22:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752619684; x=1784155684;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=+1ydMcYq5+cQzBZVRPM7VuOBWp2hG6QJeiFYdM/z8UU=;
 b=IHBzGQKZuYL2ZS0ebmqf+t4bL/efdn17B1G0wsF5grWvGEhp/bovh0UZ
 VUuQKU0BoqIYBRsO0PWeRINptXY6lsWaSfSqNWP5TRrlk6iLlCqVevWO8
 TYcu6gGn17pncj3GZha7obcLNm/fP2cZWw4FP5/OXnmSR9hnrdENd/8oI
 8+DHQj0YWhOkkCb/nzSUT3APoJVHrslTnT0Ixsnp2DqaYAWVOUnedrxle
 D5cgvvCwbSPEHCPfJBXx50kADgY4Lj5XlPr5CgboKFiNvmTPR4OU+MTMa
 JDzLw85Fni48V3IqZnqF8qRb9uxvfbmIq881ISsZEaBNOSsDBLCfrfJ0u Q==;
X-CSE-ConnectionGUID: RiBnFXugTGSBKgZPVxnEDQ==
X-CSE-MsgGUID: dWBPDX/ESxaAwlpUSQNodA==
X-IronPort-AV: E=McAfee;i="6800,10657,11493"; a="58666619"
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="58666619"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 15:48:03 -0700
X-CSE-ConnectionGUID: OUTutnxzRt6LoXoZ9rcryA==
X-CSE-MsgGUID: xeBplE6YSQ+eiL4sr++N9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,314,1744095600"; d="scan'208";a="157009070"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jul 2025 15:48:03 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 15:48:02 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Tue, 15 Jul 2025 15:48:02 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.80) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Tue, 15 Jul 2025 15:48:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4k6v3EU0coPeHUcJKJg31x/BnzNF49exshjPVo7lux7bBi/GNt84iWkMVshw1sqtxb4XNLivWH1lpipYsEuuKChBjnlOVYf5SfQKSCD+YIAx8/KD5UOrdmhQAjPtrh6xBx3nNdXi6yW33Q9C0SmxLSaWTAqf3NAtSgzD4JLCsD5kqzpx7UovaQnWBWunVkvwlS7b2H3TsV3332mu/D859tgFYZxbvY2eydd5iCoEEvGAczuoU7r776AsfqVnW8s9mRMP7PdnFBHVbLMdsuBofbo/rJvFAPjSHBgi0+qowxnLMrGq/FAj74ofwLZH8wmC4uwS0oyjHkxHzfnACATLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+1ydMcYq5+cQzBZVRPM7VuOBWp2hG6QJeiFYdM/z8UU=;
 b=ObkL/W3vEX7F0QzmlX0DGxJSsY4uPN7yIR2ZoLMdgRV7MBvfMCW/ebADsKX8voOEE35rN/E+r4kZIuz32x+FoLf3VmArziEClKLtKCyCOcmAjNEbLD45p7do4Mi5/MbsQyLNYM1Ma6FPZU7WmScxIW9ij1zXvXRfBQ3/5AsqH3UwoJ34DtN5ukDUAcSIKdIFu5WxslTqrh1U3GAGeZfbz2/DlXHGZMGK1cXBR2p16q/ykuX9hrHudeO/tWoT3Ac77QA3hzQJJ/CcLb3HOoxGktxrUk2YhhHMzBevlRGyI3gK1vdZF0cIunI2GskrnUs+tMHRbMVNXiK7BThVLv8G9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 LV3PR11MB8601.namprd11.prod.outlook.com (2603:10b6:408:1b8::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.24; Tue, 15 Jul 2025 22:48:00 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8922.028; Tue, 15 Jul 2025
 22:48:00 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [PATCH v2 6/9] drm/xe: Add xe_migrate_job_lock/unlock helpers
Thread-Topic: [PATCH v2 6/9] drm/xe: Add xe_migrate_job_lock/unlock helpers
Thread-Index: AQHb66vXd72cffUb/U+9BxAaNAFj9rQz3a0A
Date: Tue, 15 Jul 2025 22:48:00 +0000
Message-ID: <f66c835a70e50969e9a4068cbd5c060839f340a1.camel@intel.com>
References: <20250702234222.3278264-1-matthew.brost@intel.com>
 <20250702234222.3278264-7-matthew.brost@intel.com>
In-Reply-To: <20250702234222.3278264-7-matthew.brost@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|LV3PR11MB8601:EE_
x-ms-office365-filtering-correlation-id: 80c1927d-00e9-4a2a-7dc8-08ddc3f1a683
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?MHpKN01JUW9Ib05IZlQvUnkyb3RuVnREcmhuVWZ1ZTQ5UnBYQUVIMHBzZ2Ni?=
 =?utf-8?B?S2xVYi9iYTdRaEZvY1VHRmcwRUV3SU9PK0RDWmRScTNmQmdCOWZGY21Fd2dw?=
 =?utf-8?B?RlpBN3NUNFBSVGl2Ykgvem5vdlY1N3ZGYS91K1JJTFBjTkpYMVB5OC8yK3pn?=
 =?utf-8?B?S0QydkxST2RuYXhWZkMvQmt5eVZYUjhOQWczZmxzSy9LSzlNL253d1gxS2Fm?=
 =?utf-8?B?blVGNWY2VmFLRVZmSUlLTnVHd2pHWE9qYkxOVjM4YVZQMkVwMlZlZTV0MmI3?=
 =?utf-8?B?VFNxN3NSL3l4cHk4MVozK1pPS2pVM21JV1ZOeTRLZDFKR0pPcFNxRzdhN0FL?=
 =?utf-8?B?dFh0bW9SMVk3a29VVGhwZXYyTmpzNzNkSTRhK1B6TGprdTErcm1RajNnb2ZD?=
 =?utf-8?B?K1h5Qks4ZlFSai80VnlzRTJtb1F0Vi9ybHpIUWRxTVV3OENuWHNtU05vbGZD?=
 =?utf-8?B?a0lIQjJYTmY4bW9yQ01heEwrU0NJRU02c0l1cnlvczdEajZUMnVyQzZ3NURJ?=
 =?utf-8?B?VGQzc1dzdHBmMU9rTHNtV0dhaFkzQjZZcm4wSkh3aHV4WHhBbU5nUjdGSCtj?=
 =?utf-8?B?bDRuTFJPSEJUK3hlcXJWNlRjbjFLaWdON055Q2R1cXJvWGZ5SStSSG9Ga1ps?=
 =?utf-8?B?WVZlQU5ITE1RZUsvdmpQOFpGRCtBRytVRWJKdUtuL0hLL1g0b25KZG5wZXBy?=
 =?utf-8?B?bTY0RkFkVlBsNVZ6cWt4cHdDN2pQSXFkZ3kwYlVLcTMrN1pTU29RempiMkIw?=
 =?utf-8?B?Zm90ajRRaVdsVnh5OVZyZy8wK0NjZklvUmE1aGdUUTZ0VGFoQlN3QUpzWGdV?=
 =?utf-8?B?ejZKbWNCVlU0RWlUWUZwa1RBa09uNExnNHdjN3FpY2JabEVDcDZMUEczUmE5?=
 =?utf-8?B?RmV3T0M5YjQwdk1SNkc5YVZjOHRCNTdVYlpKYm9VUXBxTnRPQW92bDBlTlB3?=
 =?utf-8?B?ZmJFSWZVTjhoOXhiMTBaOVdPK0tQZmg2bmpKcVJhalc4TWk1OVdSanUzSXQr?=
 =?utf-8?B?T3NNUENmTm0vNnJJYUY5VUg0MUo1TXZLcyt4NkIwVjR0VVVXY0cyVVdMWmlL?=
 =?utf-8?B?NXFjNEQ3cHhYY0NiblJZWEJ4akMvNHR6bmk2VnVERmx3cWp3RndsVFkxa2Ji?=
 =?utf-8?B?NGRMeWJET3JJN1dqai95bFFoS1JjRFRQU1ovaUxLQVl1d3ZDMkNvZnA1YjVI?=
 =?utf-8?B?Qk5xSHZlQkZvUHMxdCtPTEhVOW9VWlZQS2hYa0NWamNaNTJWQytXT0g2Nllw?=
 =?utf-8?B?N2VHV21CS0ltdnNpMFhyNjJkRzgwOVo1ZXdKWk5DZUVsdHhnRmF4QjlGVHpz?=
 =?utf-8?B?RFRPYWcrYitrM1l2WUZ0bGFJNUlBeDhOWTRHK0xyVFhPU3NGWWRxb2RXcVVY?=
 =?utf-8?B?c014WmxpbkFTRE03U1hRSUJGeVBDc0JuUGRmbWROa0dSUmpwbHZ1dE9jRll4?=
 =?utf-8?B?VnJ4aHNxUzd3RDY0eVJPRWw2V3VyT2w4clZmYzdRK1hPWFg2V2JVclpLblNL?=
 =?utf-8?B?UkRlWC9hNzB6SFM3RjcvamdkMjJXN3NSbHBleDdxa21nMW04VGdmK3lEWGlW?=
 =?utf-8?B?ckhyV2RkcTI4YlpIRUxnZzEwSnJDNk5JUnpZS2JRQ2FZQXpMUGFGM0dUb0hU?=
 =?utf-8?B?c294NmdQUDFzWTY3NVdUTlg5QmphRTBVNXFZQlJZNE1LZ2l3QzlCcUhMV1Nh?=
 =?utf-8?B?RDFyR3laem9waXJReU1hMnpEZ0hJcWE0RlVRdW54NmNaT1gwMlpTaTVYTm9o?=
 =?utf-8?B?OXN6a0JMVDRTeXhNZ2JnN011eXcyK1YwM1FKVXFkZmdoWlpHUVNKa25aT1NG?=
 =?utf-8?B?d1pQZktycEZyS0kvOGlmQmtHdVFLWFBtcE9wL0JGRHJFMjNMUytBbWg5czdM?=
 =?utf-8?B?NG5uSWVTSVlENzQrVlN1R2lYSEFwQkpHQ0dKNnlWU0EvV2dodzZ1ellSMWRJ?=
 =?utf-8?B?MVNPcGtaZSsycS9zWVZyRUkzang4OHRTZEUyL1lwaW1ObnRnNVdzZHBYY0pu?=
 =?utf-8?Q?1eslOFVVxnY+qw/CtorYnvl/rufk4g=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WThlRHFQSWtMSkk5R056VEMvVG9QbU5uaEpSeFYwTllhMmozKzl5cXlKRGRx?=
 =?utf-8?B?b29ReVMrc2JvZ1hHQ2ZpVlc2OHVPKzBEa3FyelZ6SkJ6R1pXWm9EM2VLRXdI?=
 =?utf-8?B?YU1vUUlNN3FxNi9yNHlMTVdaSzY4THQ2QVJPbmNZSnlBYVpPSnZUVGZBYWJl?=
 =?utf-8?B?NC9jOWpSa1kza1NCUzYrVml0cWd1SXg2Y2F2cUtVTW1GU0I1NGZiR0ZZZDBV?=
 =?utf-8?B?QXVPc1d2OW5TcGpiZ2FqSktXMXVMd1ViLzVrVTNTUFpuR0o0dWtXaTRlalVj?=
 =?utf-8?B?OE9VMUpiNEM4N1d0cVUxd0o5Y09kZ09CZVpIRm9DdXZuVkZXM2l5U3RYL2RF?=
 =?utf-8?B?eWJ5Y2Q3eTgzaVBDMnlkR29Xd09yUkNOY0xJNURlaHJ6M2hEU3lLT05ucUxi?=
 =?utf-8?B?Uk5WRmlFYkhLeUJIV1lTWEFKNmR5dW9MaFdyTTFBTGRaRlMzQmFFTXc0OW9W?=
 =?utf-8?B?K1loSUkzbVBJQzZlN0R0MDFoak93SEhtYk01ZFcyR3hHY1pyVmV3VTJVZ2tI?=
 =?utf-8?B?THlDLytFeEd1ckE2UnJtenQ1UEtaQ0xRN2NkRWpTWjQ5RGJNK2xoL2JPK0c1?=
 =?utf-8?B?czBYK3lVWit6Z1lZU3Jtd3pNV0VOdnJ2UlRDOTM4dE5xU3poMXc1TVF3WGxn?=
 =?utf-8?B?SlhTaEV0NUk1czd0RzVsY1FKdEx1MWRIdVNWVVZRSmlnTDZ0b2Y2ZEpEVDRi?=
 =?utf-8?B?TGlLNFRQdUUyeVJxRjJsU240S2tmOWdWcFhiZTM4TGM0eDkyZWZBdzd2Ni9s?=
 =?utf-8?B?UkZGWlZadFRLMlppT01mZDdsYkQ3bllSNlRhWVE4dkdoVmdyRGRvWXJ4RHp1?=
 =?utf-8?B?RWd1N3FZdHY2VE5zMW9DVGh3a3ZSZzl5MU5YRStWTjZsTjc0Slhpd3Z5ZVFP?=
 =?utf-8?B?WFVUZW90SGhUaEtFRFYvR2FEa0w4SGs2ZmgvMDZ0TXB6cm9palR6NGh4cU5G?=
 =?utf-8?B?MXhraEhVZTZsNC9WYUdXclNyd0pka2F2ai84TG9mMVlLZFJMdTY2OFBFV1hZ?=
 =?utf-8?B?NzBkYnVpNVJEbVNpWlpUb01uUTI4QVRvNEk0QW96dXBCREhzOHJYVm9HS1pB?=
 =?utf-8?B?NWd2YVZQaGErSlM4MWY3ZkdQOWs5RDZpdHhRWitBdFMrVUxIdGQ3cVcrODEv?=
 =?utf-8?B?RGp3VTZkbXU5eFI1VmVFRnRycWdBSkFjUjlQd3pOYWRMYnpUS3B3Y2FMSUJa?=
 =?utf-8?B?ekQzeWNlL2xVUkFQVVdxNm1SdHlZNUdNZG14RjlYcGh1Y2MyR1RSdndNT3pz?=
 =?utf-8?B?dWR2THVxa0MveUZXVXI3OGVWRjRyWFlHdjlDazJhTyttaTJuREt2N0xnRnJC?=
 =?utf-8?B?ZHNpc1Y4S3dBWFoyQmwxeXVoeGFXTUVDUXFJQXY3M3JWbExWN290M2trb1lN?=
 =?utf-8?B?N1l4dmhOYkMrSFo4OFhqUTFpQ013Tm9FT0tESDhBZkxWZ3lEcFJnU0JoZXJI?=
 =?utf-8?B?NllPVXhxcWtlb2RmK2R0K0xoeEdSNVEzRTdiNXhXTlpITm0xdzRHVXVKZllp?=
 =?utf-8?B?MisvbTBQRjRIaHJIeU8zN0ZkTWVJcWdmNi9DNUMxaGxMdVlIZjgrTzdUdVdl?=
 =?utf-8?B?REhmOXpjVEtVWTl3Z0NwSWpFZ1d5R1dJS01HTyt0OFl5SG5UZHFkYTdaMVdI?=
 =?utf-8?B?K1lTbEduWUZWUDF5YUt5bkl5S2xZQUZYd2x4cmFJS3RTVUZmWHFycGZyTzhO?=
 =?utf-8?B?bkJLWmxyZnhYYlFBbDZ5clNrUWVIenZJUEx0NURHRWNPK2Y0Ry9uQ0ZpUGFh?=
 =?utf-8?B?blBEbEJ1blM1bXZwZWhIZEJXR29vdm53TTVkNnNrWUZ5M00zVGVXSHdnQm0x?=
 =?utf-8?B?UEd1bDNQSUZTOEUyc2RGenBsa0tIZkg2UzVrTWJSbktEbEl3S0ZEVzl6VDVE?=
 =?utf-8?B?d01QamRudWZSWTJ1QlJWNWNjNGpxSWlJcWRwZmVoS29KeThBUDJLK1Vjajkx?=
 =?utf-8?B?TFJoTWpkbHBBRmpPNXNQY0Q1UHB2TzVrMytxYm5ZODVoOEpqc1JSNzJmNXcw?=
 =?utf-8?B?VGR6NE92T1l5bHhYQjdiU2Z0YStwNVZRRXcvME1FTVJzOHFnZjdEWHZNT1lo?=
 =?utf-8?B?bVpqRC9UQUdTRkg3T3Ura2ZQUTl3UXZQRUhyYS9POUM0VzZ5NnFETlhyTWFD?=
 =?utf-8?B?NHRIYU9zR3h4ekhLcmJKTE94bWtxVzR0YUFadERFa3YzZzdZRkJhaExNQzdn?=
 =?utf-8?B?N3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DE677CB76459744EBC3226E25DD01B6C@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80c1927d-00e9-4a2a-7dc8-08ddc3f1a683
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jul 2025 22:48:00.4536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uHra3PRFLA/4tQhKlb5vjORY9Ea8p0OtsAoo7BD9HH7xZwmCZt3Tj7+SIKYqfA+22zQvGGK14t9wdBy3rHEK2AA52xDT5FgHnyV+7gBm63g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8601
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

T24gV2VkLCAyMDI1LTA3LTAyIGF0IDE2OjQyIC0wNzAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOg0K
PiBBZGQgeGVfbWlncmF0ZV9qb2JfbG9jay91bmxvY2sgaGVscGVycyBpcyB1c2VkIGVuc3VyZSBv
cmRlcmluZyB3aGVuDQo+IGlzc3VpbmcgR1QgVExCIGludmFsaWRhdGlvbiBqb2JzLg0KPiANCj4g
djI6DQo+IMKgLSBGaXggbXVsdGktbGluZSBjb21tZW50cyAoY2hlY2twYXRjaCkNCj4gDQo+IFNp
Z25lZC1vZmYtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KDQpJ
TU8gdGhpcyBjb3VsZCBiZSBzcXVhc2hlZCB3aXRoIHRoZSBwYXRjaCBhZnRlciBzaW5jZSB0aGVy
ZSBhcmVuJ3QgYW55DQp1c2VycyBpbiB0aGlzIHBhdGNoLiBCdXQgdGhlIGNvZGUgaXRzZWxmIGxv
b2tzIG9rIHRvIG1lLg0KDQo+IC0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRl
LmMgfCAzNg0KPiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysNCj4gwqBkcml2ZXJz
L2dwdS9kcm0veGUveGVfbWlncmF0ZS5oIHzCoCA0ICsrKysNCj4gwqAyIGZpbGVzIGNoYW5nZWQs
IDQwIGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfbWlncmF0ZS5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX21pZ3JhdGUuYw0KPiBpbmRl
eCBiNWY4NTE2MmI5ZWQuLjFmNTdhZGNiYjUzNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX21pZ3JhdGUuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0
ZS5jDQo+IEBAIC0xOTE3LDYgKzE5MTcsNDIgQEAgaW50IHhlX21pZ3JhdGVfYWNjZXNzX21lbW9y
eShzdHJ1Y3QgeGVfbWlncmF0ZQ0KPiAqbSwgc3RydWN0IHhlX2JvICpibywNCj4gwqDCoMKgwqDC
oMKgwqDCoHJldHVybiBJU19FUlIoZmVuY2UpID8gUFRSX0VSUihmZW5jZSkgOiAwOw0KPiDCoH0N
Cj4gwqANCj4gKy8qKg0KPiArICogeGVfbWlncmF0ZV9qb2JfbG9jaygpIC0gTG9jayBtaWdyYXRl
IGpvYiBsb2NrDQo+ICsgKiBAbTogVGhlIG1pZ3JhdGlvbiBjb250ZXh0Lg0KPiArICogQHE6IFF1
ZXVlIGFzc29jaWF0ZWQgd2l0aCB0aGUgb3BlcmF0aW9uIHdoaWNoIHJlcXVpcmVzIGEgbG9jaw0K
PiArICoNCj4gKyAqIExvY2sgdGhlIG1pZ3JhdGUgam9iIGxvY2sgaWYgdGhlIHF1ZXVlIGlzIGEg
bWlncmF0aW9uIHF1ZXVlLA0KPiBvdGhlcndpc2UNCj4gKyAqIGFzc2VydCB0aGUgVk0ncyBkbWEt
cmVzdiBpcyBoZWxkICh1c2VyIHF1ZXVlJ3MgaGF2ZSBvd24gbG9ja2luZykuDQo+ICsgKi8NCj4g
K3ZvaWQgeGVfbWlncmF0ZV9qb2JfbG9jayhzdHJ1Y3QgeGVfbWlncmF0ZSAqbSwgc3RydWN0IHhl
X2V4ZWNfcXVldWUNCj4gKnEpDQo+ICt7DQo+ICvCoMKgwqDCoMKgwqDCoGJvb2wgaXNfbWlncmF0
ZSA9IHEgPT0gbS0+cTsNCg0KTWF5YmUgbm90IHdvcnRoIGl0LCBidXQgd2UncmUgZG9pbmcgdGhl
c2Ugc2FtZSBjYWxjdWxhdGlvbnMgaW4NCnhlX21pZ3JhdGUuYy4gU2hvdWxkIHdlIGp1c3QgYWRk
IGEgaGVscGVyPw0KDQpFaXRoZXIgd2F5IGZvciB0aGUgYWJvdmUgMiwgdGhlIGNvZGUgbG9va3Mg
b2sgdG8gbWU6DQpSZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGlu
dGVsLmNvbT4NCg0KVGhhbmtzLA0KU3R1YXJ0DQoNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqBpZiAo
aXNfbWlncmF0ZSkNCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG11dGV4X2xvY2so
Jm0tPmpvYl9tdXRleCk7DQo+ICvCoMKgwqDCoMKgwqDCoGVsc2UNCj4gK8KgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHhlX3ZtX2Fzc2VydF9oZWxkKHEtPnZtKTvCoMKgwqDCoMKgwqDCoC8q
IFVzZXIgcXVldWVzIFZNJ3MNCj4gc2hvdWxkIGJlIGxvY2tlZCAqLw0KPiArfQ0KPiArDQo+ICsv
KioNCj4gKyAqIHhlX21pZ3JhdGVfam9iX3VubG9jaygpIC0gVW5sb2NrIG1pZ3JhdGUgam9iIGxv
Y2sNCj4gKyAqIEBtOiBUaGUgbWlncmF0aW9uIGNvbnRleHQuDQo+ICsgKiBAcTogUXVldWUgYXNz
b2NpYXRlZCB3aXRoIHRoZSBvcGVyYXRpb24gd2hpY2ggcmVxdWlyZXMgYSBsb2NrDQo+ICsgKg0K
PiArICogVW5sb2NrIHRoZSBtaWdyYXRlIGpvYiBsb2NrIGlmIHRoZSBxdWV1ZSBpcyBhIG1pZ3Jh
dGlvbiBxdWV1ZSwNCj4gb3RoZXJ3aXNlDQo+ICsgKiBhc3NlcnQgdGhlIFZNJ3MgZG1hLXJlc3Yg
aXMgaGVsZCAodXNlciBxdWV1ZSdzIGhhdmUgb3duIGxvY2tpbmcpLg0KPiArICovDQo+ICt2b2lk
IHhlX21pZ3JhdGVfam9iX3VubG9jayhzdHJ1Y3QgeGVfbWlncmF0ZSAqbSwgc3RydWN0DQo+IHhl
X2V4ZWNfcXVldWUgKnEpDQo+ICt7DQo+ICvCoMKgwqDCoMKgwqDCoGJvb2wgaXNfbWlncmF0ZSA9
IHEgPT0gbS0+cTsNCj4gKw0KPiArwqDCoMKgwqDCoMKgwqBpZiAoaXNfbWlncmF0ZSkNCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoG11dGV4X3VubG9jaygmbS0+am9iX211dGV4KTsN
Cj4gK8KgwqDCoMKgwqDCoMKgZWxzZQ0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
eGVfdm1fYXNzZXJ0X2hlbGQocS0+dm0pO8KgwqDCoMKgwqDCoMKgLyogVXNlciBxdWV1ZXMgVk0n
cw0KPiBzaG91bGQgYmUgbG9ja2VkICovDQo+ICt9DQo+ICsNCj4gwqAjaWYgSVNfRU5BQkxFRChD
T05GSUdfRFJNX1hFX0tVTklUX1RFU1QpDQo+IMKgI2luY2x1ZGUgInRlc3RzL3hlX21pZ3JhdGUu
YyINCj4gwqAjZW5kaWYNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdy
YXRlLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5oDQo+IGluZGV4IGZiOTgz
OWMxYmFlMC4uZTlkODNkMzIwZjhjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfbWlncmF0ZS5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9taWdyYXRlLmgNCj4g
QEAgLTEzNCw0ICsxMzQsOCBAQCB4ZV9taWdyYXRlX3VwZGF0ZV9wZ3RhYmxlcyhzdHJ1Y3QgeGVf
bWlncmF0ZSAqbSwNCj4gwqB2b2lkIHhlX21pZ3JhdGVfd2FpdChzdHJ1Y3QgeGVfbWlncmF0ZSAq
bSk7DQo+IMKgDQo+IMKgc3RydWN0IHhlX2V4ZWNfcXVldWUgKnhlX3RpbGVfbWlncmF0ZV9leGVj
X3F1ZXVlKHN0cnVjdCB4ZV90aWxlDQo+ICp0aWxlKTsNCj4gKw0KPiArdm9pZCB4ZV9taWdyYXRl
X2pvYl9sb2NrKHN0cnVjdCB4ZV9taWdyYXRlICptLCBzdHJ1Y3QgeGVfZXhlY19xdWV1ZQ0KPiAq
cSk7DQo+ICt2b2lkIHhlX21pZ3JhdGVfam9iX3VubG9jayhzdHJ1Y3QgeGVfbWlncmF0ZSAqbSwg
c3RydWN0DQo+IHhlX2V4ZWNfcXVldWUgKnEpOw0KPiArDQo+IMKgI2VuZGlmDQoNCg==
