Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41548C87FCC
	for <intel-xe@archiver.kernel.org>; Thu, 31 Jul 2025 17:05:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0399810E233;
	Thu, 31 Jul 2025 17:05:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S7rbKigf";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A78410E233
 for <intel-xe@lists.freedesktop.org>; Thu, 31 Jul 2025 17:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753981532; x=1785517532;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=n0DYwiZbmQmb3u1nAl2tpL4jGxMyFbb687aGOHecEfM=;
 b=S7rbKigfBoxyEYTRhXu/f1FOn5IPB3UG5DxVUs02MKQ0+Sch0en9jEwy
 M9NOK6kgo3hE35oP2MYoryRaB5QCjRTZCHfJ5lUl0P3xMl7ns7GDodr45
 hsNzX4wC7bTkkMdgAYeQsBeARkkxWBiQW1G/OgHVPx3x3NgPY5en6c4d5
 aHUd7NGA5zUlCHcrBCELDhmvZvZ4KclnUAyf0DDYahPgvGzd8Qyo1w29P
 uxQzvsrd152IY6nunyQ/60yCfnwWDXz8MbJ3UAGMWv2wRhZPX2d9GdmG3
 W+lmR6SOXo2mOA3GnK1lW3WjxJFXagEXpiDWG3RARgY9DakAIa4JA+8Zy w==;
X-CSE-ConnectionGUID: tGAc/THQS/iC65HFPe26lA==
X-CSE-MsgGUID: QRMJJyRTQ9GIlP4ux68ucQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11508"; a="81764544"
X-IronPort-AV: E=Sophos;i="6.17,254,1747724400"; d="scan'208";a="81764544"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 10:05:23 -0700
X-CSE-ConnectionGUID: b1WNcwUKRH6YvkVS59Cpqg==
X-CSE-MsgGUID: bRT6h8y5SkaeHOGjB7lEuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,254,1747724400"; d="scan'208";a="162895799"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Jul 2025 10:05:23 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Thu, 31 Jul 2025 10:05:23 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Thu, 31 Jul 2025 10:05:23 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (40.107.95.43) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 31 Jul 2025 10:05:22 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=A1nZUmMsU62KCwM0IvKIEPhkmxsFW+7yfSIvIkQBej5+HzKxjU36E7L59orsuvXtJXh0Mkm8vI98lKdeWBhe5J5hcSQ1ctotsP7D02fXlfw8hELIf6jhdilayU1rpDOgmACSdrfGSPWstJRt3ZICn6FtuSUOcro8BZByjjgR4S8H0SMO5hKNXUr0vgdNMR3CueXaXYa2AaFk0pA1vNQAhphn3vLIYRq5KDbm56B0QlyGtHvC03P1DRxuYqh8mrP80i1vu73Nex2wQwklLAG7f2vfF4+LcvaZBsj/iaQXT8WcGbrtSxOrMzCMYt+dP1kvKn/YKq6i2Hou+eDs6STHtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n0DYwiZbmQmb3u1nAl2tpL4jGxMyFbb687aGOHecEfM=;
 b=CpYmzPlSjRPeI+hC/WyGWUeroV7fSvNw2ONQktKeDL27IrdT0e05ZuJEvtyDZOtya+bcwyA4B0y6bZDOf4k8KS+TU8vj1DaZa4kteGLRUc3vgeoL/q7wWY+IlPzyJzPaZvmU4HuMPx9E9/TIyiNWcAG3scqWLtzaHv/KtkD47qZ3d4pyd+mwhaIOjOu4fjrYdSoGoOyrEtWZUgcUAs5mY6yAWN0WKvsmsj752lCLRSpAn3Yrfy+eOY5BpNid2EyjBcdsyOWVLvrzLSq80+p2Uw1sIh2DrP24Vfw1fD9mk+Fao6jvmaLdsmQwi3LwW7O4l/oBVLxTqb6NQVcqaLQaHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SN7PR11MB7418.namprd11.prod.outlook.com (2603:10b6:806:344::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.24; Thu, 31 Jul 2025 17:05:20 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%3]) with mapi id 15.20.8989.013; Thu, 31 Jul 2025
 17:05:20 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Kassabri, Farah"
 <farah.kassabri@intel.com>
