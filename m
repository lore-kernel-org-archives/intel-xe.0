Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59A9BC02188
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 14:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2528C10E542;
	Mon, 27 Jan 2025 14:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ke1uo32D";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0F6D10E542
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jan 2025 14:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737987841; x=1769523841;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vDzpS8hI4mCQyEUXWXDjOmZ02qxaHdN4mVgmwp2soog=;
 b=Ke1uo32DBhwhYzm3iSJJHK2sDmiKNpjnFS4GsyioPcZnfBpQ6VvCOBe5
 bj4xfwxuCYGoCTTNoMFAVsNXYPrK5lZWJhkMFr/yGLKRDODIgVCqOLiPc
 3iWhkTRPmLHjbrpxs/VfJvqMHBCSZySmWh9TtD7I2p/oHE64Rs0oNMaPR
 o3agxxLaNUidVCKXbTJqqAy+oX5GTccg74xyFJVURvEUx4/YPpLG/Xsjj
 obuaiv5kTd5eBdehatSAC6mP5F+j+UppxDHG6/9sT4c6LSdUaP6wkfD81
 66zXZcMtlJ+A7jxRDsUEC2LQdRbq8RC/l+fTq95up9J36CKHE0Rssl4Vy A==;
X-CSE-ConnectionGUID: rufq7eIDQbG6actcHU2heg==
X-CSE-MsgGUID: onKaqLW0SfWPwhWN0XMtzA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="60916285"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="60916285"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 06:24:01 -0800
X-CSE-ConnectionGUID: ak0XEd0aSp+QmlYRgXN39w==
X-CSE-MsgGUID: huYfzjECQGSXL6wUS/vt0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; d="scan'208";a="108351299"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 06:24:00 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 06:23:59 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 06:23:59 -0800
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.177)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 06:23:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G5C6y7mi6MLDC9wgt/0zQ0BXc6N22Yhk9uhm0vumNM2AX6yY1AEYywWRCgs2ySF03Z82K5p1fSzzE1haCAoDB4Oj9im1XG/KDqNp4HTrKwt+Jtsb4NGBkCq+RVDLb+Siqe7v2bs2Zu8Jm5K4HJP7otXBslFah3iwqfoETyql4Sx07iLBRcxt7jX6/3h+PuQT+xQ0JTq0v0K/Y9o9O+4VK0QB9kFuoFOMK88mkbHp3SNCAMNh0bt0hbGBwJW2I+Unh+EpySdkNbFbSK9xexefop2GIAv+v1DjFczsx35bCc7UDVdiFfFHSR7QeHE/C9Ga1fuCGJhEnhEti17QPEA+OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LspHvqYekY/ApkwRWKXu63mur38Wc8m8oMPX5UwdEpw=;
 b=aGmtX6qClngMWZSwcq4J66bXYVXwojv17sSG6PCAXo4ZMTCpA+SjDPWtX00l2zaVhqkzmuemAOTab+Pd2p4mz2gcv0aU4ko0Bj5ku8P67xnksLLOKmX9spfoZQIC/ASG7D0uehCLDEA3Ap1aNFLBTWKrx+2cPF5KIUbYEUuPBj9nK0VoRZFMmECNDcTjLj2kLuMk1d3NywPGwKRvmcicRhghfkmR6cNHd1mR9q1nYlr3P+wpgpvX9KS4UgQusKgDSziZjCyuZ+0zWD/xccYIO5WJqYQXQLihkZHDLoMgNSWqTUevVkWAVZSZawyt9reIxeJ3XF2KG1aaVZpPFnntEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 LV3PR11MB8554.namprd11.prod.outlook.com (2603:10b6:408:1bb::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 14:23:16 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%5]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 14:23:16 +0000
Date: Mon, 27 Jan 2025 15:23:13 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Thomas =?utf-8?Q?Hellstr=C3=B6m?=
 <thomas.hellstrom@linux.intel.com>, Matthew Brost <matthew.brost@intel.com>
Subject: Re: [PATCH] drm/xe/pf: Move VFs reprovisioning to worker
Message-ID: <iwvp5rdjkaft5enxsaloohz3owiwf7gucgns5q47whwzhdsvxa@y4axeccbgijj>
References: <20250125215505.720-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250125215505.720-1-michal.wajdeczko@intel.com>
X-ClientProxiedBy: AM0PR06CA0096.eurprd06.prod.outlook.com
 (2603:10a6:208:fa::37) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|LV3PR11MB8554:EE_
