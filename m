Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3A3CFD355
	for <intel-xe@archiver.kernel.org>; Mon, 24 Nov 2025 21:24:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D9F310E262;
	Mon, 24 Nov 2025 21:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RDR9C/4Z";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98ED10E262
 for <intel-xe@lists.freedesktop.org>; Mon, 24 Nov 2025 21:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764019458; x=1795555458;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b0VjT68lCc84CA1/hsMThL6VZlgSrLA4VmqsI1EWh00=;
 b=RDR9C/4Z5QqtBZawQJOYMrSh5Y8AfCIc0DtJRlTkh143fZCvTpvjcaUN
 Zvr2DHnte8ijCQ2A/M5tBV335ilamhTYUKIaV1DhY7ivHq0m/KfvfEoAl
 waUJqS9zmk1Gd8B6eZAtrUXi8EiqHo0K0IaC/lW5tRsvNotehxpx6FG4S
 9TFKRYQctlPddPb87GxqiFkJj5uXyRpVBChG3EmgmIxMcN6+5D5I+Tatr
 VYV1Zdh+VLdSGTczQCRS1HjvhpZy/9QZTMPpK5qKx+E77x4m+xl5oUkmG
 +fNxBoyPJWmKKO923UmX0q+RmkSwkwUyD3Or+uhFYrVIZBGqJ30ahielr g==;