Subject: Re: [PATCH 5/8] drm/xe: Decouple TLB invalidations from GT
Thread-Topic: [PATCH 5/8] drm/xe: Decouple TLB invalidations from GT
Thread-Index: AQHcAZLjC4MxxfpnyEiIKFQm8SL1g7RMd28A
Date: Thu, 31 Jul 2025 17:05:20 +0000
Message-ID: <45ac148fd716d292acbf65bda3be4cb4f7b25740.camel@intel.com>
References: <20250730204514.76459-1-stuart.summers@intel.com>
 <20250730204514.76459-6-stuart.summers@intel.com>
In-Reply-To: <20250730204514.76459-6-stuart.summers@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SN7PR11MB7418:EE_
x-ms-office365-filtering-correlation-id: e585c593-c1f7-495a-9d93-08ddd0546e3a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?bVJKS1JqVFlVWDBubFVnMzNnbmhKTGxyUE9PQzExejVLVmFkK0RxeXVNWGJB?=
 =?utf-8?B?Rlc5QVg3eTBRMXRsNUtzQTZzdnlqTUU4bU5ySlMvZEhyRzBhWElvVVpoa2RS?=
 =?utf-8?B?cDEwQjQvYWtVMWg4ZUJ3SHE5TVZKbmxvN1RWOUlnaGJsMGZsa2NlbWJ2ZWZy?=
 =?utf-8?B?Kzgzc2VQVjJiaWNvbGk5c0U0WXJ4T3d6WjNZYWV3OXpEeVBBbUVvWS93RzVW?=
 =?utf-8?B?ME15eXR0UldZOUxNQ2ZHaDFGUHp4NlhSbGhTVlBHQTcyaC95ekxhem9kY3o5?=
 =?utf-8?B?ak8xSzltVVgvdEpUU1JMQ1NkRDAwZHBvaVhCY0xLdWpBcC9JL3ljYXdCa3Ju?=
 =?utf-8?B?Qkd5OWVLb2t5WXpqOXA4clFMTHlwZWppeVpDQzNSdE1GWkJmWDVCWXluQTRr?=
 =?utf-8?B?OVZyR1MzWldzdEVWemNSSHpvQlRFUzZ3WW5DZ0ZxcEZtVjNOUHRBQVc3cERh?=
 =?utf-8?B?Z0VuTW1Qd0l2UVRnaVdKU3VUeVJsQWJGK2dVSlB6V3o4dG5DSkYwK1UrS2xI?=
 =?utf-8?B?Q0tNK1hmdStoTHRaK3NXQjFDU1pmbnVaZGc3cnJSZW50VGZ4Y2JnQTM4aFhH?=
 =?utf-8?B?WGNwQVh4OUZlcy9sMXVWRGtzbm1QVWlxUW0zSHY5akM4ZTlHMTFwNjZhcnlK?=
 =?utf-8?B?MGFsUWc0RGtNeldOM2F6djkwS09UbGRIdGpNNFdURGNVZFdMaVdHUEZZQWtz?=
 =?utf-8?B?WHZBQzl2UW4zY0hHNzlsMTlEa2VBczVocVROcDkyVXZqZ0pGb1dtWnFkMVNm?=
 =?utf-8?B?c0RtT3gwL1pXUmhSUk0vSjh0VzlHYzlHK0Jmc01NQjE5UDgxVXdjRHNkcFVl?=
 =?utf-8?B?ZnEyU1JQQUJRUml2ajNUcHYrT0pXcS9jZUxOSnZ0OXk5cjNUSEUvWnBhdlF5?=
 =?utf-8?B?a1JDSWZJQnRJay8zK3J1KzU0clJHMWozeG5aNUhBTURLZmE1QU5jMVFZQ2N2?=
 =?utf-8?B?aTl0cUdudVlremQrQjVUTlJaTjVsN1lFZ001WTlLVFY5SUxPUlY1alZxeVd5?=
 =?utf-8?B?b1FkQkFKTEpBa0JvK1lvYXVHSlBvZThra0d0WFMwWTVRdmxYK3hGM3g1aVVU?=
 =?utf-8?B?ZE5UVFRpNnltTVZPYmpqazJUY0RTSU83NlJBMTc3TTh4MUF1b1BlbVZlN3M1?=
 =?utf-8?B?cnBsdXcrT05nQXBMVTA5WFlMOGdhd1l2ODFTYm5EMkFGVTR5MjRpYXM1U2Ns?=
 =?utf-8?B?T3NVZWpGSGpid0pBWjFmaVRQVmRnOForKzg0c1B6U1Z3bFBQemZmblJ1aXVv?=
 =?utf-8?B?R3BKYlVLOVJaYXI5VnJkUzFhQVdRZ1RtU2VvcU8vOXM0bTdJOE50bnBBSmtY?=
 =?utf-8?B?MWhxL1hZVVg1YytEQU9ZczRBaGRpVlZJOFFDQnZoSjA1OTBJYUg2emUwR09F?=
 =?utf-8?B?eFVBWmlzeGhWMUpEQTFFY0NGOXVrRkVOOWNSZG5OaUVGMUl1MUNRY1IwTnN5?=
 =?utf-8?B?QXNTbXI1YVY2OXZueDhob0doQWFMZVVYQ3VnVU9CNW9CMmQ3Z0UxemNLN2w3?=
 =?utf-8?B?OVA1djZHUm5WQlArUDBsUWpVWlUzWStBWEc4UlNpa2dmUlUraWVSNGtsWGNz?=
 =?utf-8?B?bWVYWUhPZEZwbFIrMENEOWN2N2pTZk9MdzhiRnJxL3Q3cGwwSC9mOVhFSExE?=
 =?utf-8?B?WG5qMFhyakNwTmdrbzR0ZUVMUkcwZEpvbjhoSGtBa2VqRk1ZL3I0Y05LMlpN?=
 =?utf-8?B?VHl1UU5qRU9sZE9nbnd5Y2MrRGpIajBTK0tKdnFRTkpxWm9jT1czL0dRbyto?=
 =?utf-8?B?SHFTQ244VHhDWW5KcjBiNmxFdGhvT2c4bzhxNC93UG1RT2tFdVZhUWdJTG9X?=
 =?utf-8?B?T1g2UTlPOXpobGZjMVFwTUZoUWJaZXpSdnhtWHVIK2hwcytSSnQwcysyczZI?=
 =?utf-8?B?YnRFUkF2WVJETTZIeUk1NWtBM2JseU03a0gwZEo5UHlnMFFIaEpHcmVhOHRF?=
 =?utf-8?B?OHdYaitYZjZkYkd4T3dqOWZmYUxvKzVzRUdKeDVSV0daekRwRnJnQ0RPc3c0?=
 =?utf-8?Q?zRnGQPDCu1JzbaxNVDeZFTI+VraaQk=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEpuYk85ZU5Tb1gybGx1UFYxa0x3QWY0aEJRMStlTEJVOUFydWxpQ2hXOC9O?=
 =?utf-8?B?cWRKcEdyNVBGdXhiZ2pDZHhkc2VmUWYxOUtiVEdycmVmek4rK2F6MkR4Zm9h?=
 =?utf-8?B?UnpTRHFPSWZucDBHNk1leVdlMXVGR0liT1FoWFR5Q0pZMmQycmowNHNwOGtz?=
 =?utf-8?B?dG55a3krd1FLaXI5aHJyQ2tYN1FmZnFDNUxLZGNGRVV2aXBRR052My9IbERU?=
 =?utf-8?B?ZWhvTTFvc0tJRmtvNGJhQmt0WkZRSEVrMkdlWStVRGE1Z1paRDZ3TTVXZE5M?=
 =?utf-8?B?cmUrbXlKM2Vpb0JoVW04N3FFS3daeU0rblEwYnFoT3Z6U0M5c1FmVlNId1pQ?=
 =?utf-8?B?dEdVbUlmWFdBbEc0czBQWDNGNmFBei9TRjFGVUZpSkZLQXNodkwwR2RQdTdK?=
 =?utf-8?B?K1ZGREpyUjVWQ3Y1N2hZVklwVGYzajVPTWJ3Q1ZDN3NoSUxlUTV4YmJmVGxp?=
 =?utf-8?B?OGw5azRqak1GM3FxMzR6UHU0eWxZd0lhclI1TGdwV2RpSzZuL1ZTUURNZkZy?=
 =?utf-8?B?azd3UUx6aG9POVRJWm9PTkJqWkhRWXpoOU1HL0pmQk9JZ0YyVUZ2RWJXTitE?=
 =?utf-8?B?QVM0eDNjU3BXOFh3N2JyQzNQcEVCSnhacG1EdzVBR3pmTFYxTzJwcUlWdSto?=
 =?utf-8?B?Tk1TMHhqOElLMlI3ckFxYXBvSWVVbXdRcTZTSHJyYk5tanJLOEFLOVJwUGc3?=
 =?utf-8?B?UlVZb3hhQ3BsaEw3dnNWZ3lUQlBvL1pPUnZ6OWViRXB0Mi9WZ3U2bHIzd0F4?=
 =?utf-8?B?aXNlQWkyVSt0WkpDa09jMzlPMkRXS0ZoZ0pMSG1HRjdkaC9BNnNmRGJOd0JC?=
 =?utf-8?B?TFYvazNLcnRKcEJTWTl2c28zWituVnRjaGhnNEtiTkE2aGpQbk9rTmc5aVJl?=
 =?utf-8?B?R3JiWFNhT2ZjUmhjM1A4R2NNRk5qMXRLY2VDNGZtMDdpRjdTY2E5R2JJS3cr?=
 =?utf-8?B?eFpRVWtjRnk5RlhsaXZKZ0NPa2NyM3lCWmgzY3dUVzNSTVNxdllyZElMQXl3?=
 =?utf-8?B?TG5COGZLZG1HTVV5VzlqY3JsVHlhOWc3MTBDNUorMER4eklMYXk0andUY21O?=
 =?utf-8?B?UUcvZnYzRkFDck5PTEVPdkJiQmkrdmRHcWs5VUhxYjAxclBDNEhENmxzNmJz?=
 =?utf-8?B?QWJUZkYrWWhFUkp2VlFMbi9TWU53bCtZQmlwQ1A2ODU5T3YxMEgrSDZKVXVk?=
 =?utf-8?B?TDZpeEpNRldNVUtEYnhmS0lBbjNqemtma0JiaWRheTFsTzBXanE3S09ESzAy?=
 =?utf-8?B?NXZ6UGdncUZGUGRVeDM5cjJaZ2pCSlM4OTdOVUxIbnBBTEZrQ0M0eHFyNHhy?=
 =?utf-8?B?WHJCV0dSM2JtalZDajROM3l4aUxVd2FacUkraldHY210QjR2dmFYUGxPUTlH?=
 =?utf-8?B?dXpvRyt0OEVUMlk1bWIrK0J4dEJwTnRQWnJiZXk3U2szT1NOcjA5bGxESTZ1?=
 =?utf-8?B?cTlyVlJIbmJCdytGbkJadFdrNFVNcFd6UCsxd052TGZXSHJVZllrYWFDckYw?=
 =?utf-8?B?aUVTblgvcWhzRTd0YmlWVUhDdEZ6MWxqcUs5RURQNGg1UzlJWlY4NFFEczBP?=
 =?utf-8?B?TkVoZHVQVzROV2FacFVQNm1Lb2NnUHNlSEhQWEdQVERpa0p4Tk0wMnRUeGw0?=
 =?utf-8?B?QWRlYVFrRnRiUkptRklLTmluOEp6M3B5UlBMVElDcEhXUEhTa3ZVSXdScTcr?=
 =?utf-8?B?RlYyLzU1Q1VLa2tZMXZ0UmlrNzhneFFDODBTbU5yWi9sV3QvZVBES0xtTm5E?=
 =?utf-8?B?OVB0ZERNNUM0KzM4aWJCWklBZXFaeXRmTkp1NFZXWE4rQXBjdWdaaThkYlUw?=
 =?utf-8?B?U2UyeXA4YkRtSnJ1WVNzTUZhVkFOblpCVnNCUXFUZFNTNUtYc2p1M0t2SGps?=
 =?utf-8?B?RmxBWi9YTmhSZUVhbGZrVWlvVE9wenV1Y2MraVVKaVVtOWY5MklHK1pPcyth?=
 =?utf-8?B?a2NHZ2s4ZExCRFlNcGFyNVI4VG9wZ0h6K2NSdmI3TW1zdUIzS1dMdXQ2WHVC?=
 =?utf-8?B?cEY5YXpTaVN6eFF2ZThxUStGRzVCNGZncERlaGowbjV4VkdUWHVFaDZQVlZz?=
 =?utf-8?B?bG8yMmpSUzlad3RHKzM5VnZQOTVQWFhLMk9jSDhMVFIyUmNNS3BId0ozc2t1?=
 =?utf-8?B?U2haZmNWNGUyek9BUWxacUtIR2VkYjVIamJQVE1tRklQVFJZMExEQ2ZpWTN3?=
 =?utf-8?B?dlE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <555F958B239DE24C96F860892C67C097@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e585c593-c1f7-495a-9d93-08ddd0546e3a
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2025 17:05:20.1023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KxAmt2q/X/eNefy7i8BGc/bNCMan2WxX4X/qm/iVk8xbY9ErndOcm0hzm5nLOv06AvcxRhmQrHcigJtoY/jPXDUuLvT+LsDZBS6Flpe7uwg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7418
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

