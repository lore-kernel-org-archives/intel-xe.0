Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F16CED242
	for <intel-xe@archiver.kernel.org>; Mon,  7 Oct 2024 21:32:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBDF10E43D;
	Mon,  7 Oct 2024 21:32:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HF113Gxu";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F354C10E43D
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Oct 2024 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728336719; x=1759872719;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=z+70puBQwib/0Ig86MKrG61X9rd2ZXr2kLJJ8NWfg80=;
 b=HF113GxuJ2e6Y6Jz8gXyxjeSyULaX4CnviYZKlz56eW/SJ+K3Pnpjtwa
 KAaSsQBOJxku4qgqsscUJO2FWHiR31N2c6Z/Flhuhwq/md0YGLV47dt1G
 fqkRiqyd1WRxJujMW1ugJBP+UL4D6NtMRghsxTTbTQfgdZ/DbvW/oDWBC
 y6aBKyPpl5aodcQip9lQNQWBJvqKx3OYq0lkn3bdFUhUZ/1Z+k9otzpSp
 nlpv5XMsN14XI0jcI6dklzxiggGHl+KHlqBc2sC+qW1XlBA5P5GOtZvBv
 l8IOqcrzPlrnq8n+hf1Uk5t62b8kCgFI8RIuCbVlap8VtqH+yC/vtv3w+ A==;
X-CSE-ConnectionGUID: qQnV+LByQxemLrwHC3fs6Q==
X-CSE-MsgGUID: 331mnqEzRdq+x639BsK2Aw==
X-IronPort-AV: E=McAfee;i="6700,10204,11218"; a="38894675"
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="38894675"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2024 14:31:59 -0700
X-CSE-ConnectionGUID: XvD47tngQamlxC9Y2zVU1Q==
X-CSE-MsgGUID: kU/vHepMQ92ptg9As/cXoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,184,1725346800"; d="scan'208";a="80571074"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 07 Oct 2024 14:31:58 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 14:31:58 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 7 Oct 2024 14:31:58 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 7 Oct 2024 14:31:58 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 7 Oct 2024 14:31:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tVyBKNJtp42W2JYco5rtRBRGJGFBvno56EwlndtwM33uar5RV8CXTpJXwJ8rD3rx1ICiI+XiXL6YwbXwQegZGky3lqCxUKXR77pl3qN8XklYXPdXgD1uCBM7tM/CC0OvWXulTRZF3WVjcq+yhUzT44HAb00wdbsmdJQElPDo+BuMi4AgOINfVyQCPp3K/UhsERF0VPooVIbsryGjKI57ZD4xGb81z3boYy7XkdkzyDaBfrEq1rBSkMUZJIqJue7T7EPp/HCd0zNyBb29dL7Bcsf8nSZ34OM9ism7R8i6M1qo3FRpv8wbzhBWGiGIni+brY+MtCVtv9WY3NXaTD/AAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z+70puBQwib/0Ig86MKrG61X9rd2ZXr2kLJJ8NWfg80=;
 b=H6aRAY2++d6EK62cb2gODzqGzh+qLXFHOwYGtylw6aVksutWU2//azDyvquoilT7k5y/PxFSc9hZ7FUX4iy0QBYoCeqzR0d1f/U83AlwwkL+yWviomGAF60taWw2XTGIx0rw8KGse7Yr+YkuiVqfZdS1isptF0+3pEp/iTwX5spo6DF+0axkb4pPy+qdAWZNLwTH50QImJgG9+BS0UQWl9zZ993+X/QPCCBiDQkhQK2vBXjlLwfSzbSn3R/71AvNDicpqjKADD6NFWiOhOWZEDVnuIW9MO3qjO3eXMX+1SW1UIRB5FYyay/bPb3b1IVv/81qPv9h9bs3JnkB4iCsMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BN0PR11MB5711.namprd11.prod.outlook.com (2603:10b6:408:167::22)
 by CY8PR11MB6866.namprd11.prod.outlook.com (2603:10b6:930:5e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8026.22; Mon, 7 Oct
 2024 21:31:55 +0000
Received: from BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa]) by BN0PR11MB5711.namprd11.prod.outlook.com
 ([fe80::4137:d45e:2206:50aa%4]) with mapi id 15.20.8026.020; Mon, 7 Oct 2024
 21:31:55 +0000