X-CSE-ConnectionGUID: RaoQ8wXHTxevSSjfkDq2Sw==
X-CSE-MsgGUID: xac6PNesT16t7vfO+GCZfQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="69651381"
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="69651381"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:24:17 -0800
X-CSE-ConnectionGUID: IOwtnjE3Tf63y845cVb/fA==
X-CSE-MsgGUID: X3SJSf0wTnmDNlfysep03Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,223,1758610800"; d="scan'208";a="192098603"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Nov 2025 13:24:17 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Nov 2025 13:24:16 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 24 Nov 2025 13:24:16 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 24 Nov 2025 13:24:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ajBQtzttgiPvA3Fo9yjFoFSJGUHy+xhB1qvENELfyWdCmJ5CIMQPrWG50uFuDb8ADb9cxD+U7NZ6V3Lri33rRslNEvr4rt0iQlTUBS2Qbs2AP5R5iHiDU0eNzc3/CCc/0gznyM5/ZZ61HVdnwBPIjC/lCdrVmrafRVxkAzWQA8twXGCElrOCl9YOQ2oXJdqiyu5hDvjlgvlMWf7tc8OfOaMQwf3Ec03V6om4hIYyhICExwWHehnrqypFeZ5eSR9zcWFNpmADePpqMqgLf90bdNHT5bRrsivM5h8IwXC5STFR/sZNluxL5uZqeFQPwoR/tX9wzz6x7/go36RzdrIx1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b0VjT68lCc84CA1/hsMThL6VZlgSrLA4VmqsI1EWh00=;
 b=J20cOxrIwboNlv5qdHZpEKqQ2JUULkUjxen8VGsKKpCaRtDdLP8Li8SGby+nChUHkNUNHBYVaqeuqPmSMzJiVi6cO4/+1zHwuTRD8yAOwpVGtbEnTjHBNbhCiKZ70IVljqkGu4B2lwjAzsT9jPC9be3Z4EIYGAVx6k4yJDNvSEDukJGuFMR7C/oS9hCDrMz1el5tX4nsXqvXwb11PSDR2bCSNJr5l2D7KLbU9lFozaRB34b9t0nraPsrTW8fP7MJ5uF9PhkvM5+Fj27RsFKUTwl3ORKONnTSTGZa0HNjYQWhmyblj1Ag1X1UUgFo1r4bYIZ1ooJZml2Wyv8TmbB6JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by DM3PR11MB8734.namprd11.prod.outlook.com (2603:10b6:8:1af::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 21:24:14 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 21:24:14 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Brost, Matthew" <matthew.brost@intel.com>
Subject: RE: [PATCH 0/2] Silence allocation warnings for sync arrays
Thread-Topic: [PATCH 0/2] Silence allocation warnings for sync arrays
Thread-Index: AQHcWnfDdw2+wWxISkeTIaQPn3S2TLUBs2QAgACl1RA=
Date: Mon, 24 Nov 2025 21:24:14 +0000
Message-ID: <DM4PR11MB5456DF2918866D971FAF35FBEAD0A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251120234254.427452-4-shuicheng.lin@intel.com>
 <f3a9603475e70d85368e5083046365eb507da502.camel@linux.intel.com>
In-Reply-To: <f3a9603475e70d85368e5083046365eb507da502.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|DM3PR11MB8734:EE_
x-ms-office365-filtering-correlation-id: d9bedf71-1de3-4bd8-da9e-08de2b9fd13c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?eW9wQVZCcStQNThuOXpxalZkUFROaUxObnExTVRtUjFNMjZRQ09UMCs3Ni9v?=
 =?utf-8?B?enlocFBwUEppTStrVEZMWVVDTWZONUFHNzYxcFhHSndKK1hjN20xcUppUEg2?=
 =?utf-8?B?bGVoclgwbFc3MExHY3VKeGF3VEhZRmFrOGYxM1gxS21YUXZ0dTZBWWc2MFh5?=
 =?utf-8?B?ck8rdDJPcGdKUEd1amtjNFNwemFxYXJUdGhvMXVBZTRiYVA0Z2ZSbjJqbnI0?=
 =?utf-8?B?ZXRnZnJubTVWRlFQTFBIN1VZazV3ejhKYTdvQW8ySUZzYUhRMU1rbzQyS2ZZ?=
 =?utf-8?B?eUszMTdyRGlzRnRRTHNHTVlHdFIvWE9OT29udFdFMHdJazVWNEoxSmI1T1Zw?=
 =?utf-8?B?dFROZm9OOU5DNHlIRHFWb0pCaVNnTnBjTVdhYWtYV3Z3QmZ0eUhXSnhJdCtY?=
 =?utf-8?B?U0JUZ0FicHIzcXpxUnBBQjQyUjFuWnhDd0dubnpXdEMwcmNCdDhxWjVWRXo4?=
 =?utf-8?B?UmUxcjVpSC9WNUN2YkRuVWJ5TytDTlgxUkxRUTlkTkpzc01zSkRWWXhTQjNI?=
 =?utf-8?B?V3NLUzREaUlZcjB4WnNmU3BicTFqNnZMK1ZIYzJOQVJ5NUJTTS95Ly9BKzg5?=
 =?utf-8?B?aEZNcWQ5aXc5K28rdHZBbTBIR3FaN3lCcGJQd0RhZWFOYlVyOHkvVGl3ak54?=
 =?utf-8?B?UkR0bGNWSlpwSnRzaTQ3N1FtWG04aE1jUnpaUHU4VEJMUU5nSUx6YlozN1hK?=
 =?utf-8?B?cU40NFlRaUpSRU85T2pSSTlGN2s2bTRGelFuUGU3Mzk1KzJnMGk3TXhRTjNR?=
 =?utf-8?B?ZnJBMjhkeDFqeXBiM1ZxNytNN1YvcU5WOXRwWUd2QnVYeUtQdFVGOWN6Z3BM?=
 =?utf-8?B?T21mMGs5Yyt3MklxWTJYaUxhZWV4d3dQdEhaN0NncmxRQmF6QUMvdGV3SjI3?=
 =?utf-8?B?U2cyaGRSczBCb0pxUDNDL3lSc1BDZTdTbXBNNlhhLzNRQkdhVDc3SWlqNkQv?=
 =?utf-8?B?MkdVZDVmQUg0SThBZmxFVXFsbEZJQm1BWlM4aGNmOTJwTjVIeTdUUDI0N1dN?=
 =?utf-8?B?N1BBbk9hUXBHckZFcHJtN2NUS1RsZmVMWlQvNXRJRlFPNGdmc3RUSDY3aTJw?=
 =?utf-8?B?MjdPdnJ0UUVrbW51OGdzQUtiU1VVL2lpS3ZXWVgyd1RSY0hZNzNNeEdmcnRz?=
 =?utf-8?B?WFBQSklPbmdERlFkQVRKVjYwbU9tNzNIeEJpaEpNUDRPRDRzb09MNzVjMVdh?=
 =?utf-8?B?Y1BTMzNuUmx1TWlwTmRnN1g4dGljcmc0R1FYaGMzZnVSYU5tcGM0QTkyeDhj?=
 =?utf-8?B?WkZYYUxZVDEzdC82Uk1QWFZYR2JXVTZNS0JIWURyNk9oeU9rbllWU1JZeUpR?=
 =?utf-8?B?SjdrNXh5ZTl5SThZdnZBNjRJbTJWNXRVZkVYWkY1ckhQQ24rZjY2K3lwUW16?=
 =?utf-8?B?clI2TWxJb1RIQmllT0ZzNkVUNjBFN3FUM0hXV1kxRSsyRzlJbmdlK2NNYW9S?=
 =?utf-8?B?b0NuZ2hFNXI4cFZFYi80UnFBSjJZUnhmdHAxc2tHM3NwbGwyN2dtdjdKc0Ry?=
 =?utf-8?B?RTlaSmZ0RzRpcllYNWZ4RWpBTUxmWUs4MG5XRmxIWm1IOXBmVXhoYjFtd0Fq?=
 =?utf-8?B?TWovcEo1dUVmNlo1SlpJNnlQTUxCUHowQXFHK3YyVEFyVmhDUEcwWWwydkQx?=
 =?utf-8?B?Y2UwSGNDRktDZHNoSnRLVXQyM0J5Vm82RDk4THFpY3ZNbncwbXpKWDBMcTli?=
 =?utf-8?B?S1gxRm54bG1XNDNXRTBhRCtISHdrV0IvVWx0WWtiMlhnRCs4SGRaSzhDclo1?=
 =?utf-8?B?dndCQW1XMDE1V0pldWo4MVB6enZ4dEVaOTM2Yy9HSDN2M0Z1Yy9BUDJYUUV2?=
 =?utf-8?B?b1ZBbXNHQllxZnpMWVNYTGQ0UUhrWkpBd1IxaWZNdWJEeW4ybTVkOGlmTi9F?=
 =?utf-8?B?NEtaOFJITDZ0Lzd5ZzFLMXpaazVRd1J5anRDUUtaRThYbjRSdC9GUTg1NTBz?=
 =?utf-8?B?M09jQi9KeDRBdmpWTk03QVhYSU1KSGxFaEpqWXNHWEZQeGdxeXpsbURDTEpi?=
 =?utf-8?B?MG0raU96eFVnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cG9xNTlpeC9Lcnp0clU1SGEvZ3crMS9EWUVDekc1UmxTeDg1MTZzUzZ5Ym9i?=
 =?utf-8?B?aUc5ZVdiVzBGQ1k2aVNKcUhhL1pzY3pWZW8wWHBLVE91QURlT1ZTRmNZVXly?=
 =?utf-8?B?WEpjMzdUNHdsd0V0NjVERXNCMDFnb2Q3bFRudGpJRE9aNFRqOGxzc2JJOEYx?=
 =?utf-8?B?WFFhZG1MUDRLMnI0a0VScndBY1BhZm5KODdjZUYzWTRDWkxITHI0MFM0UjRL?=
 =?utf-8?B?Q0tFblZXczNyUE5vV3JYSllhMVFWSklWYjZyQTRjd2hWSTJzamlueEVTZy9O?=
 =?utf-8?B?SUJpNnFVNHYrMXVDMHd5dHBEK0h5N2hKaWRFbjVoL2E1VVNBQzlMa2JlSGJQ?=
 =?utf-8?B?VXZ6VEZFbXNWYmJlSGxkOEdQVWVsUnVVejRiKzRLak55bFdoc3A4ckdPKy9R?=
 =?utf-8?B?WHg4YUJ4Z1hBYWpYRTBuM25MR0JXSjRJNE5qYkpUaHJyR0hpcUt4WjdTOWdT?=
 =?utf-8?B?bzJadVF4Y2xOMjUvY3ZSYVRjT1NYWmNrTlVGcGRPZ3Q3OWVVNjlKaENYMHFh?=
 =?utf-8?B?bVluTmN0TVJLekQ3czFVYVdwYmRXOGxIblRtR0V1b2RVOGE3T0JGMklxMGpu?=
 =?utf-8?B?ejluQTc0b3VpR3hmYmNwUXpPcmJNTHh4NnI0SnZlVTV6d0JtZ2ZKQm0yb3VG?=
 =?utf-8?B?TjByUUlYMXgrOHB3U05YaENnWEhEdWJKbURvV0tRaGhIWXVYVkdPMktFcjNG?=
 =?utf-8?B?anIrWVMrY1BpTnUraCtvTzl4UzVYYmo1eWdIZTBPSHhvc2VCNXNySElqU3dB?=
 =?utf-8?B?WmlOMUs2SGxIMG1UOU03dHNHajIzcGFXQnpGQ1J0QUdzN0I3cDZiSm9tb2dY?=
 =?utf-8?B?alZ2alJUUHVCODZQSDhRVTBoWURuZllPT3pqeUhxT3ArV3lKdm91V3gzRlVD?=
 =?utf-8?B?Q2VoRkovd0JRZG04MCt2MWZ1Mm5aaDV6RHZ3MEs3VzlHdVhSL0JvdURpY0h0?=
 =?utf-8?B?SHJyL0lQSE5JYzRUeUNCakw3Ykk5NjVkYUxlOFcvVEFkNjlqR1RrMGhtTTZr?=
 =?utf-8?B?eGxMMmdId1diR2w0dm5oWkZNYVdhaTVOZm4xSmZkdEkrR3dvemNPTkJiZkt0?=
 =?utf-8?B?eEo3Q1M1NTQzSUMxSzZEMG9DN0NjZEJuQVo4TFFPYlV4U1FpcHZ0TkhRRmFm?=
 =?utf-8?B?cmNyUWNBNmEwbVhoWTdabnZqU2dQcFBUNVRqQWRPYkgwWUI4MXR3bStVblF1?=
 =?utf-8?B?R0xrR3pkMytmN2NUWkxMd0lUZ21GejNuSURhaFVtZ2VOc0F6cVo5Zk1PK1JY?=
 =?utf-8?B?M3NHdXA4T0d1dWJRQ2RTb3cvRDUzNW91ajViaWhQODNQakpzajFwMnB3NEJ3?=
 =?utf-8?B?dnRSblJPbmRvOVdGd2FJOWZzZFdsclZtWkNmNnpSL3J1ZXVPKytLMWN6UzZD?=
 =?utf-8?B?UXNGOGFkZWZxVDhTelZ5QnFCUisyOHdpdVBFRUVPSHVUcWEvRXhnMlhzZzJu?=
 =?utf-8?B?TVFUTk5XYnBFTkoxSVVmY08zaXRzYVNiOXJwWkcvaGZGUU12YnRUYktmZ2tW?=
 =?utf-8?B?VXZ3MGc5TVgyNFJqbE5hc1NxOUhVTTkrUmlRdUpiUGYrOUJTYldyczcvaWRZ?=
 =?utf-8?B?YjRuOUdQR3ZkMHVBVFZ1NUtiZ3d1aEZuSVV2bThLQU5vdEJLb01nOXc3OExv?=
 =?utf-8?B?a2x4Z2J1eXQ4YkpjbGRURTFEQmduem0zcXoxVERzMnc3SDc5ZGZDbHZWS2Fv?=
 =?utf-8?B?TlVSZTQ3NnhjQzZKR2dnYVorQWVsMWoyL1lrRFBsUjBZSUxjWmxSRTEza2px?=
 =?utf-8?B?UWp6WDMwWkdoTkNHN3o4QjFDbnVaZmlaaTloRGhzSDNBMXVBM21KNmFleGgr?=
 =?utf-8?B?ejFBamhjN3NmWXUxR3JCRWppNHBKWmRjZkhRSU9BTy9OVjZ6aC9yQy9TMWdM?=
 =?utf-8?B?QzhEV2RZYkdUU2Y3MXVMZWoxUzJtY1lZdFpwR3o3UUVWSHM3d2RsMXRIQjlS?=
 =?utf-8?B?RkZXYXV5dzRGRGpyODUrWEg1SVFzVFdJb1FJTnhRUUhuUk1pV0Q0SXdEUzRD?=
 =?utf-8?B?bitidlJGd2xrM25TQXcyQlJuNUpBbGtBSlYvNTRyQ3lKNzRCNVpTSXRQL2JQ?=
 =?utf-8?B?bkh2YjNacENVTGVvWGV5cmp4TVRRVkgvamFSQmJjQTJ1MnRnVWU0TmF0b2Rq?=
 =?utf-8?B?OSs2Q3c0ZUxCdDBGZTRTKzZPVWRvZ3hZSmVNdk16cGdSeUtuZ1BBUzJSQmNa?=
 =?utf-8?Q?ZdnNKPJG3VDGKMadKJeCqqPIH5FjbX3oEBADwkawB+2b?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9bedf71-1de3-4bd8-da9e-08de2b9fd13c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 21:24:14.2822 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EYDhK8XGo9eYg9yRWhOWl1gZKMhqB8ZvbyFbf7vFcOtxQUL/KBpqYiZj4pv53pyRvfmWiKJtiYWiSXBQrbIfjA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8734
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

T24gTW9uLCBOb3YgMjQsIDIwMjUgMzoxOSBBTSBUaG9tYXMgSGVsbHN0csO2bSB3cm90ZToNCj4g
T24gVGh1LCAyMDI1LTExLTIwIGF0IDIzOjQyICswMDAwLCBTaHVpY2hlbmcgTGluIHdyb3RlOg0K
PiA+IFN1cHByZXNzIGFsbG9jYXRpb24gd2FybmluZyBhcyBkcml2ZXIgYWxyZWFkeSByZXR1cm4g
LUVOT01FTSBzYWZlbHkuDQo+IA0KPiBFdmVuIGlmIHRoZSBkcml2ZXIgcmV0dXJucyAtRU5PTUVN
LCBpbiBwcmFjdGljZSBhIG1hbGljaW91cyB1c2VyIGNvdWxkIGFsbG9jYXRlDQo+IG1vc3Qgb3Ig
YWxsIG9mIHN5c3RlbSBtZW1vcnkuDQo+IA0KPiBTbyBJTU8gd2UgbmVlZCB0byByZXN0cmljdCBu
dW1fc3luY3MgdG8gc29tZSByZWFzb25hYmxlIG51bWJlciwgYW5kIGlmIHRoZQ0KPiBhbGxvY2F0
aW9uIGlzIHBlcnNpc3RlbnQgd2Ugc2hvdWxkIGFkZCBfX0dGUF9BQ0NPVU5ULg0KDQpUaGVyZSBp
cyBhbm90aGVyIHNlcmllcyB0byByZXN0cmljdCB0aGUgbnVtX3N5bmNzIFswXS4NCkJvdGggc2Vy
aWVzIGNvdWxkIGZpeCB0aGUgaXNzdWUuIEFuZCBJIHRoaW5rIHdlIGNvdWxkIGhhdmUgYm90aCBz
ZXJpZXMuDQpXaGF0IGlzIHlvdXIgaWRlYSBhYm91dCBpdD8NCkZvciBbMF0sIHRoZXJlIGlzIGNv
bmNlcm4gYWJvdXQgdGhlIG1heCB2YWx1ZSBvZiBudW1fc3luY3MsIGFuZCBtYXkgbGVhZCB0byAN
CmZhaWx1cmUgaW4gVU1ELiBJIGFsc28gcHJlZmVyIHRvIGhhdmUgdGhlIHJlc3RyaWN0aW9uLiBM
ZXQgbWUgY29udGludWUgdG8gZHJpdmUgWzBdLg0KVGhhbmtzLg0KDQpbMF06IGh0dHBzOi8vcGF0
Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvMTU3NzU3Lw0KDQpTaHVpY2hlbmcNCg0KPiAN
Cj4gL1Rob21hcw0KPiANCj4gDQo+ID4NCj4gPiBTaHVpY2hlbmcgTGluICgyKToNCj4gPiDCoCBk
cm0veGU6IFNpbGVuY2UgYWxsb2NhdGlvbiB3YXJuaW5ncyBmb3Igc3luYyBhcnJheXMNCj4gPiDC
oCBkcm0veGUvb2E6IFNpbGVuY2UgYWxsb2NhdGlvbiB3YXJuaW5ncyBmb3Igc3luYyBhcnJheXMN
Cj4gPg0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWMuYyB8IDMgKystDQo+ID4gwqBk
cml2ZXJzL2dwdS9kcm0veGUveGVfb2EuY8KgwqAgfCAzICsrLQ0KPiA+IMKgZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3ZtLmPCoMKgIHwgMyArKy0NCj4gPiDCoDMgZmlsZXMgY2hhbmdlZCwgNiBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQ0KPiA+DQoNCg==