X-MS-Office365-Filtering-Correlation-Id: fef6a645-be1d-4b4f-f1c7-08dd3ede2398
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K0FxMktobFordThZb09pUHR3MkFkRUp6Y0R1aW1nMFlYazZuRm9hTkJWK1VS?=
 =?utf-8?B?T1JJTlpYZllxY1dnT0FUVkhFSXBXbFB5bEVnemVtQXB4MHZDVmowVDdrK21P?=
 =?utf-8?B?enE5SHVnVEhVTEhlV05IYU0wV0NqZ2U1aFU1alhSREo4MUtPYjF6MTdXUFYz?=
 =?utf-8?B?MGNSUmFzT0w4bzd0UHJHUElhOGRoZ3hyemJsZHVrWXZNanMvTEMzNXViK3pX?=
 =?utf-8?B?b0pXRGhjYjIyQUgvOXFsR2tvMnlIT3dFeEtYaU1seDRtTk1LY2lsYThtdzBm?=
 =?utf-8?B?TGNkMkZUVnFBVkI2d2tXQ2FZTVIzQWlEWXQ4YXVjMmpCaEppTXRDVDBPTXBx?=
 =?utf-8?B?akdHdDF2NVczNzlsK2JiUEhyQ3d5U09GSTNzQVFzUHQwNmdONXRmb01VeHpL?=
 =?utf-8?B?Z0ozWGNUYXVJcHR0T3ZIRlRveTJlQzcvUEZCbnZodHppcUpBYXorNHIybS9C?=
 =?utf-8?B?b2xCd2g5eThVSGFhcWZ4eG5XcFEvWjNTM3EvT3g2d2pBY2htSFJBLzBFR0ZG?=
 =?utf-8?B?bnplQ3RBdTNjdDFNZVhDSlRXT3NiMFVjbUFvQ01ES0ppdnJLVkJPYWFSTStj?=
 =?utf-8?B?RDdCNEd1aG9kd1dGOVhwcUxGdkJzamg3alhpOUJBV293M1IrUDFZaWgvNy84?=
 =?utf-8?B?M0U0MVF1L2p0ZGJmcFdZTDRFUHFmWVljL0RlZjdvSlZtd0RwVDBJUWo2U0dD?=
 =?utf-8?B?Vk1GOXZwcitLb2EyWGRKZ1p4czF4dDd1ZDJPYWphcGxMQ1hyK0p4VXZFekNE?=
 =?utf-8?B?c0JNQkQ5UGZXS2xkQXRJMEtvQ29aYnRCcXFtZWErOHhRRkhTc3E4TXI2WHBE?=
 =?utf-8?B?cHJacnpNc28rcURHTkJXcUVtNU91QTJmQTNoVUxqUlpsUmIreGoxN2xqTWs2?=
 =?utf-8?B?THdZNE9RNDV0QmYxdzVybnZQZ1Z6dXFLbUhGdWtILzZISVM0ODM5a0cxMW96?=
 =?utf-8?B?b2NqRlhqYm8wbHRhaENLUjZ5Z0h6ZjZXdGt5YzM4RzViMm9wZjFsM21YbUZF?=
 =?utf-8?B?V1l4WHArdG9PZ2hnUTdmU3gyclJLRlNXZkJXOGtBRTlic1dkWDNQbnBPQ3pD?=
 =?utf-8?B?Q081WGVRblNSamhuRzB2NmM3cWozNDV6NzFvRWF6NUxGeE9RS0ZYV0xzVENi?=
 =?utf-8?B?MHE3NFNBY1A0TlBmVEFoY0hPc09GMHdoc25nT2JPN1ZXLzhCSEMxMXM5TlJG?=
 =?utf-8?B?NU1aVXZNU3djL1kxRnd6UEJkTFA0KzJjQlZFc0dOcVg4dHQzYUVjdG9McWJ2?=
 =?utf-8?B?MEVRUHpiUk9id2lNOWxnTW1mREEwdnh4YnlLSEZLcEREZmZGZHVOZVBXeVpY?=
 =?utf-8?B?YUxET1BQeU9GTmJ1eDV3WkwvVlVHQlpKRzhDQkVZayt4RWpKdmpLYXkwaVRP?=
 =?utf-8?B?NnJnd0Z3VTJZdDc5Mm85bDlPVE9RdklPRzRDakNVNEtxdEFnMnFBdkxzajhn?=
 =?utf-8?B?NlljbkpKdlIyWlBEQ2YxRWVOSGc1UHJEV05IUGpQZDU4TXBMRTFaNE95Um1C?=
 =?utf-8?B?OXpVQ1pCUkxFNVhNd0lkLzFCTE9OQ2h1all6TjgvS2IxU3NwRkNwNGRPejhJ?=
 =?utf-8?B?RUZvNFVHaXJTakkvTUpZbFhnVy9qM1VLamtiNTQwRFhnam13anc2ZjBadkpj?=
 =?utf-8?B?VUUraitLeEVwd085ZGhlVENITzJOWndzZzlsdnAvU0xtU1ZERU5XVzFhTi9B?=
 =?utf-8?B?YVBRL1pPTlI3UjYxRlhWd0VQcUhoTndScTlpZ1BwWDdqR3dKTDhHYStkcm9P?=
 =?utf-8?B?V3NNRVVEam5FOEJPZmJKTXhVSm1IRWxUcEdPZFNNa09BWUNVUU41cVA3V3Vi?=
 =?utf-8?B?UUNUcFlmb29PUFdSaVc5M0JuMVlRcG1sQ2RtYWNKMkRFYnJHdWQrUEE0OXU3?=
 =?utf-8?Q?+AGpW0CdN0lz4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVlkaHprMit5MmJhWDBjSHUzamJaOU0rVDkyczRrUlJxM1VmTTNOMGRwOXBk?=
 =?utf-8?B?LzE0Vy9OajBZQmJMMkVrWmJJMTJyOVNRSG0wSFNic3pOUFNuRXg5anNvMlZY?=
 =?utf-8?B?cWUvb3Y4OUpaRWF6dEJnUWFnWHR2SjRZekJkVGIyaWZjdUszOUtDK200a1dW?=
 =?utf-8?B?Q0xNbFZ4T0ZidFlMaHhKNHJSemw4c1crOFBwYStocExZK1VxRXFjcXVQeVB2?=
 =?utf-8?B?bE1OK0FySjh3b0ZxRDFqWFNBdzZHejM5NE9HS2kzcEFNbzliclZDNXNZV2h2?=
 =?utf-8?B?a0Rrak8wTk5zMzQ2RzFGVkM5V21SOHR2b25mQ0I0bmZHV200TXhCZ2FNVXNK?=
 =?utf-8?B?TUNaMzh2elFFdkNZOFlMb1lLd3JoS2VzUlBZM2FOOHFncXpmd01wcHpkZlIv?=
 =?utf-8?B?Nnk5U2o5RmVua3FSS1JnSXR4dWVmbzA3ZmJESUkwUHBaT3RMT0hTV2xwZEJC?=
 =?utf-8?B?WGJVR0g1SjNLeDd4Wm9PbXM3UHllbkF4L3Jvd1dnbTQvdnVhaitlY3ZzOGhj?=
 =?utf-8?B?ODEvdVB5cEZYajRvc29rUEdxVG53L0RuakJ1SlQ2UkhkdWF4WnRiSmR5QlN2?=
 =?utf-8?B?UEF6dG5rTVJ1V002RUtTZmdsUTcvbjJVMTUrTmZYR0FzMS95OTZSV1I3Vytw?=
 =?utf-8?B?OWlrM1dRcHRUd2xxYTUzd1djWEsrS0cvRTRrNEE0dW01Yll1b3krOEpFb1Ry?=
 =?utf-8?B?R3prSCtSbmxGVTBOMkNQeUVEV0lOZktFWnJSZnczVzUxYXVKZjl0MVBQVnlu?=
 =?utf-8?B?d0xqRzI5c0k5RnBJUTBnQ2Zham82ZklxUTJPL1JETGlaWE4xNGdZajlNMERL?=
 =?utf-8?B?MGIweU1IVnU1S0RmVU9zVDJjOFVVUE1sbHVleDgrNjZKbERCQ1FIYUxsTHQy?=
 =?utf-8?B?MHBwdlo5UTkvV3p2bDhSalNnajNYNDlqTEQwa21jOVZpbUg2dmcvN01sQnhU?=
 =?utf-8?B?cmFxWFN0alNjRTJiZi80R201UWw2S2c1a2VjQ3BUdFNQNHloVkZGbXZnWjYw?=
 =?utf-8?B?VWRka2xjTFY1eDlPdUZVVVl0K2VmaFZnMlFubmNkMHBBSUsrZG5PSmo2Ujl4?=
 =?utf-8?B?dW1YTnhuazZLZGF5WGgyNDJqTVZRZURPVVlUZUJlZ0dvVSs2SENLS0JmUGoy?=
 =?utf-8?B?MjdIb0RYY0Fwck15bVMzM0JCeTA0WUJ2dkNObUYvdTZ2dmRPdFlBMlpEdjZ3?=
 =?utf-8?B?c2ZOZWp1cWZYQ2JvcXRVa29PWkxkR3FrR01TUjVBZXlkNFdtSjN1Vms5SklZ?=
 =?utf-8?B?T1NuVkY5c0trb01CbE92QmZhQTM1MUhpVTIvWHUzSjZGOUZYWE5BR1NjWHVM?=
 =?utf-8?B?M1Nta2tCSWZMTi9GdTRmNkViLzZkVlg2eHBWZ3dzTElYZUd2cHAvRzFnQjcy?=
 =?utf-8?B?RHNiSGs5dkJSU29NT3ZCcXhzT0toUHpDbW1GQjM3Y1hiVURLL3loRSsrcUZX?=
 =?utf-8?B?MmFKdVVBQ1dXVFdtZmNVa0tUV2pEVVJTUUlaQXBxYzJFcWlETS9DWWZZaFpG?=
 =?utf-8?B?WkdyaUsxdjlPL1h4bUNzbitXaDRtNFRkUDBkZnBObktFRHBSZFU0QmE3dGpS?=
 =?utf-8?B?a211UDNmY2tDRWNRRFFYbFU0Mm02Z0w3S0dHRHRTRFphNThTTGprbjA1Q094?=
 =?utf-8?B?cE1KRmY0alJZZmpkMDBQMkEyQXlkOVVpTWFYZ0tPTzFTMHQycGlDK2t1a0Jx?=
 =?utf-8?B?V1lRdkxJUVJpbGttSEVzeUVZTHdNdHl3Vlh0SDdqV2t2eXlyN3Y2Z00vMkls?=
 =?utf-8?B?anZsdEsyR0d2S2ZYSjFFTkloTFQ3RnM4eXF0Q3dKYXhlbGFWcE16SllMSWZM?=
 =?utf-8?B?MjJOQmtHZWRUc3Azb1ZDSWNqdG9CT082Rng5MDNadVZUZHlIODZ0bmx6bkpn?=
 =?utf-8?B?dlA1NW4vSG5ZYU5NeWNzZi9QWitnUkFCVnlOMEU3TlNFZHNteVpxNWNaK016?=
 =?utf-8?B?TWNMTXJVWFFrNmNUeHVHVXA1U3N6UnJvdWdVaU95U0Vrb1RKK1VybjdROWRp?=
 =?utf-8?B?eDlWZDRNWTZ0a3JTaEU0SXkzZTRqSldsUWJHcGZBaklFbWYvN2VQR1JHcktN?=
 =?utf-8?B?M2h3RDRiUVh2NnVpTHJpZU05MUR4L3lOZk1Idi85dTFNdEZEcWYyYW5EV284?=
 =?utf-8?B?Z1ljNUZsNUVoUVpLZnpjOGE1YXp6VmlsMjFUeFFQKzJ5d3pESFR3dk9vTXJB?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fef6a645-be1d-4b4f-f1c7-08dd3ede2398
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 14:23:16.4743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TmLifarSMhDZXznASjDGXjWjwSXI8iixawC1AqddndcNReyml9UpShtXQbkqjde6XYS5ZRzKZDkyENg+RBJwRnJ420s6xH3MwOt1AMlNE2E=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8554
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

On Sat, Jan 25, 2025 at 10:55:05PM +0100, Michal Wajdeczko wrote:
> Since the GuC is reset during GT reset, we need to re-send the
> entire SR-IOV provisioning configuration to the GuC. But since
> this whole configuration is protected by the PF master mutex and
> we can't avoid making allocations under this mutex (like during
> LMEM provisioning), we can't do this reprovisioning from gt-reset
> path if we want to be reclaim-safe. Move VFs reprovisioning to a
> async worker that we will start from the gt-reset path.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Matthew Brost <matthew.brost@intel.com>

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał
