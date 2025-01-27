Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 177BDC02188
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 18:28:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB02810E0A0;
	Mon, 27 Jan 2025 18:28:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C8JthWhj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D26D10E0A0
 for <intel-xe@lists.freedesktop.org>; Mon, 27 Jan 2025 18:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738002510; x=1769538510;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Bd5+hv3vS/pMWzC1XU7Ua1osiyjgVnax2DgPP+AzWE8=;
 b=C8JthWhjZ0whNf81/lmkWH4G7ydZUiCYGQvIFhhBc/mOYj6aiAc/KYEG
 7tn8xbtmOThYyNv7Co3fVGwbxdpEQRrkfkMSVCL3XRK53hYobV52ldlbj
 xsEHey7WUzoIcVUplgvRjtyFWyeJb794YM0bZXvWXU06RdPaFpP9ioHI4
 nkp5WST1PUPwSykCalfWKGek1uLTvhVg7EbVZMMPu17Id42KDuK5k8eAi
 CNz/afzr1/tAPgLZvpryrggdDjiS45CqF1JA17TFKpc6ekJmJMkIRDQVM
 jQS65sGoHoeQjwdBBp0Q2fjYSy58bnW6q1xLcEKBXdlu7xkbhktIhTA46 w==;
X-CSE-ConnectionGUID: 1TWrAGRFSROIGqEufg7N4w==
X-CSE-MsgGUID: Q46I3+JrRr6OTLOgLI61dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="55903999"
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="55903999"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jan 2025 10:28:29 -0800
X-CSE-ConnectionGUID: qjLHBjZYRz+L7j4y0mq3uw==
X-CSE-MsgGUID: pFxf8pLjRBeEQd2EFNJ7gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,239,1732608000"; d="scan'208";a="108322017"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orviesa009.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 Jan 2025 10:28:28 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 27 Jan 2025 10:28:27 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 27 Jan 2025 10:28:27 -0800
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.47) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 27 Jan 2025 10:28:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YzR7ml1577WpJ3Uo4FbrzGZuhPQra5zZyBPp1ssTsu3q275o+DVBBsY5NanF0iAzHEHM/nHpyFp5VlbSI00XUaD+4ktKq0YbaoLd1xWc68OIsfG3v5vXBKu5E8BN8VYvllD9ae7/jGb56XupO2Hmzz1arwNodXZW9stiTb2SvECAuRpw9y+gVB5WvMXNdLu0W8Q1X75rWZVLZVSLXAb6sSH4xmzUDrOVdpwvcI2kAqdCZJuzP+Ba+M0bMuggZDXt9/YD3RDvdQWIgjrX/Z7hv2rvJdrgfRLDeL83io++ICGat6uBPWjTqRCz3GGiG8OlYPibzLQDKE7uX2R04+hziA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bd5+hv3vS/pMWzC1XU7Ua1osiyjgVnax2DgPP+AzWE8=;
 b=I2UpRBAaEWjlPBqa5NQzXcB7Fv4MEmD7FK/4AS2+NJiBs+HFrRM7sgffVkCpLjFFV+vh16AX/jHnCdjWwtBztOTWm4B6TaPOuNqpACeCeROPACI1xReXqjo1krKg9w7VmIVK+GzqrBLMWzIc7w7C04FO3Q7Z+KymzWPYxssRXhIjYWBiaXJANDd8WrRXgT5zrTKrZOYsLPVWhNAeYug0JYarR/ZnOraSMZEyWqBSAI9eD4yZSqyWckOrSuYr+FefcFjHsfZbizI7sG/KE6A/pQ11Z7rEj5+Rj8ndes6YMf04ktM1RDK/LbthSJBDktZr/xEKtKw6daeARC9QKVEhBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 MN2PR11MB4614.namprd11.prod.outlook.com (2603:10b6:208:268::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Mon, 27 Jan
 2025 18:28:24 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 18:28:24 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
CC: "Brost, Matthew" <matthew.brost@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH] drm/xe/pf: Move VFs reprovisioning to worker
Thread-Topic: [PATCH] drm/xe/pf: Move VFs reprovisioning to worker
Thread-Index: AQHbb3Pae3KYgy2ZIUmJI8VPwyjPK7Mq3OmAgAAQW4CAAAZQgA==
Date: Mon, 27 Jan 2025 18:28:24 +0000
Message-ID: <5378e4e0677584aa79d4505895226b8913a6e1ff.camel@intel.com>
References: <20250125215505.720-1-michal.wajdeczko@intel.com>
 <838c976cbff003ce7b85d3dbf127f26d0d3e0979.camel@intel.com>
 <27108b00-20ad-4064-a79d-622e520ec4a4@intel.com>