From: "Taylor, Clinton A" <clinton.a.taylor@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Atwood, Matthew S" <matthew.s.atwood@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH 6/6] drm/xe/xe3lpm: Add new "instance0" steering table
Thread-Topic: [PATCH 6/6] drm/xe/xe3lpm: Add new "instance0" steering table
Thread-Index: AQHbFqmlCe5N/tywsEKQR0fduV79K7J701UA
Date: Mon, 7 Oct 2024 21:31:55 +0000
Message-ID: <f712d9e1c02f56b1fb445baf7ae8dddd3fa6ea95.camel@intel.com>
References: <20241004220550.94308-1-matthew.s.atwood@intel.com>
 <20241004220550.94308-7-matthew.s.atwood@intel.com>
In-Reply-To: <20241004220550.94308-7-matthew.s.atwood@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BN0PR11MB5711:EE_|CY8PR11MB6866:EE_
x-ms-office365-filtering-correlation-id: de89081b-6578-41a1-49a1-08dce7177753
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?TjJ4REhWdDNzd0UrWE5JWEN4c0VubUR4b2NWNTY5UHBVb1lzOGcyYUFoVnNq?=
 =?utf-8?B?b0hWeFlUYlphQ0hIMVB4dmZsZnc1WDBYdkRtcWxNS1lpemt3RFoySm5waWto?=
 =?utf-8?B?N2s2QlRSUDRLajU0dzlkVnhiUnpPeS9kMDlhZEo5NFRvczk1R3RCeE0yc1RM?=
 =?utf-8?B?V2wyeFZPaU11YkFrR3pwNHUwV29xc2h1VUlZTms3OVhhK0FZN3ZTQVRmcGdF?=
 =?utf-8?B?Rzhac2NGcVFqbU4wTlVXT3g0L0JUMkl3dWVUeHZvdk5DK1J6V2U5STZ4Q0ti?=
 =?utf-8?B?bHNUQmdBbkRoK1JyK0VLWXdaNDRDOUQxb1kxM25vNk9kTVRxSGlmUmw0OU04?=
 =?utf-8?B?Z0JYUEY0NklqUzArY0pJMmJkMlMrdkpyQkV0YmlXUnVsUXY2L2lEQXhFTEdO?=
 =?utf-8?B?OGtFelFBa3Raam5ROTJ4RkJMNUVaSjRSNE5RRCtXc21zL3Q2a0JZWXU4bEFz?=
 =?utf-8?B?cHN0SU9LTHlzZ0pVM0VFc05Ua3dRVWJOT0U0N1A5dGtXZkd4MFZ1ZUt6U2VH?=
 =?utf-8?B?Y2lOeDl3Zm54cklwUW02UENyMzlRQ09mKy9vRWRnbis2WmlxZ2FESXNXSDMv?=
 =?utf-8?B?OWc0anpRcVBKVURJbTBWTlYwZnBYUGVrUzNMMHNCUjBSSWZPaDhTNUdueHNW?=
 =?utf-8?B?bk1uZGRPOU4xMi9CR0Y5bXc5WG5rRHBFcXZYT3pLaFhhUG1uejdVQ2Zhamlt?=
 =?utf-8?B?T0NzbWlTNWhKbGZWV3BRdmRibFV2V0tRc01GQXUvV0ZNaVEyeWNHRW1UdjBT?=
 =?utf-8?B?ZkgwajNqOFV3RElzUVB0L1E4ZW9uUW5ERnZqZzd5QlhiMllUL1g4Y2ozN2c1?=
 =?utf-8?B?cnpVZ1pYSk1mNWg3VlU2SFlxeFhKRGt6QlNUcTJCOWV4S3hHZXJyVFZhVlY2?=
 =?utf-8?B?U2hNUjgvZC9ldit0SWxpaU11UCtxemJsUXdKTTlVUDAyV1FBK0tiZmJWM1pO?=
 =?utf-8?B?ZHovbUVmdTBXK3lGQkVNV2d4TUNHcUR1ZXc3SFJoMVlKOE9yYnNvRDJlQW1Q?=
 =?utf-8?B?cmpEckNUb09tZ2hYeGtGNUtwUTRyQlR4TnpaNFRIb1ZtYjBmeFZrbGNRK0NI?=
 =?utf-8?B?K0pac3RjR2FiTDV1T0RnMGJ5NDNSZHZBMTZMWEtCY2VqSHJJbFhVcW14dDJu?=
 =?utf-8?B?QmJ6MHpBdW11MWorbldXaVJ4ZXNUUjBJcmZDczlxNWlDR2dQVzNxSUlNNlor?=
 =?utf-8?B?dldNUzlSVGhyNG1IclRZSkRiYkZFbTZvclpDQ1Z0TnAwUGI1QkVOeXZ6Q2xX?=
 =?utf-8?B?RXRmbVludlZNRkhQdU9RRTlYUmR6STJtOFYrODJWQWxob3FSVzZDZHpGd2tk?=
 =?utf-8?B?dUFrNkpEV1NaZjFJUnRXdjJzZjhpQ2R1STRFN3RZNG9Gc1BoaWx0S0NmM25P?=
 =?utf-8?B?VCtwYVVqTEk0bmprd2lETDNqcDNUZWdQM2ljbThTaUNWVVYxNnh1M0FyYlpZ?=
 =?utf-8?B?MG9PdUxSWDY1RGRXM1dxNWVzV2Zwc01qaEVHTjVGdGl1Uk9NME5EWlhEK0ph?=
 =?utf-8?B?QUFIRitnNGJkQy9QYWdDMnFJUmg0bHV1TWRsK3Y4Rk1ySjNVKzVyQmdNY1Ew?=
 =?utf-8?B?VElyRCt4Y3lOY29sTFN0VXRyamNONWVDNStia2Rpc3Fjc29xWno5Q25BcnZY?=
 =?utf-8?B?VExhdlp2cWxQaFhnTDF5eGJ0a1lpZ1FZeEJodWl0UE9qL2JzYS9ROFpqUHV1?=
 =?utf-8?B?eDZPUDN2Y2xNSVBKenR1ekhwVU9GMzhrSVFBL2hVUTNCRXpPNWJNZnVQT0hm?=
 =?utf-8?B?aC9ka2E4d2ZBbmQ4MDNoSjQzNnMrdkVSYjRDTlNGRDVXcElGUGZFblFDTGYz?=
 =?utf-8?B?ekFHRVY4dy9iZEc3dVdmQT09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR11MB5711.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Z1prRlNaQjdqSXZKWmx6TDVqak9DcUJ0RmduZ3I4TStrUlJDSDJwVGVKRWV3?=
 =?utf-8?B?TkZYV1JuRHZUb2VmeUVQb3ZqWGQxN2ZkUHZMTnZ4NEcrK1dCOTIwZ2F5QXNt?=
 =?utf-8?B?VFUrd3llOVRZNTVzN0Fuc2wxVlVGNlRKY1BiZDFtUXZoRUdWTFBSV3RmbE85?=
 =?utf-8?B?dWZvalFXa2gyU1ZSZEUvRGRyZG8vclpwWFhoT2JpdTVUcWVtWHhnV0luZ2NB?=
 =?utf-8?B?b2Z6dGJYRVRhaDRFNXdnQjJVZUhoMFhhSy9qaFQ5VDR5c0c3ZnZUTGRlQVoy?=
 =?utf-8?B?ZFE1Vlord0R1YVordUVtMmI3RFRXWFpjOElaV0Evdk5Cc3A3QzVXOG15bHpq?=
 =?utf-8?B?MytNMHJ4VWJ3dzFyUjZyRVV6L1FZU0RCN0FiVUFZZzNCTE5KVnB2dlYzTm1v?=
 =?utf-8?B?RjlRRlJ2N0FsYXgvUCtQMkxnaEhsNG0wWTdKMnNEYmNGVkExRDlEZGx1NURr?=
 =?utf-8?B?R1d6RXRCVGJpWkJxTzg5S1lxWkI4RGxGRDNJN0RxTVNWT0pNV3Bhejdxemox?=
 =?utf-8?B?YU40UUtJYVdrS01OSkRzRGhZY3JaYm9KT1VzMnFLdzJFejdVR0R4S2lHS2NH?=
 =?utf-8?B?eS9zd1NKdEdUOWdxSHRqM2c4alBXaFl1VlJTaGthMW9wRGVxNFBIcGpyVVdq?=
 =?utf-8?B?dndScnhJVHVnM1JydlIvUnFkeURzQlpKamxsZllJMGN4M29jR05tamw5VDNo?=
 =?utf-8?B?MG1pUnBiRDd0eC9yOEszQk9zY2UySFgvZ2FVbGJJTGk4Nm43KzlweExuaml1?=
 =?utf-8?B?YzFJOWI3VDcwV21DalBpVTZBVHk1M0RzSUIrcllMVm1WNEQvV2tDVThVTWJI?=
 =?utf-8?B?bDl3c2xKUG12Mkd1c0J3YUEvMzN6WWkxUzZ1YXloc3J1TjMvaVhFL2gvTWtE?=
 =?utf-8?B?UmE4cjFIS2NlOWs1dTNWZ082c3dCZkhrQ2RBWEt5N0I0dFd6U0JoN09tM1pP?=
 =?utf-8?B?VkU5V2RMRTA4MFZCMTR3TDc0cm8vd2RtTXFmdkIybHpxemJpZFdlVkhkY0F4?=
 =?utf-8?B?SUhlSmdVYWNxVWJxM0srTkVBTEhOLzIvYnozYkdveGhrM2I0bzM0aUZ4bGp2?=
 =?utf-8?B?UGxBbG9maWh6Y25vaUd0Tlo3aXhWQ2pmWE5uenZUNW40aVFPSkYwaTRGNzRI?=
 =?utf-8?B?cU1qNFR4azhVMGFkNm95LzRuTWJXVURyNlBKcHVMNVRCdkV0RWVmZ1dENTFU?=
 =?utf-8?B?cHkyY0l6dTdYeEVLOUROdERZZk5pK2VnYWduV1Y2RmRuNzh5cHdIK0NPbmRi?=
 =?utf-8?B?RDhnTFFEVHJVbVhYY0J0NkkrRVNtZGROcXJKOVJVUk4wb0JqblJPVkc4bzhi?=
 =?utf-8?B?VUdFelJ4cEVCRzBOeks4cHBqVXlqWUVseHJocmUzU1g0LzBZODNqYTNVSFZG?=
 =?utf-8?B?SnBEQmR1WlBzdW1wcGFLUmtXdDIwUzE1dGY1QkNIa2JkaTlLV3Q0cVFYQlpr?=
 =?utf-8?B?ZzJGMWdlSjBUVXhmOG8rVlAwdmt5SUxSK3Z4WGlzRDBNOUFob3VacWIwT3U0?=
 =?utf-8?B?SlFnYW5Qbnl3ZnJ2SUM1aW9La21HMWx2a01WZjg1YUlFNG5DODVKVnloQmMv?=
 =?utf-8?B?TXMyeCsrRXBQNmlDSVpSd25XdGFWUTU1MzA3VFF4WHdWYmlRMzhWQ0ZXZGtl?=
 =?utf-8?B?SWJxSjhsZmVjSG9lWU5lVUlTWFFWVUpRbTVOaXBSU3hGQjQwczkzbVh1Mlh1?=
 =?utf-8?B?NEpRZDV0RkZtbk0vaTdSU2tlZUlabDVUTEdUbm54elZBaGtVY0VEWVVNNXlS?=
 =?utf-8?B?dlVsV014UDN5blUwRUEyZ1dwVHprMmo4SmZBNFY1ZFJqYU1CUWd1UXR5bE5i?=
 =?utf-8?B?Vi9zSFFVcktyU2pDVGRuTVFXM3daSGg1ZklSQjVqaDkzaFlqNU1hYnVIUmN5?=
 =?utf-8?B?RXJldUFIK1R4UENwd28wUFdwcWIzM0NVVFNtR095YS9JQktOc3JVY2hkejhi?=
 =?utf-8?B?S2M4THp4NXMxTjE3TnpzT2E3YU5iUjNNbS8rV0JGSnFJTWFVZk1LcHAzTHFH?=
 =?utf-8?B?V0VlNkIvMFpqbnFiRUpDMDlJT2Y0c0pzektEYVhJWUdrR3NQdjlJeGVCcEU4?=
 =?utf-8?B?QmFvMExraFAyTHJVS25US1FIWVNGRVZCeG5kWDNKU1NuS3ZSM2RKSHZTWU1r?=
 =?utf-8?B?dTQ0QU5URmJGTmdmbDRsZzl6Ym02MDFHOHZNN2FOVnczcXRiZnkrS0hMbStw?=
 =?utf-8?B?YkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D86D9C16FCAAEE469B71B20C5B670CE2@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BN0PR11MB5711.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de89081b-6578-41a1-49a1-08dce7177753
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2024 21:31:55.1747 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 07mKOGU2uAYLPNfeoF+R8AI6mqejhAHV1un8cbVeldR3IbVZUKF24PE/pryTm465ZgMs6/yrYurj/blbrXzcVFCJiNoFvaYpDrVf2EPVMAY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6866
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

