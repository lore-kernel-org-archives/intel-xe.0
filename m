Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9827C3ABD8
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 05:43:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B32E10E103;
	Fri, 16 May 2025 05:43:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K/ScrL5V";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7AA810E104
 for <intel-xe@lists.freedesktop.org>; Fri, 16 May 2025 05:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747374214; x=1778910214;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=HZsEp2q8EM3n1oy029tpfH86NeJc9qRQnoZLH2psvlU=;
 b=K/ScrL5VQD1K5DrHuCOC454wJP3vG3mBAWKnEPZKEjLxXPix74dh1EKL
 kcteKg+GOzSZM4PqDxWIBGyZezKBE0A6eblc+safTaA61OR1xTBQxFv3C
 hL8mrjn89JmkxMHt6seIVgOLu8zB0RzhzNPK7RRjWaTiUmjAinoeUSjqb
 VbQN9WI1M45ZQnaqO42EPQLhJbvpXzV4OaHfZQkiPaQSZTlzstYp5ud8t
 ZAYH/18xlSVEPFHRgT5Ec7T/8hLzNWkmkWB79YboLL9zmIuDaR2AMvfxq
 MJIs4+zsI4B/gUin1Qucd5sfHUklNGS53y8solwUa5U0YdlLrsRZ7YXP6 A==;
X-CSE-ConnectionGUID: +ERjiPpjR3W6G2WUNC6KrA==
X-CSE-MsgGUID: rk1f7j9jR8q6iotAp6HJMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="49472218"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="49472218"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 22:43:34 -0700
X-CSE-ConnectionGUID: 2k2Vrq2SSxiHngk4GodBZQ==
X-CSE-MsgGUID: 7T+ZPA2IRY6D5CgBUnLmIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; d="scan'208";a="143823247"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 May 2025 22:43:34 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Thu, 15 May 2025 22:43:33 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Thu, 15 May 2025 22:43:33 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 15 May 2025 22:43:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jXYZBQNkh2i+vAREjJRSjkNI7POwWzUB0/JrdIF5RJHYXyVGXmfNlqEgD2Ls+v+7/Zvt74HJkta3DO3NO4cT6Vmja+H+zcYbjlwDGroDCQ3/jE5yNqp/gezLTtZSZHpvDoa/rUBgvcpGqCsuhfoyQHB4FvqTC33H2MjEnwBRj2yVYJ9T6sDEZ2kULZttD70bHm/sRYYWRrqyS2MihQ/mVJbHMwKxg2uqKqHr1YM/Fr0JKibifHqeFs5fhmxR428PTy7+0i0HF+rIKRg3PN1CD9xc72h7y++gQHMSIvTeE6IbVfPvjTnCyPWirEmIU5LG+bvUPiTyNoXHgbzmup58Qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZsEp2q8EM3n1oy029tpfH86NeJc9qRQnoZLH2psvlU=;
 b=A5eT1MnTBk0x4wq8Kkhbok36MIY/k53VNOGwz5H/KuZ9mstK+1fSGFoGJJWNjm4r/XxLBNs/UWvXEfVLGs+D0ZDI4uX6Tttjn5Oez0OKsRPUot0P7VBNjrGewP7W+LKumY5WFVVibHXzp4iVp3OTVLpSosMgeUM22D1fM8EGFP5tuBCMJnPTKWo7EZxpRAiGRmgVWIT4/9fnpTMTjSR8aHmN+f/82QnTAu9vM7O/rCs+T7UJXXntdDf7HjinkzsMvTMzKEjdvHYYjczfCFV+CjV9sXtCTcG+D/x60Ed3DsVz3RNqvkjqVx+6rO++jdwG5gaUW6FUd41InpkyJmfU3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com (2603:10b6:a03:459::19)
 by PH0PR11MB4872.namprd11.prod.outlook.com (2603:10b6:510:32::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.20; Fri, 16 May
 2025 05:42:45 +0000
Received: from SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762]) by SJ1PR11MB6204.namprd11.prod.outlook.com
 ([fe80::fd8d:bca9:3486:7762%5]) with mapi id 15.20.8722.027; Fri, 16 May 2025
 05:42:43 +0000
From: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
To: "Bhatia, Aradhya" <aradhya.bhatia@intel.com>, "Summers, Stuart"
 <stuart.summers@intel.com>, "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe/guc: Make creation of SLPC debugfs files
 conditional
Thread-Topic: [PATCH] drm/xe/guc: Make creation of SLPC debugfs files
 conditional