In-Reply-To: <27108b00-20ad-4064-a79d-622e520ec4a4@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|MN2PR11MB4614:EE_
x-ms-office365-filtering-correlation-id: eb715c58-21a4-4f3c-a17f-08dd3f0062a7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZStWVXlwSnk1ZkZFZnNFdytReEZKNWtPZ1Juc0JUMTBpWHh2blZrLzJZNXU4?=
 =?utf-8?B?cCtMRitINWlYRXRHSFNybTVJcnJJVVY2eUU3Q25haDBMZmVYbytJLzFscm9L?=
 =?utf-8?B?TE5UeU1DYjYxRTVkWjVBamovWi8zYVNYOFExd1RUTkhlcGdvbk02WVU5NnVG?=
 =?utf-8?B?bVVsbjl0d3dIT1ZvY3oreGt5bEdCd0tQOTRHOHFNcnJneXo5dXl1SzB4c2dK?=
 =?utf-8?B?ZWNJRDNZMnprZWFXTlUzaDl0cjk0Y05rNkNhSFlJYXgwTFpNWFdnL0c4eWRi?=
 =?utf-8?B?ZmJsSFhwOXQwNVpjeEhGSFFRNDJtN0pMbVJqaG80Vnl5MVdPbDVPR3d3N3dh?=
 =?utf-8?B?TVExSEg1THhQNjVhU0orcHR0N1lBMEhBSm5CMzZqMDh5NmgwZGdvQWJUYWE0?=
 =?utf-8?B?NHRPWHRDQmNjU3RqV2tVSi9LdmRpNXBWYzhGcHhjRzhSWUFzNHEzU2Z5VjRO?=
 =?utf-8?B?THJIUzZ1WGMvMk9kR3RDdTkrZ3RDUk5RNnh4cVhKV3hJRVY3RDdCbDZ4eFIz?=
 =?utf-8?B?VWZGTG5nTWlGU2ZjNUZYR2twSkt2WnRzYmlxd2FkWWxnWEduNFZoV1IrejN2?=
 =?utf-8?B?NHcrVm5ZTUZjdkNJOTN6VmVEZXJ0djdiN2RVK3JkYjlYc2d6RnhCRDNvTlov?=
 =?utf-8?B?alJnYVVJMHBkcjJmUTVDYXMyT0ZJaGVtWmM1U3lDQ1BXRW8ybWlhT2hPTUlY?=
 =?utf-8?B?a3AzNmIxdnMvV2hQMXdwNlVUbStXUmlqNXdzRzRlb1lHZThWQmxsbUdxRkx4?=
 =?utf-8?B?cEJKSmp2SzFLbFBjSXZhRlkvUm55ZFNXVGx4ajdINDBuaU9tRkZiUzlBaGR3?=
 =?utf-8?B?RjQwa3pRN2dJeU12RTZqQ2RraXl3V1M5NWNsTm9uUG53UmxCZ3lyRHA4M21M?=
 =?utf-8?B?dnhyckZUZGppZkd2Q1FnNlVFQTg1TzRVL1ZtMzYzdEtwdThaTFlsTkNqV0wz?=
 =?utf-8?B?OWthWXBFdGI2VCtNTisrcVl2NGFOTmFnZ2ljTDZWcFZUOGdIQ2laOWMwTHBu?=
 =?utf-8?B?aEVTVXhiazk2OW5SZUl3dmRJcHVoNlhmYUtQZ01JQ1VHd1VmNE5XM0VuUGor?=
 =?utf-8?B?QWtpa0h5WGRIOUh1N3lYU3lYclpRbHNnL0lWV1Era2Ivc1k1VlkzR3BuMk1a?=
 =?utf-8?B?N0tucCthdFRTRStCZmE1QmJEdXpKbnJpU2hSWS9uR1NyampwdW9QeDBTSTZE?=
 =?utf-8?B?bnB2MkdObklXYnp5TkJCWVc5ZGJnaWxtaGdMUXZweG9YRnlSZlN1OHhESjZ6?=
 =?utf-8?B?L1V1NlpNU0w3cm1HV1IzMmk2Sk9ENWtFV0xxM2k5djgyZmtTdE9RWEpiaTB1?=
 =?utf-8?B?UmJKLzZNaFUwVmRITzJ5YWtNWit6OHdzbzdmV1hsMHcxWUR1SXFNeXdxSHFC?=
 =?utf-8?B?aXFVTHFWRWd4M1JZWTFhb2pLK3lOVVBjZUVRd0ZwUmtDbzVjMkpKQkRPT2Ez?=
 =?utf-8?B?ZnJnNGtzWEtqbE1BTnhiK3ZIdWFSaXZ4MmZWb3FuendrSmVLV3lYQ1F0S3Bt?=
 =?utf-8?B?WU9McThjVUs5MXlUU3Y4NUNBVWhjS0hTNi93a2Y5YTY2cm9QazNVWUhReWlT?=
 =?utf-8?B?OW50Wnk1RXBkUlIyeTFtZE54SDh5UzBOUzdrZ0E3RHMxSzNDL1hrYUNkQ1hT?=
 =?utf-8?B?VGEvNVl6UDJBT285N2pTVDR1WWJOeXlWQ0Y4ZkMvUm55cGcwQjRLOG1YU2ZJ?=
 =?utf-8?B?TFVvU3lnMS96OHVaTk1ITHlpNlZQc1U3L2NiMG4wNSsvRktjejlmdzBNb2Vz?=
 =?utf-8?B?c2F6bFBMd0xMaWNaamluNmlIUlNIZGlmNDZpWkJOUU5WV2k1OWRlVWxkNURU?=
 =?utf-8?B?YWNidEcvaXJGNWhLNHBSZTNqLzFISTlJcUdnNk10bmRrRGhsd0I2WllkK0JQ?=
 =?utf-8?B?VTh0bTdKaWVDanQ0TDU3d0N5TU10ZllXRWMyVXFRckFjUDhCUkloUlFBa29r?=
 =?utf-8?Q?exJ58pB1bgsh6PzJGXujOIFF/2Kodr9g?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?L001Q1Nicnp4UUQ5QWd0VFdJYUl6dGNHNU5SVEF0aHhKOXNkMXZDRWhTcmlC?=
 =?utf-8?B?UFU3RzB4SHN2Qm04SVFrS1hscE5qNUpvaUJkTVUzWE5haThYWFkralFwOFBp?=
 =?utf-8?B?RkxmRWdRd3VGbENvLzJUV2dKM3E5Nmg2YkQ2WHNjZkU2RmhBb0tISE5Cckpw?=
 =?utf-8?B?RkY0ZlR6cG5OQ3BJa21rZU1TUVNuaUFERG9FZE16L0hNcXJ6bkYyZC9lenRK?=
 =?utf-8?B?NXFqMlp1L1NLdWI5bVpqWFBTNm5RQ2lrWEZCNk5HbWh5Rlp1MDFZck9nZ0VE?=
 =?utf-8?B?WTVJT3psckFEa09mN0ljWmI3VnZWUDBYRnNkNUJQbHlMUVdlQ0VteVNjT0ov?=
 =?utf-8?B?bWRrc0JrM2FvK2RWTEoxWjNaNktGazM5Qys5b092OEZBZ3l6MW5ndDdEQUJu?=
 =?utf-8?B?VjNEbGlLcDFZUVk5b25MdmZIR1Y2bHVJTGgwUmVoZDgvMFFBSWtUU0lFelVZ?=
 =?utf-8?B?RVhucUxpRGtOQk1NOG1DYVBsVnA3L3NBeEdGcXE4WVBRRzhKVGZ0eVp5a3Jh?=
 =?utf-8?B?dVJOb3ZWb3g5enE0SzVpb0w3TUsyTWlLaW9rb1ROV2xqNmczUUE0M3AxU00w?=
 =?utf-8?B?RmNsSVYrTnhPTVNiV044TmdVdFJTQzVNUXBtODQ4MVlGam9sZUhKMHRvazU0?=
 =?utf-8?B?R2dJcVp0YTVnbmVTM0hQa0NWdXY0SktEWWUwZm51VmR1UUhoK0J2YmRsWnA2?=
 =?utf-8?B?YUlUeHVHeGNzckNBSXhrSDAxQnpUWkdJODl2NEpzdEtQS1JCN2pPSy9jRVNn?=
 =?utf-8?B?OG1uM1pEQ1dUQkcrWGRoRXZMWExRTEc0ZlVXc25ZZ1VEQXhDdFUxUjhOUm9S?=
 =?utf-8?B?cmlwaDJYMmNFa1JMWE1wYlZwUHZMejI4ZDNYSFYrYlgvK3U4VVpuMzBLaDhR?=
 =?utf-8?B?T0QzN0I5SmpPaDViWHNMS0l2Q1QybGFLWXhIaEY4MDVFR3ZxSHNJazFHUFdt?=
 =?utf-8?B?UjEyUjI2a0VybmJsalluSkRETGZaODBRRVdCanp3clZsbU9HQXIrTFhFYjQ5?=
 =?utf-8?B?ZFlaaWVlallVVDhqY3d6QjdjTmlOamxXelk1ZmpGN3pFeVNuZTc1UEZXdmN6?=
 =?utf-8?B?ZWhLeWZZSjByWUlINThhcDAwTkRXK1JlNTFjOWxxUGxtb21LcWVUWDQ5U3Fo?=
 =?utf-8?B?dkREQ2E4Vm5jVjlnakZkYlI2R29WbCttRnUyZzFJbzBYM0NKZkJGWHRxVlJ5?=
 =?utf-8?B?MzNOTTczdDMwZ2JSOUlUOHJpUE5ka0NuOXkydmhzSGtTUDBHUHJabGc4UXd0?=
 =?utf-8?B?L2NEU1NnV1M0SmRsYlVtQWlQVTFQbTk1bDJMeHZoaHNvNDdHNnBDNTNPMHha?=
 =?utf-8?B?NiswS3NLcHFzL3RnTG5wUlV4Yk5SdDl6bXFrZnR4OUNQR2lqOVowQW1XYytv?=
 =?utf-8?B?K3RmUU1EN1UvUjVXWGhZSThhTjZxN1RZUlVVRjQ4VlBtNEVrbC8yQjBEVXhp?=
 =?utf-8?B?d2kvSm5uUERSM0ZpYkFPKzV3UlFIN0lmb2NNNGgydWx5RmhoSmNtYytZLzVa?=
 =?utf-8?B?TG9GSFhYV2xrYlh1Qmk0VTgwTlFXdHhwbGt0ZGs5R0hDT2s0V2g3OUc4ZzJV?=
 =?utf-8?B?dFZjRnlQNEZWMGJtdE5YZ0p2aGZRd3dHL2V3ZG4vOHkxVVJaOG9SWmhKZS9Q?=
 =?utf-8?B?eldGWDJPelkyVFhmb0lHV0ZEM0NUcjBhOXVlNDhsWXpwQzhEZ2lQMUZMWVZD?=
 =?utf-8?B?akNlbG0rQ3MwTTUzMnNydGcxMlhmTUlUMkw5RzcyNjkwQWEyWktkaFpWV1FQ?=
 =?utf-8?B?SG43Z2lXb20zcVR2STUwUUtQczhxcUdZZGU5SmVEUEdZekZuN0xMaUhJVDY1?=
 =?utf-8?B?Y0huTU1uWFVzanhtR1NCSXptbEZIaGM4SnA5SndsUUM3ZjRQVXB2dVZvL1Zu?=
 =?utf-8?B?MkgwZUZDQlhkYzdSNGdtTGhidTA5ZUR5cWxRdHVvTFQzNG1MS0JkejFjYTZp?=
 =?utf-8?B?QW1YVnZjK1A4aFg3UlVSMHdxT2JtT1NyMFR0ZVNWSThQSzVJdnNCOXBXblJL?=
 =?utf-8?B?SmN6eVRXZjJFVVNtYjJVdXR2YjBPSVZFWGRHdm4xTU9TUDJLOXM5cWh1RlBa?=
 =?utf-8?B?VnVUaDhnQm45UGR0VVRDajk1clcyNWJPQ0J6OGFTbGhJSkpVUnZEMVZXYzZB?=
 =?utf-8?B?RHE2NzBaSThqRXEvL1JIRUlPZm1QbUhZN0xJZzNYWnhUZ09GaEp5dWxsU3dz?=
 =?utf-8?B?Tnc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C69D266C9434D040BAAB99339F25B1EC@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb715c58-21a4-4f3c-a17f-08dd3f0062a7
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jan 2025 18:28:24.3977 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WesVwDueKHzaKJHX6ysJKMNxHhwwfCaqydetjkbInLLO0sdw2+MsePx0fghEuqoE/kANwBu7nH/Wvn+ZWpabBW/6q7Vt7VJfyiLnHbYbjnk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4614
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