T24gV2VkLCAyMDI1LTA3LTMwIGF0IDIwOjQ1ICswMDAwLCBzdHVhcnRzdW1tZXJzIHdyb3RlOg0K
PiBGcm9tOiBNYXR0aGV3IEJyb3N0IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gDQo+IERl
Y291cGxlIFRMQiBpbnZhbGlkYXRpb25zIGZyb20gdGhlIEdUIGJ5IHVwZGF0aW5nIHRoZSBUTEIN
Cj4gaW52YWxpZGF0aW9uDQo+IGxheWVyIHRvIGFjY2VwdCBhIGBzdHJ1Y3QgeGVfdGxiX2ludmFs
YCBpbnN0ZWFkIG9mIGEgYHN0cnVjdCB4ZV9ndGAuDQo+IEFsc28sIHJlbmFtZSAqZ3RfdGxiKiB0
byAqdGxiKi4gVGhlIGludGVybmFscyBvZiB0aGUgVExCIGludmFsaWRhdGlvbg0KPiBjb2RlIHN0
aWxsIG9wZXJhdGUgb24gYSBHVCwgYnV0IHRoaXMgaXMgbm93IGhpZGRlbiBmcm9tIHRoZSByZXN0
IG9mDQo+IHRoZQ0KPiBkcml2ZXIuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBNYXR0aGV3IEJyb3N0
IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogU3R1YXJ0IFN1bW1l
cnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJt
L3hlL01ha2VmaWxlwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDQg
Ky0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfZ2d0dC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCB8wqDCoCA0ICstDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0LmPC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCA2ICstDQo+IMKgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbC5owqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA0
MCAtLS0tLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxfam9iLmjCoMKg
wqDCoMKgIHzCoCAzNCAtLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3R5cGVzLmjC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqDCoCAyICstDQo+IMKgZHJpdmVycy9ncHUvZHJt
L3hlL3hlX2d1Y19jdC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDIgKy0N
Cj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbG10dC5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCB8wqAgMTIgKy0NCj4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfbWlncmF0ZS5o
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTAgKy0NCj4gwqBkcml2ZXJzL2dwdS9k
cm0veGUveGVfcHQuY8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoCA2
MyArKysrLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3N2bS5jwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgLQ0KPiDCoC4uLi94ZS97eGVfZ3RfdGxiX2lu
dmFsLmMgPT4geGVfdGxiX2ludmFsLmN9wqAgfCAxNDMgKysrKysrKystLS0tLS0tLQ0KPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV90bGJfaW52YWwuaMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8
wqAgNDEgKysrKysNCj4gwqAuLi5fZ3RfdGxiX2ludmFsX2pvYi5jID0+IHhlX3RsYl9pbnZhbF9q
b2IuY30gfCAxNTQgKysrKysrKysrLS0tLS0tLQ0KPiAtLQ0KPiDCoGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV90bGJfaW52YWxfam9iLmjCoMKgwqDCoMKgwqDCoMKgIHzCoCAzNCArKysrDQo+IMKgLi4u
dGxiX2ludmFsX3R5cGVzLmggPT4geGVfdGxiX2ludmFsX3R5cGVzLmh9IHzCoCAzNSArKy0tDQo+
IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RyYWNlLmjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoCB8wqAgMjQgKy0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmPCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMjYgKy0tDQo+IMKgMTggZmlsZXMg
Y2hhbmdlZCwgMzMxIGluc2VydGlvbnMoKyksIDMwNCBkZWxldGlvbnMoLSkNCj4gwqBkZWxldGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d0X3RsYl9pbnZhbC5oDQo+IMKgZGVs
ZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxfam9iLmgN
Cj4gwqByZW5hbWUgZHJpdmVycy9ncHUvZHJtL3hlL3t4ZV9ndF90bGJfaW52YWwuYyA9PiB4ZV90
bGJfaW52YWwuY30NCj4gKDc5JSkNCj4gwqBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3RsYl9pbnZhbC5oDQo+IMKgcmVuYW1lIGRyaXZlcnMvZ3B1L2RybS94ZS97eGVf
Z3RfdGxiX2ludmFsX2pvYi5jID0+DQo+IHhlX3RsYl9pbnZhbF9qb2IuY30gKDUxJSkNCj4gwqBj
cmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RsYl9pbnZhbF9qb2IuaA0K
PiDCoHJlbmFtZSBkcml2ZXJzL2dwdS9kcm0veGUve3hlX2d0X3RsYl9pbnZhbF90eXBlcy5oID0+
DQo+IHhlX3RsYl9pbnZhbF90eXBlcy5ofSAoNTQlKQ0KPiANCg0KPGN1dD4NCg0KPiDCoH0NCj4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90bGJfaW52YWwuaA0KPiBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV90bGJfaW52YWwuaA0KPiBuZXcgZmlsZSBtb2RlIDEwMDY0NA0KPiBp
bmRleCAwMDAwMDAwMDAwMDAuLjdhZGVlM2Y4YzU1MQ0KPiAtLS0gL2Rldi9udWxsDQo+ICsrKyBi
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV90bGJfaW52YWwuaA0KPiBAQCAtMCwwICsxLDQxIEBADQo+
ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+ICsvKg0KPiArICogQ29weXJp
Z2h0IMKpIDIwMjUgSW50ZWwgQ29ycG9yYXRpb24NCj4gKyAqLw0KPiArDQo+ICsjaWZuZGVmIF9Y
RV9UTEJfSU5WQUxfSF8NCj4gKyNkZWZpbmUgX1hFX1RMQl9JTlZBTF9IXw0KPiArDQo+ICsjaW5j
bHVkZSA8bGludXgvdHlwZXMuaD4NCj4gKw0KPiArI2luY2x1ZGUgInhlX3RsYl9pbnZhbF90eXBl
cy5oIg0KPiArDQo+ICtzdHJ1Y3QgeGVfZ3Q7DQo+ICtzdHJ1Y3QgeGVfZ3VjOw0KPiArc3RydWN0
IHhlX3ZtOw0KPiArc3RydWN0IHhlX3ZtYTsNCg0KTG9va3MgbGlrZSBJIG1pc3NlZCBhIGNvdXBs
ZSBleHRyYSBzdHJ1Y3RzIGhlcmUuLi4gSSdsbCByZW1vdmUgeGVfdm1hDQpoZXJlIGFuZCBkcm1f
c2NoZWRfam9iIGZyb20geGVfdGxiX2ludmFsX2pvYi5oIGJlbG93IGluIHRoZSBuZXh0IHJldg0K
KHNlZSBiZWxvdykuDQoNCj4gKw0KPiAraW50IHhlX2d0X3RsYl9pbnZhbF9pbml0X2Vhcmx5KHN0
cnVjdCB4ZV9ndCAqZ3QpOw0KPiArDQo+ICt2b2lkIHhlX3RsYl9pbnZhbF9yZXNldChzdHJ1Y3Qg
eGVfdGxiX2ludmFsICp0bGJfaW52YWwpOw0KPiAraW50IHhlX3RsYl9pbnZhbF9nZ3R0KHN0cnVj
dCB4ZV90bGJfaW52YWwgKnRsYl9pbnZhbCk7DQo+ICt2b2lkIHhlX3RsYl9pbnZhbF92bShzdHJ1
Y3QgeGVfdGxiX2ludmFsICp0bGJfaW52YWwsIHN0cnVjdCB4ZV92bQ0KPiAqdm0pOw0KPiAraW50
IHhlX3RsYl9pbnZhbF9hbGwoc3RydWN0IHhlX3RsYl9pbnZhbCAqdGxiX2ludmFsLA0KPiArwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgc3RydWN0IHhlX3RsYl9pbnZhbF9m
ZW5jZSAqZmVuY2UpOw0KPiAraW50IHhlX3RsYl9pbnZhbF9yYW5nZShzdHJ1Y3QgeGVfdGxiX2lu
dmFsICp0bGJfaW52YWwsDQo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RydWN0IHhlX3RsYl9pbnZhbF9mZW5jZSAqZmVuY2UsDQo+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdTY0IHN0YXJ0LCB1NjQgZW5kLCB1MzIgYXNp
ZCk7DQo+ICtpbnQgeGVfZ3VjX3RsYl9pbnZhbF9kb25lX2hhbmRsZXIoc3RydWN0IHhlX2d1YyAq
Z3VjLCB1MzIgKm1zZywgdTMyDQo+IGxlbik7DQo+ICsNCj4gK3ZvaWQgeGVfdGxiX2ludmFsX2Zl
bmNlX2luaXQoc3RydWN0IHhlX3RsYl9pbnZhbCAqdGxiX2ludmFsLA0KPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCB4ZV90bGJf
aW52YWxfZmVuY2UgKmZlbmNlLA0KPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJvb2wgc3RhY2spOw0KPiArdm9pZCB4ZV90bGJfaW52YWxf
ZmVuY2Vfc2lnbmFsKHN0cnVjdCB4ZV90bGJfaW52YWxfZmVuY2UgKmZlbmNlKTsNCj4gKw0KPiAr
c3RhdGljIGlubGluZSB2b2lkDQo+ICt4ZV90bGJfaW52YWxfZmVuY2Vfd2FpdChzdHJ1Y3QgeGVf
dGxiX2ludmFsX2ZlbmNlICpmZW5jZSkNCj4gK3sNCj4gK8KgwqDCoMKgwqDCoMKgZG1hX2ZlbmNl
X3dhaXQoJmZlbmNlLT5iYXNlLCBmYWxzZSk7DQo+ICt9DQo+ICsNCj4gKyNlbmRpZsKgLyogX1hF
X1RMQl9JTlZBTF8gKi8NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90
bGJfaW52YWxfam9iLmMNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGxiX2ludmFsX2pvYi5j
DQo+IHNpbWlsYXJpdHkgaW5kZXggNTElDQo+IHJlbmFtZSBmcm9tIGRyaXZlcnMvZ3B1L2RybS94
ZS94ZV9ndF90bGJfaW52YWxfam9iLmMNCj4gcmVuYW1lIHRvIGRyaXZlcnMvZ3B1L2RybS94ZS94
ZV90bGJfaW52YWxfam9iLmMNCj4gaW5kZXggNDFlMGVhOTJlYTVhLi40OTJkZWYwNGE1NTkgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF90bGJfaW52YWxfam9iLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3RsYl9pbnZhbF9qb2IuYw0KPiBAQCAtMywyMSAr
MywyMiBAQA0KPiDCoCAqIENvcHlyaWdodCDCqSAyMDI1IEludGVsIENvcnBvcmF0aW9uDQo+IMKg
ICovDQo+IMKgDQoNCjxjdXQ+DQoNCj4gwqB7DQo+IMKgwqDCoMKgwqDCoMKgwqBpZiAoIUlTX0VS
Ul9PUl9OVUxMKGpvYikpDQo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBrcmVmX3B1
dCgmam9iLT5yZWZjb3VudCwNCj4geGVfZ3RfdGxiX2ludmFsX2pvYl9kZXN0cm95KTsNCj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGtyZWZfcHV0KCZqb2ItPnJlZmNvdW50LCB4ZV90
bGJfaW52YWxfam9iX2Rlc3Ryb3kpOw0KPiDCoH0NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV90bGJfaW52YWxfam9iLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdGxi
X2ludmFsX2pvYi5oDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+IGluZGV4IDAwMDAwMDAwMDAw
MC4uMzJmYjQxNTk5YTE5DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L3hlL3hlX3RsYl9pbnZhbF9qb2IuaA0KPiBAQCAtMCwwICsxLDM0IEBADQo+ICsvKiBTUERYLUxp
Y2Vuc2UtSWRlbnRpZmllcjogTUlUICovDQo+ICsvKg0KPiArICogQ29weXJpZ2h0IMKpIDIwMjUg
SW50ZWwgQ29ycG9yYXRpb24NCj4gKyAqLw0KPiArDQo+ICsjaWZuZGVmIF9YRV9UTEJfSU5WQUxf
Sk9CX0hfDQo+ICsjZGVmaW5lIF9YRV9UTEJfSU5WQUxfSk9CX0hfDQo+ICsNCj4gKyNpbmNsdWRl
IDxsaW51eC90eXBlcy5oPg0KPiArDQo+ICtzdHJ1Y3QgZG1hX2ZlbmNlOw0KPiArc3RydWN0IGRy
bV9zY2hlZF9qb2I7DQoNCkFuZCBoZXJlLg0KDQpPdGhlcndpc2UgdGhlIHBhdGNoIGxvb2tzIGdv
b2QgdG8gbWUuIFdvdWxkIGJlIG5pY2UgdG8gZ2V0IGFub3RoZXIgYWNrDQpzaW5jZSBJJ20gbWFr
aW5nIHNvbWUgbWlub3IgY2hhbmdlcyBoZXJlIGJlZm9yZSBtZXJnaW5nLi4NCg0KUmV2aWV3ZWQt
Ynk6IFN0dWFydCBTdW1tZXJzIDxzdHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQoNClRoYW5rcywN
ClN0dWFydA0KDQo=