ClJldmlld2VkLWJ5OiBDbGludCBUYXlsb3IgPENsaW50b24uQS5UYXlsb3JAaW50ZWwuY29tPgoK
LUNsaW50CgpPbiBGcmksIDIwMjQtMTAtMDQgYXQgMTU6MDUgLTA3MDAsIE1hdHQgQXR3b29kIHdy
b3RlOgo+IEZyb206IE1hdHQgUm9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+Cj4gCj4g
TUNSIHN0ZWVyaW5nIG9uIFhlMyBtZWRpYSBJUCBpcyBhbG1vc3QgdGhlIHNhbWUgYXMgaXQgd2Fz
IG9uIFhlMiwKPiBleGNlcHQKPiBmb3Igb25lIG5ldyByYW5nZSAoMHgzOEQwRDAgLSAweDM4RDBG
Rikgd2hpY2ggaGFzIGNoYW5nZWQgdG8gYW4gTUNSCj4gIk1FRElBSU5GIiByYW5nZSBvbiBYZTMu
wqAgU2luY2Ugd2UgY2FuIGFsd2F5cyBzdGVlciB0byB0byBncnBpZCAvCj4gaW5zdGFuY2VpZCAw
IGZvciBNRURJQUlORiByYW5nZXMsIGRlZmluZSBhIG5ldyAiSU5TVEFOQ0UwIiBzdGVlcmluZwo+
IHRhYmxlIGZvciBYZTMgbWVkaWEuwqAgWGUzIGNhbiBjb250aW51ZSB0byB1c2UgdGhlIHNhbWUg
T0FERFJNL0dQTVhNVAo+IHRhYmxlIGFzIFhlMi4KPiAKPiBCc3BlYzogNzQyOTgKPiBTaWduZWQt
b2ZmLWJ5OiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPgo+IFNpZ25lZC1v
ZmYtYnk6IE1hdHQgQXR3b29kIDxtYXR0aGV3LnMuYXR3b29kQGludGVsLmNvbT4KPiAtLS0KPiDC
oGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuYyB8IDE3ICsrKysrKysrKysrKysrKystCj4g
wqAxIGZpbGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAo+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3RfbWNyLmMKPiBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9ndF9tY3IuYwo+IGluZGV4IDRjMDc2NzQwMzg4MS4uMmYyZmI4NGI0ZTU4IDEw
MDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuYwo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9ndF9tY3IuYwo+IEBAIC0yMzcsNiArMjM3LDE4IEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgeGVfbW1pb19yYW5nZQo+IHhlMmxwbV9pbnN0YW5jZTBfc3RlZXJpbmdfdGFi
bGVbXSA9IHsKPiDCoMKgwqDCoMKgwqDCoMKge30sCj4gwqB9Owo+IMKgCj4gK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgeGVfbW1pb19yYW5nZSB4ZTNscG1faW5zdGFuY2UwX3N0ZWVyaW5nX3RhYmxlW10K
PiA9IHsKPiArwqDCoMKgwqDCoMKgwqB7IDB4Mzg0MDAwLCAweDM4NDdERiB9LMKgwqDCoMKgwqDC
oMKgwqAgLyogR0FNLCByc3ZkLCBHQU0gKi8KPiArwqDCoMKgwqDCoMKgwqB7IDB4Mzg0OTAwLCAw
eDM4NEFGRiB9LMKgwqDCoMKgwqDCoMKgwqAgLyogR0FNICovCj4gK8KgwqDCoMKgwqDCoMKgeyAw
eDM4OTU2MCwgMHgzODk1RkYgfSzCoMKgwqDCoMKgwqDCoMKgIC8qIE1FRElBSU5GICovCj4gK8Kg
wqDCoMKgwqDCoMKgeyAweDM4QjYwMCwgMHgzOEI4RkYgfSzCoMKgwqDCoMKgwqDCoMKgIC8qIEwz
QkFOSyAqLwo+ICvCoMKgwqDCoMKgwqDCoHsgMHgzOEM4MDAsIDB4MzhEMDdGIH0swqDCoMKgwqDC
oMKgwqDCoCAvKiBHQU0sIE1FRElBSU5GICovCj4gK8KgwqDCoMKgwqDCoMKgeyAweDM4RDBEMCwg
MHgzOEQwRkYgfSzCoMKgwqDCoMKgwqDCoMKgwqAvKiBNRURJQUlORiAqLwo+ICvCoMKgwqDCoMKg
wqDCoHsgMHgzOEYwMDAsIDB4MzhGMEZGIH0swqDCoMKgwqDCoMKgwqDCoCAvKiBHQU0gKi8KPiAr
wqDCoMKgwqDCoMKgwqB7IDB4MzkzQzAwLCAweDM5M0M3RiB9LMKgwqDCoMKgwqDCoMKgwqAgLyog
TUVESUFJTkYgKi8KPiArwqDCoMKgwqDCoMKgwqB7fSwKPiArfTsKPiArCj4gwqBzdGF0aWMgdm9p
ZCBpbml0X3N0ZWVyaW5nX2wzYmFuayhzdHJ1Y3QgeGVfZ3QgKmd0KQo+IMKgewo+IMKgwqDCoMKg
wqDCoMKgwqBzdHJ1Y3QgeGVfbW1pbyAqbW1pbyA9ICZndC0+bW1pbzsKPiBAQCAtNDQxLDcgKzQ1
MywxMCBAQCB2b2lkIHhlX2d0X21jcl9pbml0KHN0cnVjdCB4ZV9ndCAqZ3QpCj4gwqDCoMKgwqDC
oMKgwqDCoGlmIChndC0+aW5mby50eXBlID09IFhFX0dUX1RZUEVfTUVESUEpIHsKPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9XQVJOX09OKCZ4ZS0+ZHJtLCBNRURJQV9WRVIo
eGUpIDwgMTMpOwo+IMKgCj4gLcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGlmIChNRURJ
QV9WRVJ4MTAwKHhlKSA+PSAxMzAxKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oGlmIChNRURJQV9WRVIoeGUpID49IDMwKSB7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBndC0+c3RlZXJpbmdbT0FERFJNXS5yYW5nZXMgPQo+IHhlMmxw
bV9ncG14bXRfc3RlZXJpbmdfdGFibGU7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqBndC0+c3RlZXJpbmdbSU5TVEFOQ0UwXS5yYW5nZXMgPQo+IHhlM2xw
bV9pbnN0YW5jZTBfc3RlZXJpbmdfdGFibGU7Cj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoH0gZWxzZSBpZiAoTUVESUFfVkVSeDEwMCh4ZSkgPj0gMTMwMSkgewo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGd0LT5zdGVlcmluZ1tPQUREUk1d
LnJhbmdlcyA9Cj4geGUybHBtX2dwbXhtdF9zdGVlcmluZ190YWJsZTsKPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBndC0+c3RlZXJpbmdbSU5TVEFOQ0Uw
XS5yYW5nZXMgPQo+IHhlMmxwbV9pbnN0YW5jZTBfc3RlZXJpbmdfdGFibGU7Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9IGVsc2UgewoK