Thread-Index: AQHbxX6qbAfs9IXwEEK1GTN8jxJVVbPTq7LAgABJFACAABEUgIAAsBiAgAAJZZA=
Date: Fri, 16 May 2025 05:42:43 +0000
Message-ID: <SJ1PR11MB620479B6FA2F25CEA14247B28193A@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20250515094913.2437-1-aradhya.bhatia@intel.com>
 <SJ1PR11MB6204CD374CDB31981218C7308190A@SJ1PR11MB6204.namprd11.prod.outlook.com>
 <53969660-e48b-4467-9d3c-053fa7ceca9c@intel.com>
 <e7ea4de877f65babac4b89f2206cb18eac3ec648.camel@intel.com>
 <23c3d2c4-de75-4f17-bc5a-f593d06a99a1@intel.com>
In-Reply-To: <23c3d2c4-de75-4f17-bc5a-f593d06a99a1@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR11MB6204:EE_|PH0PR11MB4872:EE_
x-ms-office365-filtering-correlation-id: 0f3df5a0-b45b-4faa-e4a0-08dd943c7aae
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?N1A1c2ZZQTZvY2dPOTFwTFV4WHhjejVMM2RRVnFzWkptc3c4cHp4RUpESUhM?=
 =?utf-8?B?MEV3NUJ5RnZwR2VJTE5YaFVaVmVXNVlIOU5LajJQRFYvY1JUdWt0a2tDTG93?=
 =?utf-8?B?amY2ZHVMcUJrVk1nV1N5eHRiUmlmQWxXMC9DMVlGcFJic3lqbVdTbWpOSkNi?=
 =?utf-8?B?VjNMZGozSXY5cGdhMExpZElJNDJUeitmdG1MQi90MUlabDlvTVBZeVZYMzRx?=
 =?utf-8?B?blRJcFZmT1FDdmVmSjJ1NVdsUzJFOTF3b3BBVVZ2OFpuQnlzNGxHV2wwTHN5?=
 =?utf-8?B?aEZLWHA1REFmOTVyS01CT1BHYXZKRVdWMFBKYlN2WjJUOW1LcVVPcnplMy93?=
 =?utf-8?B?YjUreFhPdjl6cjZnQk5HazJYR093bWd6MHhzN29kUUlDME5lMDJNV1JEOGsv?=
 =?utf-8?B?dnNtVHhXK3ZtWjFSaXdpNWcvMTBFN0VlSnVHMWpKUldmb3FsMk0zM01lVDh1?=
 =?utf-8?B?OUh2eHdLMmFoWWVpSGRTUk5zTGRnQ3JpVk9BUWx5OElDOVF5UzUxQ2J3aDFk?=
 =?utf-8?B?QU4rd2QzVG5yVlYvdUZtT3Q0Znh3Zk5CS0QyZU1iNExHY0l0TDY5d3pJOTli?=
 =?utf-8?B?b2t1ajFxUTEzZlNMVk9taHpGSzlsanJhK2MzNjZDaCtEVXBob3dBVy84MXBt?=
 =?utf-8?B?dVlSS0Q2eCthcGtzL1N4OGExZC9kUEFUSFF3RUx3VzI1Mmo3UG1oWVpyLytX?=
 =?utf-8?B?aGFac2NvYlRBdE1GbSthOU0xWWo1aVV2Wkl0N0ZaT0dld3AvNzd3WW9aQ3FI?=
 =?utf-8?B?TTEzT0VhenJNYnE1WVZPcVY3VThyRFRCS3hURW9LZzZ3K1p6TFdONnF5RXdu?=
 =?utf-8?B?aml3Q29ZeWhPRnM1UGNlUG5rUzkvU3lJQldqMlQ0UXZiM0V2eGF0M2piazY2?=
 =?utf-8?B?Z3Z5dHgzNmludXJBSWl5WmNyL0xnMEJkZHlaR2NNUXRuZkNudG8yQ1lBajRm?=
 =?utf-8?B?a2xWRE4xbmJ6V2JxUWFOMzZSQ2JETEtjSk0zbzV0NlE0MXJhYkpndDNHeG9W?=
 =?utf-8?B?VjhZYWtMbnd2cHhqejRENnFPRFZoM28zb0NQa3l0Mzg4bEQ1UTBrWktxaVli?=
 =?utf-8?B?bFBrVzZHZ2dzYjhJbnpuQ1daK3Y3d2xKMmZxTWQ1ei9pbDEzM2lHbDVZQlZE?=
 =?utf-8?B?ck9KMitOK3ZHOFE5M2owTjJTKy9oR0cyQzN5U2g4N1F6a2xwWkNLWk8yQkR5?=
 =?utf-8?B?VHY5OXREN1dyaVpVUFdIeGtvYkIxTkxoZGI4R1pZOGhkTzd1eHVybFRDWDF5?=
 =?utf-8?B?YWhtMURSaGozTlFrRks1TllPaUcrV1VWdEQxN0NjZnNIZ2xJMzVrVmZuRmd6?=
 =?utf-8?B?QU14SXRTVEttMWQzZlo0cXdLNGRKY2NoVjhSSThtUmY5VE1OZVMya3VzaEp5?=
 =?utf-8?B?aHZYT3BpOXZiNXN0NmQ2bXIrSkpBQVRtcFNxbkMxSVQ0ZkNuYmhiTjVQbVo4?=
 =?utf-8?B?M2JSMnozZDA2SlZPa3ArckRkY1Z2QWprakZaNnNrTHdOektycVUrMWE2U09Q?=
 =?utf-8?B?Y0FiM0FxQ00wTmhhM2R4b3M0WnlYeWdHU3Y5c0NyUTV4amwvNDlGOVViMU43?=
 =?utf-8?B?SDBPQ3piYWY1enVKdWowc3lSaXlxQ1d1K1RYcEx6L2R6YjdER3BPeEl1a3N1?=
 =?utf-8?B?ZkVIK2hrRG9WUWdMRThZMXJuWk9VR2xUOCsyMStJSCtrck5VQlhDKzg4eTY4?=
 =?utf-8?B?UjUzRGNlbzNvclFraHovYllXbGpzMER0Q1lnQlRGK25nNVJna2Y1OXBJUFBy?=
 =?utf-8?B?dVZOc3Y5dUYrMjV3R09kSDdJWUNjd0VOZHBpdnJUUFp6MWplUXB3MkQ0d0pL?=
 =?utf-8?B?cjcyKzVPK3F3MTdwYllHQW4xTllUdUZVQ1BBZjRrbWxqeFAybm4rS3E3UmFn?=
 =?utf-8?B?REVjUU1UT2JVZ3g1YzUzalluaXR0NzRpQXQ2bXVpVC8yMlltWFN2Z3hHS3Qy?=
 =?utf-8?B?YzFyU1d0UHI4aFB5cUFwVnhFc3kxNHp6NHd0REJwVW16T0hmY3AwdkJUdXZk?=
 =?utf-8?Q?7e2DLQWjCj7PF6GERYH++EZzDge/6k=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ1PR11MB6204.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018)(7053199007); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1ZqSFRiMXdUbEUzTEtLSWkvdCtoWE53eGFWang1TEUva3BiaUpNejZzczRj?=
 =?utf-8?B?SDVyU25SRWJEVWd6dWhGOWRNQU8vMFFGTzJYMWZTNjdnYlcyZU1reGhRc1Ax?=
 =?utf-8?B?VmtUZkR2dEVrK2tBcGFGRmdCcnM4SDB4UDNGMzVCaTFGOWJEWHFkRkg4MVZt?=
 =?utf-8?B?dktjRGVpWjBGRkRXUUVPb1A4Wi9BZG1odXZhOVZOTnFKOFpMN3B0d0FqVWhw?=
 =?utf-8?B?VDdvYTg4N2lwcHRyV2NQdUR4NnpFWWZvb2RINWk4bVExQ3JGcEI3UzMxRENu?=
 =?utf-8?B?cjNKZ3Z1OHpSN2NoRkdxT293YUo4OGpaaDRRTEhDaXNkOTZTSG9QOTZHR1Fv?=
 =?utf-8?B?SzNlUmMxcW1KOGxTRlhwc2tGR3VMNTI0MDdPTXdBTDgwejlTdC9FRTZnSWlO?=
 =?utf-8?B?bHhTdXdicTRQODhhc25ST25kWUUzM1JOMWZER085aGFVdlpLcGJGSlA0UFRO?=
 =?utf-8?B?azRTMVJnclNaYzNOcm5GU0xaMXVVc2FBcTJ2UE9ON2g4clZFczhCM0Z4QmJM?=
 =?utf-8?B?Z0UwV2ljK1hGOENPUEFjTWhsczJNSS9mTGVpYnZLb2dIaStXa3Q4WnBCK0pG?=
 =?utf-8?B?ejRWVDc1d1FtWjVaYVIzclcxeUpNcFFIcldaano3eWwvL0JLVkxkRVBYdElM?=
 =?utf-8?B?L1NBUFMwM0Y5RU40c1VYd2ZadmRNajQ1VmJ3ODNsZnRyVGRZUEpYWElHckxp?=
 =?utf-8?B?eDJUbmExakFtcDlPdUNwSHFYRGJuOFRmT1ZhTDBleHAxOG5pVXF2dHdBT05w?=
 =?utf-8?B?YTZ0cEhtMGo1MkNQWXR0OGJzanNZa2xsSE9mTHdndVIzNExDV2VwT1JJaDlj?=
 =?utf-8?B?UlhEd0RTbHdyMEIxNXBwWVB6TUlYOEJNT0YzejJLVHYxTFJyUWljTGsyd2tk?=
 =?utf-8?B?bzdqZnE0WVpmL3ZDcHJqOTZPVi8zdS91eDFsRFh3WlV6QzJONW8zbG9LRlJr?=
 =?utf-8?B?cmI0SHVvZitNMmtvaXYzWHhmMndnZEFaV1o5eW5wOFpmMUZmSEl5MUJMMnF3?=
 =?utf-8?B?UlJPbUVhejFCdTVpcE9EOURjOFR1SW1kV2czcFFjTEpqb2djQVFOR1NwekJm?=
 =?utf-8?B?dmZDdGgrRklwYlo4V1M0aHBQMllULzkydUlIM0NNMFc5bjA1bVJaMHA2TFlr?=
 =?utf-8?B?OFFqZkxHNERjV0FIRENoNGh1NGF0QzdNb3l3Q2pSNHMvb3NCNUhkM1pyeXpl?=
 =?utf-8?B?Rmk1czltb1didXFBQnk0dWRZR3dmZC85YzJ2WTk2U0VTbWZtN2xvb3d3UndF?=
 =?utf-8?B?NnZrM3RtQjc4N1RlODA4K2lKdFNrcWtkSEVjeTBqR1pFWnNEU0FHNjd4VDVt?=
 =?utf-8?B?bENIZFpRQ2lHakhCMkdqa2NCWnk4Q3d4eUNIQUFFOU9qamtoQldueGRGSHZh?=
 =?utf-8?B?RHVCbCtnYTN2T3FGYWMram51alZ3bXJ6R1dzbkord250ZDB1eXA5TnQrbWRK?=
 =?utf-8?B?Q1BsTDNVWjNHWFNhc2J4dWE0WDBETnpjdW1DVmxLUGpYeENvbHZqMWJlajlO?=
 =?utf-8?B?UWttV1pLTlJBVytqTWVLYU5oa0xvdkVpc3dySUpNSWdUc29KbVNyYXdsTUI4?=
 =?utf-8?B?ZWJGT2ozS1NYWDdIU21VcDcwVUpqMDRndTJEczdlNUgyQU4yMDU2c3VpQThH?=
 =?utf-8?B?Mk04VFFhZ1lRUXBMY0RIcDZOblpFWTFWdzNBQzJhRXZ1TE5tVEtQVWpSVk41?=
 =?utf-8?B?SElvOUR0b0Vmb1NEMURhVmpVL2tFa3hPREJKZFZzOS9MdUtIWlpnVlNzZWJn?=
 =?utf-8?B?UVdaZm5VT00yWG8yaURsTyt2REdvOGV4ZGtCN1dDTU1EbFpKaFhPSENScmJo?=
 =?utf-8?B?eS9hS1h6R3hzR2hRZjVLcXU2TStIWUtXWnJHRGFYQ0M2RXl0amFtYmNzV0xa?=
 =?utf-8?B?NWFvb3BFQXN3S3o0cGpoemVNQUFza1dYT3lTWHlIc1hRNGpUcTdvOEdWQmJl?=
 =?utf-8?B?aEhoeXU1RXZEWDliSXJtNXNKU0tTN1BTcG9VK2RRaTV5ZHNUT2xGcHJvV1A0?=
 =?utf-8?B?RFBOQ0YyZHlKelI3SzNscHpxT2lqQXpjRUJCb0NYVlMycnFMYWRCQy8yY2Rw?=
 =?utf-8?B?QkdSSHNmV1l5Q3c1MkZ5ejQ1VU9VUEJVeG92NVBHdDVCTXQrbHU2VkFDcVZm?=
 =?utf-8?Q?yqkwUeA2FmtiuCmVgE9XhAVMR?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6204.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f3df5a0-b45b-4faa-e4a0-08dd943c7aae
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 May 2025 05:42:43.3528 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DCD4Xir6XwETJXks1n3IT647y7MeWl9zYvSM8O9/bHFpyQi1aWNhwXZ3E1SteShr6V9t99vwL15uVnhbS8wfcL0SImP1YxYu7aIRd84z1Ok=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4872
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogQmhhdGlhLCBBcmFkaHlh
IDxhcmFkaHlhLmJoYXRpYUBpbnRlbC5jb20+DQo+IFNlbnQ6IDE2IE1heSAyMDI1IDEwOjM4DQo+
IFRvOiBTdW1tZXJzLCBTdHVhcnQgPHN0dWFydC5zdW1tZXJzQGludGVsLmNvbT47IFVwYWRoeWF5
LCBUZWphcw0KPiA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPjsgUm9wZXIsIE1hdHRoZXcgRA0K
PiA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gQ2M6IGludGVsLXhlQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZzsgR2hpbWlyYXksIEhpbWFsIFByYXNhZA0KPiA8aGltYWwucHJhc2FkLmdoaW1p
cmF5QGludGVsLmNvbT4NCj4gU3ViamVjdDogUmU6IFtQQVRDSF0gZHJtL3hlL2d1YzogTWFrZSBj
cmVhdGlvbiBvZiBTTFBDIGRlYnVnZnMgZmlsZXMNCj4gY29uZGl0aW9uYWwNCj4gDQo+IEhpIFN0
dWFydCwNCj4gDQo+IFRoYW5rIHlvdSBmb3IgcmV2aWV3aW5nIHRoZSBwYXRjaC4NCj4gDQo+IE9u
IDE2LTA1LTIwMjUgMDA6MDcsIFN1bW1lcnMsIFN0dWFydCB3cm90ZToNCj4gPiBPbiBUaHUsIDIw
MjUtMDUtMTUgYXQgMjM6MDYgKzA1MzAsIEFyYWRoeWEgQmhhdGlhIHdyb3RlOg0KPiA+PiBIaSBU
ZWphcywNCj4gPj4NCj4gPj4gVGhhbmsgeW91IGZvciByZXZpZXdpbmcgdGhlIHBhdGNoLg0KPiA+
Pg0KPiA+PiBPbiAxNS0wNS0yMDI1IDE4OjQ2LCBVcGFkaHlheSwgVGVqYXMgd3JvdGU6DQo+ID4+
Pg0KPiA+Pj4NCj4gPj4+PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+Pj4+IEZyb206
IEJoYXRpYSwgQXJhZGh5YSA8YXJhZGh5YS5iaGF0aWFAaW50ZWwuY29tPg0KPiA+Pj4+IFNlbnQ6
IDE1IE1heSAyMDI1IDE1OjE5DQo+ID4+Pj4gVG86IFJvcGVyLCBNYXR0aGV3IEQgPG1hdHRoZXcu
ZC5yb3BlckBpbnRlbC5jb20+DQo+ID4+Pj4gQ2M6IEludGVsIFhFIExpc3QgPGludGVsLXhlQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZz47IFVwYWRoeWF5LCBUZWphcw0KPiA+Pj4+IDx0ZWphcy51cGFk
aHlheUBpbnRlbC5jb20+OyBHaGltaXJheSwgSGltYWwgUHJhc2FkDQo+ID4+Pj4gPGhpbWFsLnBy
YXNhZC5naGltaXJheUBpbnRlbC5jb20+OyBCaGF0aWEsIEFyYWRoeWENCj4gPj4+PiA8YXJhZGh5
YS5iaGF0aWFAaW50ZWwuY29tPg0KPiA+Pj4+IFN1YmplY3Q6IFtQQVRDSF0gZHJtL3hlL2d1Yzog
TWFrZSBjcmVhdGlvbiBvZiBTTFBDIGRlYnVnZnMgZmlsZXMNCj4gPj4+PiBjb25kaXRpb25hbA0K
PiA+Pj4+DQo+ID4+Pj4gUGxhdGZvcm1zIHRoYXQgZG8gbm90IHN1cHBvcnQgU0xQQyBhcmUgZXhl
bXB0ZWQgZnJvbSB0aGUgR3VDIFBDDQo+ID4+Pj4gc3VwcG9ydC4NCj4gPj4+PiBUaGUgR3VDIFBD
IGRvZXMgbm90IGdldCBpbml0aWFsaXplZCwgYW5kIG5laXRoZXIgZG8gaXRzIEJPcyBnZXQNCj4g
Pj4+PiBjcmVhdGVkLg0KPiA+Pj4+DQo+ID4+Pj4gVGhpcyBjYXVzZXMgYSBwcm9ibGVtIGJlY2F1
c2UgdGhlIEd1QyBQQyBkZWJ1Z2ZzIGZpbGUgaXMgc3RpbGwNCj4gPj4+PiBiZWluZyBjcmVhdGVk
Lg0KPiA+Pj4+IFdoZW5ldmVyIHRoZSBmaWxlIGlzIGF0dGVtcHRlZCB0byByZWFkLCBpdCBjYXVz
ZXMgYSBOVUxMIHBvaW50ZXINCj4gPj4+PiBkZXJlZmVyZW5jZSBvbiB0aGUgc3VwcG9zZWQgQk8g
b2YgdGhlIEd1QyBQQy4NCj4gPj4+Pg0KPiA+Pj4+IFNvLCBtYWtlIHRoZSBjcmVhdGlvbiBvZiBT
TFBDIGRlYnVnZnMgZmlsZXMgY29uZGl0aW9uYWwgdG8gd2hlbg0KPiA+Pj4+IFNMUEMgZmVhdHVy
ZXMgYXJlIHN1cHBvcnRlZC4NCj4gPj4+Pg0KPiA+Pj4+IFN1Z2dlc3RlZC1ieTogTWF0dCBSb3Bl
ciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBBcmFk
aHlhIEJoYXRpYSA8YXJhZGh5YS5iaGF0aWFAaW50ZWwuY29tPg0KPiA+Pj4+IC0tLQ0KPiA+Pj4+
IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19kZWJ1Z2ZzLmMgfCAxNyArKysrKysrKysrKysr
Ky0tLQ0KPiA+Pj4+IMKgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pDQo+ID4+Pj4NCj4gPj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d1Y19kZWJ1Z2ZzLmMNCj4gPj4+PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndWNfZGVidWdm
cy5jDQo+ID4+Pj4gaW5kZXggZjMzMDEzZjhhMGYzLi4wYjEwMmFiNDZjNGQgMTAwNjQ0DQo+ID4+
Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19kZWJ1Z2ZzLmMNCj4gPj4+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZ3VjX2RlYnVnZnMuYw0KPiA+Pj4+IEBAIC0xMTMsMjMg
KzExMywzNCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9pbmZvX2xpc3QNCj4gPj4+PiB2Zl9z
YWZlX2RlYnVnZnNfbGlzdFtdID0gew0KPiA+Pj4+IMKgwqDCoMKgwqDCoMKgwqB7ICJndWNfY3Ri
IiwgLnNob3cgPSBndWNfZGVidWdmc19zaG93LCAuZGF0YSA9IGd1Y19jdGIgfSwNCj4gPj4+PiB9
Ow0KPiA+Pj4+DQo+ID4+Pj4gKy8qIEZvciBHdUMgZGVidWdmcyBmaWxlcyB0aGF0IHJlcXVpcmUg
dGhlIFNMUEMgc3VwcG9ydCAqLyBzdGF0aWMNCj4gPj4+PiBjb25zdA0KPiA+Pj4+ICtzdHJ1Y3Qg
ZHJtX2luZm9fbGlzdCBzbHBjX2RlYnVnZnNfbGlzdFtdID0gew0KPiA+Pj4+ICvCoMKgwqDCoMKg
wqDCoHsgImd1Y19wYyIsIC5zaG93ID0gZ3VjX2RlYnVnZnNfc2hvdywgLmRhdGEgPSBndWNfcGMg
fSwNCj4gPj4+PiB9Ow0KPiA+Pj4+ICsNCj4gPj4+PiDCoC8qIGV2ZXJ5dGhpbmcgZWxzZSBzaG91
bGQgYmUgYWRkZWQgaGVyZSAqL8KgIHN0YXRpYyBjb25zdCBzdHJ1Y3QNCj4gPj4+PiBkcm1faW5m
b19saXN0IHBmX29ubHlfZGVidWdmc19saXN0W10gPSB7DQo+ID4+Pj4gwqDCoMKgwqDCoMKgwqDC
oHsgImd1Y19sb2ciLCAuc2hvdyA9IGd1Y19kZWJ1Z2ZzX3Nob3csIC5kYXRhID0gZ3VjX2xvZyB9
LA0KPiA+Pj4+IMKgwqDCoMKgwqDCoMKgwqB7ICJndWNfbG9nX2RtZXNnIiwgLnNob3cgPSBndWNf
ZGVidWdmc19zaG93LCAuZGF0YSA9DQo+ID4+Pj4gZ3VjX2xvZ19kbWVzZyB9LA0KPiA+Pj4+IC3C
oMKgwqDCoMKgwqDCoHsgImd1Y19wYyIsIC5zaG93ID0gZ3VjX2RlYnVnZnNfc2hvdywgLmRhdGEg
PSBndWNfcGMgfSwNCj4gPj4+DQo+ID4+PiBZb3UgbmVlZCBmaXhlcyB0YWcgaGVyZSBpdCBzZWVt
cy4gV2l0aCB0aGF0LA0KPiA+Pg0KPiA+PiBBYm91dCB0aGlzLCB0aGVyZSBpcyBhIHNsaWdodCBj
b21wbGljYXRpb24uDQo+ID4+DQo+ID4+IFRoZSBvcmlnaW5hbCBwYXRjaCB0aGF0IGludHJvZHVj
ZWQgdGhpcyBpc3N1ZSBpcyB0aGlzIGNvbW1pdCwNCj4gPj4NCj4gPj4gYWFhYjU0MDRiMTZmICgi
ZHJtL3hlOiBJbnRyb2R1Y2UgR3VDIFBDIGRlYnVnZnMiKSBbMF0NCj4gPj4NCj4gPj4gVGhpcyBp
cyB0aGUgcGF0Y2ggdGhhdCBpbnRyb2R1Y2VkIEd1QyBQQyBkZWJ1Z2ZzIGZpbGUgYnV0IGRpZG4n
dA0KPiA+PiBhY2NvdW50IGZvciB0aGUgY2FzZSB3aGVuICJza2lwX2d1Y19wYyIgaXMgc2V0Lg0K
PiA+Pg0KPiA+Pg0KPiA+PiBCdXQsIHRoZSBndWMgZGVidWdmcyBoYXMgaGFkIG90aGVyIGNvbW1p
dHMgX2FmdGVyXyB0aGUgYWJvdmUgcGF0Y2gsDQo+ID4+IHdoaWNoIHJlZmFjdG9yIGluIHZhcmlv
dXMgd2F5cyBob3cgZ3VjIGRlYnVnZnMgaXMgYmVpbmcgaGFuZGxlZCBpbiBYZQ0KPiA+PiBkcml2
ZXIuDQo+ID4+DQo+ID4+DQo+ID4+IGUxNTgyNmJiM2MyYyAoImRybS94ZS9ndWM6IFJlZmFjdG9y
IEd1QyBkZWJ1Z2ZzIGluaXRpYWxpemF0aW9uIikgWzFdDQo+ID4+IDM4NzQ0NDk4NGQ3YiAoImRy
bS94ZS9ndWM6IERvbid0IGV4cG9zZSBHdUMgcHJpdmlsZWdlZCBkZWJ1Z2ZzIGZpbGVzDQo+ID4+
IGlmDQo+ID4+IFZGIikgWzJdDQo+ID4+DQo+ID4+IFNpbmNlIG15IHBhdGNoIGlzIGJhc2VkIGFm
dGVyIHBhdGNoZXMgWzFdLCBhbmQgWzJdICh3aGljaCBhcmUgbm90DQo+ID4+ICJmaXhlcyIsIGFu
ZCBoZW5jZSB3ZXJlIG5vdCBiYWNrcG9ydGVkIHRvIGFueSBwcmV2aW91cyBrZXJuZWwNCj4gPj4g
dmVyc2lvbiksIG15IHBhdGNoIHdpbGwgbm90IGJlICJiYWNrcG9ydC1hYmxlIiB0byB0aGUgb3Jp
Z2luYWwgcGF0Y2gNCj4gPj4gdGhhdCBuZWVkcyB0aGUgZml4IFswXS4NCj4gPj4NCj4gPj4NCj4g
Pj4gU28sIHdoYXQgc2hvdWxkIGJlIGRvbmUgaW4gdGhpcyBzaXR1YXRpb24/DQo+ID4NCj4gPiBJ
J2QganVzdCBhZGQgdGhlIGZpeGVzIHRvIHRoZSBvcmlnaW5hbCBwYXRjaC4gVGhlIHJlZmFjdG9y
cyB3aWxsIGhhdmUNCj4gPiB0byB0YWtlIHRoYXQgaW50byBjb25zaWRlcmF0aW9uIGlmIHRoZXNl
IGdldCBtZXJnZWQgZG93biB0aGUgcm9hZC4NCj4gDQo+IFBsZWFzZSBoZWxwIG1lIHVuZGVyc3Rh
bmQsIHdoYXQgZG8geW91IG1lYW55IGJ5ICJpZiB0aGVzZSBnZXQgbWVyZ2VkDQo+IGRvd24gdGhl
IHJvYWQiLg0KPiANCj4gZHJtLXhlLW5leHQoLWZpeGVzKSAodGhlIGJyYW5jaCB0aGlzIHBhdGNo
IGlzIGJhc2VkIG9uIHRvcCBvZikgaGFzIGJvdGggdGhvc2UNCj4gcmVmYWN0b3JpbmcgcGF0Y2hl
cyBtZXJnZWQuDQo+IA0KPiBIb3dldmVyLCB0aGUgdjYuMTUtcmM2IChhbmQgZHJtLXhlLWZpeGVz
KSBkbyBub3QuDQo+IA0KPiBQbGVhc2UgY29ycmVjdCBtZSBpZiBJIGFtIHdyb25nLCBidXQgdGhl
IG9ubHkgd2F5IEkgdW5kZXJzdGFuZCB0aGF0IHRoZSBmaXgNCj4gcGF0Y2ggY2FuIGJlIG1lcmdl
ZCBfYmVmb3JlXyB0aGUgcmVmYWN0b3JpbmcgcGF0Y2hlcywgaXMgdG8gZ28gdGhyb3VnaCBkcm0t
DQo+IHhlLWZpeGVzLg0KPiANCj4gSXMgdGhhdCB3aGF0IHlvdSBtZWFudD8NCg0KSSB0aGluayB3
aGF0IFN0dWFydCdzIG1lYW5pbmcgaXMgdGhhdCBqdXN0IGFkZCBmaXhlcyB0byBvcmlnaW5hbCBj
b21taXQsIHRoZSBjb21taXQgd2hpY2ggZmlyc3QgaW50cm9kdWNlZCB0aGlzIGRlYnVnZnMgZW50
cnkuDQoNClRlamFzDQo+IA0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxz
dHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+ID4NCj4gPiBUaGFua3MsDQo+ID4gU3R1YXJ0DQo+
ID4NCj4gPj4NCj4gPj4NCj4gPj4gUmVnYXJkcw0KPiA+PiBBcmFkaHlhDQo+ID4+DQo+ID4+DQo+
ID4+IFswXToNCj4gPj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjUwMTE0MjMyNDQz
LjExMzUzNTUtMS1yb2RyaWdvLnZpdmlAaW50DQo+ID4+IGVsLmNvbS8NCj4gPj4NCj4gPj4gWzFd
Og0KPiA+PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA0MDMxNDI2MzUuMTgyMS0y
LW1pY2hhbC53YWpkZWN6a29AaW4NCj4gPj4gdGVsLmNvbS8NCj4gPj4NCj4gPj4gWzJdOg0KPiA+
PiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA0MDMxNDI2MzUuMTgyMS0zLW1pY2hh
bC53YWpkZWN6a29AaW4NCj4gPj4gdGVsLmNvbS8NCj4gPj4NCj4gPj4NCj4gPj4NCj4gPj4+IFJl
dmlld2VkLWJ5OiBUZWphcyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiA+
Pj4NCj4gPj4+IFRlamFzDQo+ID4+Pj4gwqB9Ow0KPiA+Pj4+DQo+ID4+Pj4gwqB2b2lkIHhlX2d1
Y19kZWJ1Z2ZzX3JlZ2lzdGVyKHN0cnVjdCB4ZV9ndWMgKmd1Yywgc3RydWN0IGRlbnRyeQ0KPiA+
Pj4+ICpwYXJlbnQpwqAgew0KPiA+Pj4+IC3CoMKgwqDCoMKgwqDCoHN0cnVjdCBkcm1fbWlub3Ig
Km1pbm9yID0gZ3VjX3RvX3hlKGd1YyktPmRybS5wcmltYXJ5Ow0KPiA+Pj4+ICvCoMKgwqDCoMKg
wqDCoHN0cnVjdCB4ZV9kZXZpY2UgKnhlID3CoCBndWNfdG9feGUoZ3VjKTsNCj4gPj4+PiArwqDC
oMKgwqDCoMKgwqBzdHJ1Y3QgZHJtX21pbm9yICptaW5vciA9IHhlLT5kcm0ucHJpbWFyeTsNCj4g
Pj4+Pg0KPiA+Pj4+IMKgwqDCoMKgwqDCoMKgwqBkcm1fZGVidWdmc19jcmVhdGVfZmlsZXModmZf
c2FmZV9kZWJ1Z2ZzX2xpc3QsDQo+ID4+Pj4NCj4gPj4+PiBBUlJBWV9TSVpFKHZmX3NhZmVfZGVi
dWdmc19saXN0KSwNCj4gPj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBhcmVudCwgbWlub3IpOw0KPiA+Pj4+DQo+ID4+
Pj4gLcKgwqDCoMKgwqDCoMKgaWYgKCFJU19TUklPVl9WRihndWNfdG9feGUoZ3VjKSkpDQo+ID4+
Pj4gK8KgwqDCoMKgwqDCoMKgaWYgKCFJU19TUklPVl9WRih4ZSkpIHsNCj4gPj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGRybV9kZWJ1Z2ZzX2NyZWF0ZV9maWxlcyhwZl9vbmx5
X2RlYnVnZnNfbGlzdCwNCj4gPj4+Pg0KPiA+Pj4+IEFSUkFZX1NJWkUocGZfb25seV9kZWJ1Z2Zz
X2xpc3QpLA0KPiA+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHBhcmVudCwgbWlub3IpOw0K
PiA+Pj4+ICsNCj4gPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKCF4ZS0+
aW5mby5za2lwX2d1Y19wYykNCj4gPj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoGRybV9kZWJ1Z2ZzX2NyZWF0ZV9maWxlcyhzbHBjX2RlYnVnZnNfbGlz
DQo+ID4+Pj4gdCwNCj4gPj4+PiArDQo+ID4+Pj4gQVJSQVlfU0laRShzbHBjX2RlYnVnZnNfbGlz
dCksDQo+ID4+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcGFyZW50
LCBtaW5vcik7DQo+ID4+Pj4gK8KgwqDCoMKgwqDCoMKgfQ0KPiA+Pj4+IMKgfQ0KPiA+Pj4+DQo+
ID4+Pj4gYmFzZS1jb21taXQ6IDNkNjY3MGZhYjY0Y2IwMGI1ZTZlZDgwZDI1MTcxNDdkYjUzM2Zh
ZjENCj4gPj4+PiAtLQ0KPiA+Pj4+IDIuNDMuMA0KPiA+Pj4NCj4gPj4NCj4gPg0KDQo=