T24gTW9uLCAyMDI1LTAxLTI3IGF0IDE5OjA1ICswMTAwLCBNaWNoYWwgV2FqZGVjemtvIHdyb3Rl
Og0KPiANCj4gDQo+IE9uIDI3LjAxLjIwMjUgMTg6MDcsIFN1bW1lcnMsIFN0dWFydCB3cm90ZToN
Cj4gPiBPbiBTYXQsIDIwMjUtMDEtMjUgYXQgMjI6NTUgKzAxMDAsIE1pY2hhbCBXYWpkZWN6a28g
d3JvdGU6DQo+ID4gPiBTaW5jZSB0aGUgR3VDIGlzIHJlc2V0IGR1cmluZyBHVCByZXNldCwgd2Ug
bmVlZCB0byByZS1zZW5kIHRoZQ0KPiA+ID4gZW50aXJlIFNSLUlPViBwcm92aXNpb25pbmcgY29u
ZmlndXJhdGlvbiB0byB0aGUgR3VDLiBCdXQgc2luY2UNCj4gPiA+IHRoaXMgd2hvbGUgY29uZmln
dXJhdGlvbiBpcyBwcm90ZWN0ZWQgYnkgdGhlIFBGIG1hc3RlciBtdXRleCBhbmQNCj4gPiA+IHdl
IGNhbid0IGF2b2lkIG1ha2luZyBhbGxvY2F0aW9ucyB1bmRlciB0aGlzIG11dGV4IChsaWtlIGR1
cmluZw0KPiA+ID4gTE1FTSBwcm92aXNpb25pbmcpLCB3ZSBjYW4ndCBkbyB0aGlzIHJlcHJvdmlz
aW9uaW5nIGZyb20gZ3QtcmVzZXQNCj4gPiA+IHBhdGggaWYgd2Ugd2FudCB0byBiZSByZWNsYWlt
LXNhZmUuIE1vdmUgVkZzIHJlcHJvdmlzaW9uaW5nIHRvIGENCj4gPiA+IGFzeW5jIHdvcmtlciB0
aGF0IHdlIHdpbGwgc3RhcnQgZnJvbSB0aGUgZ3QtcmVzZXQgcGF0aC4NCj4gPiANCj4gPiBBZG1p
dHRlZGx5IEkgZG9uJ3QgZnVsbHkgdW5kZXJzdGFuZCB0aGUgUEYgcmVzdGFydCBmbG93IGhlcmUg
ZnJvbQ0KPiA+IHVzZXJzcGFjZS4gSXMgdGhlcmUgc29tZSByYWNlIGNvbmRpdGlvbiB3ZSBuZWVk
IHRvIGNoZWNrIGZvcg0KPiA+IHdoZXRoZXINCj4gPiBHdUMgY29tcGxldGVzIGJhc2UgY29uZmln
dXJhdGlvbiBiZWZvcmUgdGhlIFBGIGNvbmZpZyBjb21lcw0KPiA+IHRocm91Z2g/IElzDQo+ID4g
aXQgcG9zc2libGUgd2UgY2FuIGdldCBpbnRvIGVpdGhlciBzb21lIGRlYWRsb2NrIGJldHdlZW4g
dGhlIG5hdGl2ZQ0KPiA+IGluaXQgYW5kIHRoZSBQRiBpbml0IG9yIHN0YXJ0IHJ1bm5pbmcgY29u
dGVudCBvbiBzb21lIGVuZ2luZXMgaW4NCj4gPiBuYXRpdmUNCj4gPiBtb2RlIGJlZm9yZSBQRiBj
b21wbGV0ZXM/DQo+IA0KPiBFdmVuIGlmIGR1ZSB0byBhIHJhY2Ugd2Ugc3RhcnQgcnVubmluZyBQ
RiBjb250ZW50IG9uIGVuZ2luZXMgYmVmb3JlDQo+IHdlDQo+IGZpbmlzaCBHdUMgcmVjb25maWd1
cmF0aW9uIGZyb20gbmF0aXZlIHRvIFNSSU9WIG1vZGUsIHRoZW4gdGhhdA0KPiBjb250ZW50DQo+
IG1heSBqdXN0IHJ1biBhIGxpdHRsZSBsb25nZXIgdGhhbiBiZWZvcmUgYSByZXNldCwgZHVlIHRv
IGluaXRpYWwNCj4gImluZmluaXR5IiBleGVjdXRpb24gcXVhbnR1bSBvciBwcmVlbXB0aW9uIHRp
bWVvdXQgc2V0dGluZ3MsIHdoaWNoIGluDQo+IFNSSU9WIG1vZGUgd2VyZSBsaWtlbHkgcmVjb25m
aWd1cmVkIHRvIGEgc21hbGxlciB2YWx1ZXMuDQo+IA0KPiBBbHNvIGFueSByYWNlIHdpdGggbmV3
IHByb3Zpc2lvbmluZyByZXF1ZXN0cyBmcm9tIHRoZSB1c2VyIHNwYWNlDQo+IHNob3VsZA0KPiBi
ZSBoYXJtbGVzcyBzaW5jZSBkdXJpbmcgYSBQRiByZXN0YXJ0IHdlIHdpbGwgcmVzZW5kIHdob2xl
IFNSSU9WDQo+IGNvbmZpZ3VyYXRpb24sIGluY2x1ZGluZyBhbnkgbGF0ZXN0IGNoYW5nZXMgZG9u
ZSBiZXR3ZWVuIEdUIHJlc2V0IGFuZA0KPiBQRg0KPiByZXN0YXJ0Lg0KDQpPayB0aGlua2luZyBv
dXQgbG91ZCBoZXJlLi4uDQoNClNvIGxldCdzIHNheSB3ZSBoYXZlIGFuIGFwcGxpY2F0aW9uIHRo
YXQgaGFzIGEgc3VibWlzc2lvbiBpbiBmbGlnaHQuIEl0DQppcyBzdHVjayBpbiBkcm0gc2NoZWR1
bGVyIGZvciBzb21lIHJlYXNvbi4gVGhlbiB3ZSBnZXQgYSBHVCByZXNldC4NCk5hdGl2ZSBtb2Rl
IGlzIGNvbmZpZ3VyZWQgZmlyc3QgcGVyIHRoZSB1cGRhdGUgaGVyZS4gRHJtLXNjaGVkdWxlcg0K
cmVzdGFydHMgYW5kIHN1Ym1pdHMgdGhlIHdvcmtsb2FkIHRvIEd1Qy4gR3VDIHRoZW4gc3VibWl0
cyB0byBIVy4gV2hpbGUNCnRoZSB3b3JrbG9hZCBpcyBydW5uaW5nIGluIEhXLCBQRiBtb2RlIGlz
IGNvbmZpZ3VyZWQgaW4gR3VDLiBUaGUNCndvcmtsb2FkIHRoYXQgd2FzIHJ1bm5pbmcgaW4gSFcg
dGhlbiBjb21wbGV0ZXMgQmVmb3JlIHRoZSBDU0Igb2YgdGhlDQpjb21wbGV0aW9uIGhpdHMgR3VD
IHRob3VnaCwgUEYgY29uZmlnIGNvbXBsZXRlcyBhbmQgS01EIHJlcGxheXMgdGhlDQp3b3JrbG9h
ZCB0aGF0IGp1c3QgY29tcGxldGVkIGluIEhXIGFnYWluLiBHdUMgd2lsbCBjaGVjayB0aGUgcmlu
ZyB0YWlsDQppbiBtZW1vcnkgYW5kIHNlZSB0aGF0IHRoZSBoZWFkL3RhaWwgbWF0Y2ggYW5kIHRo
ZXJlZm9yZSB3b24ndCBzdWJtaXQNCnRoZSBuZXcgd29ya2xvYWQuDQoNCklmIHVzZXJzcGFjZSB3
YXMgd2FpdGluZyBvbiBhIG1lbW9yeSB1cGRhdGUgZm9yIGpvYiBjb21wbGV0aW9uIChvcg0Kc2Vt
YXBob3JlKSwgaXQgc2hvdWxkIGdvIHRocm91Z2ggZWl0aGVyIHdheSBhbmQgc2hvdWxkIGJlIG5v
IGhhcm0NCmhhdmluZyBhIHNlY29uZCB3b3JrbG9hZCB0aGVyZSBldmVuIGlmIGl0IHdhcyBzdWJt
aXR0ZWQuDQoNCkJ1dCB5ZWFoIG1ha2VzIHNlbnNlIHRvIG1lLCBubyBpc3N1ZSBoZXJlLg0KDQpS
ZXZpZXdlZC1ieTogU3R1YXJ0IFN1bW1lcnMgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT4NCg0K
PiANCj4gLSBNaWNoYWwNCg0K
