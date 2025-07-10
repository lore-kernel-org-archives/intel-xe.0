Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CB7C83F09
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 05:54:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BEB310E17E;
	Thu, 10 Jul 2025 05:54:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FBLZoNGL";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C47E10E17E
 for <intel-xe@lists.freedesktop.org>; Thu, 10 Jul 2025 05:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1752126859; x=1783662859;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=KoV+GmB+D12A4vdoDQ6w1BckJCkj+FGCsXqNnN3mZh4=;
 b=FBLZoNGLVtEYFIbhtBgyN8m5dnzgdrMe8mKbeP6BfLAGIMaBJ0HGUa8g
 q7uY/Qgbx3jsWg7eYGyX+nqm+E2yDbiGwOapmUkVxDwAzCDYa5mUiKEm6
 TDNIZGuiO7VfgwhJJDaaM4tKPZrbl3jwA9cV1slMic6D+VEV7e/dK8E34
 gwt+wEnV8zuCb9hz7QomUeqHS8ycPZIY7lRt6x+UNx+lH+r2qJbvveTXQ
 16DEQnFLCXKAKWVRSqWsffDfi8hjMu8zre6e9fERpoFGJZNedIyRutEUy
 l7we9Ec8w4o1OBqS3x9CA+lp5VRSF66WwM+hHcn8NyLSgNiwfkylwXB6b g==;
X-CSE-ConnectionGUID: 3cjDIYp2T1m7F0ETjrFLOg==
X-CSE-MsgGUID: KisQTkkKQmm4A6FdxmXDYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11489"; a="65848315"
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="65848315"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 22:54:19 -0700
X-CSE-ConnectionGUID: ez05gYtrT+ua2OYQcxDOzQ==
X-CSE-MsgGUID: aY76m3vITJqyzozjnnCy/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,299,1744095600"; d="scan'208";a="160520476"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2025 22:54:18 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 22:54:18 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 9 Jul 2025 22:54:18 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.51)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 9 Jul 2025 22:54:17 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MNZckFAYkgO8JZaBbpD6hqLIjz0qfj6CTQRAy9doDdZyxrapQxbS+OZKhohEgRWtL4UfIBfel3KfORExp2H+MM7bl+dXJRZ1WdxuxBgfzmJY0MklzoFswnlzrtRHv+PluZI7Z0ZNFLYLPyciXi8Eo+R4jnDlkydNV8x0ku4bjrdSj5BRuZQbVERp9uJ3ICfMlMSnuSrK5xTZ8ECwtSaO2e9Dq0eKcy0pBwM/INOkOaytZnaJ+/xumi9Gf3uKgUolo7yOaxCpIg6DcQTYu7lsGyaobgYcP6PU7dwkdEShk6PjZiTPdSRUzxQ0vqsL2f7P/+ojuukUyYiY1uJwkD6ZRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Su84VXUbECND7DuUcWqLLqlUCkm2EWipJttLEUS5OR0=;
 b=Ud4nwrx0bsC33MyilNRy95d2grz82YCkIs0viUgL88CUBWAhHdr3GKV47uR5GdjnbldYfaQ0wByCuJhcEba/k9HQ41/Xby4VNZsXLwSlJ6OIt6d1pTOS17zgEV7/0yEu7ci7DfH9zENuFKFsYvLcJbBeLvyLtm15jnNcU6lZ3L2oiMInn1mOrB+EY845X4zkz3vyRPyLSPpFHWo+U/LlM75EzlRGPgVIrv/d2VeCXXhS2clA3sonzvWbw04QSDjuc0Wb195YAtL4N/wzUZN5w/rk1EUD3cJTkdeGLocSTeaNkW2i46FMIei7g0pIOu5bu2n6OhtJvmvLeOV5WcVRzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA3PR11MB9421.namprd11.prod.outlook.com (2603:10b6:208:578::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8901.26; Thu, 10 Jul 2025 05:54:15 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%6]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 05:54:15 +0000
Message-ID: <b29da4bf-d10a-467c-9a05-a21526a73910@intel.com>
Date: Thu, 10 Jul 2025 11:24:07 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] drm/xe: Add support to handle hardware errors
To: "Summers, Stuart" <stuart.summers@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Jadav, Raag" <raag.jadav@intel.com>, "Anirban, Sk"
 <sk.anirban@intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 "Scarbrough, Frank" <frank.scarbrough@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Nerlige Ramappa, Umesh"
 <umesh.nerlige.ramappa@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
 <20250702141118.3564242-6-riana.tauro@intel.com>
 <c88e95d8ccd5d780a280db135a49df68bf318662.camel@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <c88e95d8ccd5d780a280db135a49df68bf318662.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0175.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::10) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA3PR11MB9421:EE_
X-MS-Office365-Filtering-Correlation-Id: ab0caae0-8fbc-49dd-67f3-08ddbf763404
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlFQZW56WFJabnB6ZitrTHNHSW11ZmhHNSt1WEg0bjcvNmdaZnBHNnB2Rlox?=
 =?utf-8?B?TDRlT1Z2RWV5Y3BLS3RTeEJkM0IweElEMFBwaDVYNFhpaGFuSTRjWTQvd0xh?=
 =?utf-8?B?ZG51aklEd3hpTGw5NDl1ak5IZGlkRVhqdnlMd1N4bkpFSW5jZzBta2YxT0pF?=
 =?utf-8?B?SmFobm1reVNqSFh3YWtvNXJFN0VPVWdiRGl0bkhCbERNM1NnVGlkMnB6L3Qy?=
 =?utf-8?B?OVJBTW5iNnorclBvZ05YdUlVYWNhdDgvMTlySEJVSnRQMEpkRytRNVE4TU0v?=
 =?utf-8?B?eDhMSFpqMU9uOXNUcEUwRkRoSE0ydVZqNzQ0cTFnQjVTZkNzZjZOT0VBeDFU?=
 =?utf-8?B?MjdzZUVtVnpyZGtCSXpUZitURDlWcWpteWlJRUJPUkc2KzN3bGsvY0JEZFhJ?=
 =?utf-8?B?Nkg0NHJKNjlQUGx5Q0N0Q1pqMGZGSGZsbDRlcmp2NGVkdHhFVWo0aDMxMVg2?=
 =?utf-8?B?TjhMSGN3T3hDUGY2aUw2MUJWZHRBMlF5SUxydFBVRXBxdnRCeGx5alViTlNz?=
 =?utf-8?B?c3V3KzVLeHA0UU5vWlVIcGZpRTZPNDJ1N05SaGEzeUd2WGtQZFJCSkgrbStO?=
 =?utf-8?B?cTBMcDJRaTlMNnZadmMzOHZzaWZ3WmZoakpLa3REekRZYnExNEVyYWlwWEcr?=
 =?utf-8?B?MzU2WUM1UzBaRDVuNW9qckl1Y0FHTXRBc2p6YW1BTDMyTzQ4Z2hYV3dqeXA4?=
 =?utf-8?B?emRGTzlyT0FUK0VBRXJiWTY0YVk3aUpyR0NhaitHd04raE5wS2xNZSsyQlpS?=
 =?utf-8?B?WlVtSWg3YnNxOHIvbHRuTzJ3WGt0Qms4Z2ttalN5VHNHVlNOTWovdkZXRFZI?=
 =?utf-8?B?Njc2bElNb01zNFRmMjAvendiUHk4MTFuU0FKL1hyeTNVR2RhV2RDeVdqS3BW?=
 =?utf-8?B?WGxKR0htVlo5aVhhS1Fya3NPckU1YTN2dCtxRldYSHpQWGpDbzV2SWR4L0hj?=
 =?utf-8?B?eUR0M3I5WFRwc2ozYjRoTEtWb2JJZStGQmt6YXRvTXFaZzRFNGNlTDVMM2FQ?=
 =?utf-8?B?UXZNdWxIQ2FpRmhrUWNHbVFYbTZ1bThrb1ltU2k1L2dIY0FLZDRvS2svM1ps?=
 =?utf-8?B?MHVTdTFqbVRFK2IvWktnVnJJL2RBTEdJTWlkb2pKQytYbk1teE9oanpKRDBr?=
 =?utf-8?B?dnRIeXM3d3dCcEoxdFV3QTVqcDNEMGFxV1NFRXhCNWN1Y0U0M0FJbGgzZFBj?=
 =?utf-8?B?ZlJ4WkR0N21lVGdCdllrNXhuZ3duZ1dhMis0OUhkbmkzZmEyeVh0bjJnQWg2?=
 =?utf-8?B?aFh0N21CWHRWbDFxOVdBUDZaVU1Zb2NQUWgrWWdzKzhiY3RqZ25EQlRLMFNF?=
 =?utf-8?B?ZWFmT01RVGN3ZlNPd3pYV1N5UnZuMnJobXk2M1NzTkxPR0V3QjUrenpHQVdx?=
 =?utf-8?B?YUViQnE1QUpVZnBzRWtOeUwzSjJJbUFsNHVrSG42Q2FpYVNQMUdNWEd3UXpy?=
 =?utf-8?B?enhyLzRkLzNnNHloQ2NXSFBxS1FYeElEUGphSytZalE5bUo3eXAva0RBZDZW?=
 =?utf-8?B?NDZDR0FCRTdDcnYyaUQ3bFFMdFp0VHZMSkxXUjhoeHN3NkNpQjlNU1VaMFZr?=
 =?utf-8?B?WGU0QUNiS0QyaEw1ZDZNUUtrc1lyU1ZOY0psWkpGTFVZVWpoMzlnMndLa2tp?=
 =?utf-8?B?bEFMdS9kWThyai9kY1N2ZW9KT0xONEpqSXZHOUNOeXdDaEs1VWlha2VPM2dP?=
 =?utf-8?B?SHROaUZ2TjJRQ2R1ZGxXNnhjQ3EzUVg4a0lMQTQycXc4TCtCQ2hwU3VKaGVS?=
 =?utf-8?B?Qlk5N0VERjNMdUF3NjY4R2pzc01sOHZlZE02SjI4VTNIcitNKzdwL3hKdnFL?=
 =?utf-8?Q?cFYXQe9PX+via4RgilO5iJIhl2U3Xw+U0ywvM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bUNTMEJyQXRSRmYvRkIra1ZzWjNkd1h0bVd6cmdVNEJocXlOZUI3RFIzbk1U?=
 =?utf-8?B?UWxuRmxFcm1HUHV1OVJkdEk3RXRoVmV5VzIva2EzTDEvUDRuVGlreHoybGI4?=
 =?utf-8?B?emo2QUpkYTkxN2g5aVJpMUx1c0I5dUFyNHBXRXJtYlczMkdpMHlSeXlhcFd2?=
 =?utf-8?B?Q2E0ckZod2xidEFnK3RJOHhENnh4bkRlYmF3a1d4ZjBRRXZ4NWVrNFlXWTU4?=
 =?utf-8?B?dmxTQnBBY3VYSzBWU2h2MklDbXF1WTdieThOUWZDbjI2ZTZyOXZoQjNEZ2dq?=
 =?utf-8?B?c0hqR2NvOHkzdzVYM1RiSklSQ1lncDYwVzFXTXA1bDhvaDBoVmJMTlc2S0hq?=
 =?utf-8?B?dWR3MHRaSktSM3dsaVVKb3dXT0JUaTl5SkxraFNiN25uUk04aUExYkNSUUR4?=
 =?utf-8?B?TDE1MVJCeGNiRG9KRFR1SUJ6ak1WeC9PVmZxcnZVaUt5cmNiNGtiRy9aOEVK?=
 =?utf-8?B?L0xGKzY0QVdPS1VxY0N6SU1PWFdLSUQzZXVGdVlyZm5mU1ZUM1VLR09SMnlz?=
 =?utf-8?B?Nm4rSnk1OFljbndQVFU2RGo0b0hUMVBNUjQ0N0RRckhnMHZsU3ZSSHRCZktS?=
 =?utf-8?B?ekxGak1hL2Q0TVpLc3VuWDBuK0NBWk5YUXBiOUhwNTBlQW9XVWtkNnNEVUpD?=
 =?utf-8?B?SG9EM2tPRU5QaUU4VDBFS0VQSVJKbDdBTHNUdk9DRXpmaElrQktKVnZrVkhP?=
 =?utf-8?B?QkRSbjJrKzM4bmV0WG9xZ05uZTQyVEVZKzBmU3c0a216MDdabjZTaG5YQ09Y?=
 =?utf-8?B?NUo1Rk9GbzlWQVJJTTFMUHI1VGVrbWtaU2ZRQmMwekI4dVEwLzZyb1c2ZHVs?=
 =?utf-8?B?WkcvbU1pb1c0ZC9kaHk1eXpOc2FkQmxSbkRXUWw2R0hCdHRFb2IxdXhTQ1gr?=
 =?utf-8?B?dlZKT0N1UHBPS2ZPQW5IamgyVW9vcnFZYnBWdC9LOUFrYi9qWGxzMkJzM2RN?=
 =?utf-8?B?TDFocVlKMDVjb01RREl2VGZINzQ1b21aeHFoaUQyQ1FXK01ta0svM3hxVUpF?=
 =?utf-8?B?N3hDQVdiR0s1bmtBYTVxMnBISFVWTUdnM1NtK215QnlpTk5TL0lqb2xuME8w?=
 =?utf-8?B?VnFYbGU0Rm5MaDJrOGQzZjVKTDc5N3lzL1FGek9Sc2lDZENHRG5TdG5NTlZ4?=
 =?utf-8?B?c3o0amJQNUFMMk9vQkdiY0l5SXpoKzhwdHJsRkhtbUlNQkU2MklKVVVZM20x?=
 =?utf-8?B?NGNWTUZJTGR2NmFUN1JXQkJrN0hGbWh3OHNwc1paOHZGOFFNbm1zYWt5T3E5?=
 =?utf-8?B?aVBzbTNaOWFFS2ZTdktlaEtqNDlBZXk4MTFxRWh5VEJKRVVLcjR2VlhIMkwv?=
 =?utf-8?B?b2pZVitqaW00V1NmOThPRHVTM3N2NU92cVpGTnp2dmZmNTVOOFZLcVgyWnBY?=
 =?utf-8?B?SHliVHRGR3NvNDArM0MycXI0aUpGVENNelJ0aStabWtOWGNyUjZlOGlHZ1hh?=
 =?utf-8?B?RTJFbGlGL25sQi9vVGJOMVFHZ3RWdFV2bVIyRC84eThLVEE4clVzM0Y4U3pz?=
 =?utf-8?B?VjFiUnVqMHZlWW11WFlDZW0yY0xkdFc5RmxCMWhzSkpNYWtHYmJOVDI5S2J2?=
 =?utf-8?B?RThQT09JNEF2aDN4aFREOC9vaDl2bmhEdzFYQnZvTGNNN0NnTlgrOHdJUUh1?=
 =?utf-8?B?bEc5NDVBa0tLb1VlSitjVlU5YUlKd3BxNHVYWStjRitjNm9JMXFickp4WnB1?=
 =?utf-8?B?Z0ZnYlI0K0txb0Y1bkllL2FacTBua0RFQ0MvZkFQcFB3bUZzUDVWSmtHSC9D?=
 =?utf-8?B?U2pEUVJnRDZXQmtlVm5WeGNvNTMwZlNKdklzZHR4WExxczBsbGRzQXd5TlNF?=
 =?utf-8?B?eDdoemUzaGxvb0s3cHNhYzNaR0diMWtGb0N1L3VBSS9STkdtVWdId21vK3V0?=
 =?utf-8?B?aWdVYXFFYUdLMDRHZHJQV2pxNm9BcUpPMDg3VlFybWdycXEzSENUNy9vT0No?=
 =?utf-8?B?VUQ5eWdJaCtHeDdpMkRSSlRmVXM0K0FPeTFqKzJjbXZMQy9RakphS2JueTlz?=
 =?utf-8?B?SW9JL3FYOE8xSzQyUXcrejFKLzNBdm82ZkNzN012bjZ0V1lvWkwxNFBtUmgw?=
 =?utf-8?B?cTdCQ0hpb0tLNDdoVXE5NjZFTW1rVlpBdU5jZCtKalpJSS83SS9vMS9BRHIz?=
 =?utf-8?Q?OdxmsTnmGJMcOIMcAFBGih5AM?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ab0caae0-8fbc-49dd-67f3-08ddbf763404
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 05:54:15.7739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s4wjoqypKqRSXHGiGex0QjNHVbTdY6o10FbzlOfYFO23H5qqhj3lfrQfqhM9K+90kJnI2s37IGodufFTQ2ELJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9421
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


Hi Stuart

On 7/9/2025 10:57 PM, Summers, Stuart wrote:
> On Wed, 2025-07-02 at 19:41 +0530, Riana Tauro wrote:
>> Gfx device reports two classes of errors: uncorrectable and
>> correctable. Depending on the severity uncorrectable errors are
>> further classified as non fatal and fatal
>>
>> Correctable and non-fatal errors are reported as MSI's and bits in
>> the Master Interrupt Register indicate the class of the error.
>> The source of the error is then read from the Device Error Source
>> Register. Fatal errors are reported as PCIe errors
>> When a PCIe error is asserted, the OS will perform a device warm
>> reset
>> which causes the driver to reload. The error registers are sticky
>> and the values are maintained through a warm reset
>>
>> Add basic support to handle these errors
>>
>> Bspec: 50875, 53073, 53074, 53075, 53076
>>
>> Co-developed-by: Himal Prasad Ghimiray
>> <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Himal Prasad Ghimiray
>> <himal.prasad.ghimiray@intel.com>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile                |   1 +
>>   drivers/gpu/drm/xe/regs/xe_hw_error_regs.h |  15 +++
>>   drivers/gpu/drm/xe/regs/xe_irq_regs.h      |   1 +
>>   drivers/gpu/drm/xe/xe_hw_error.c           | 108
>> +++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_hw_error.h           |  15 +++
>>   drivers/gpu/drm/xe/xe_irq.c                |   4 +
>>   6 files changed, 144 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_hw_error.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_hw_error.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile
>> b/drivers/gpu/drm/xe/Makefile
>> index 1d97e5b63f4e..fea8ee3b0785 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -73,6 +73,7 @@ xe-y += xe_bb.o \
>>          xe_hw_engine.o \
>>          xe_hw_engine_class_sysfs.o \
>>          xe_hw_engine_group.o \
>> +       xe_hw_error.o \
>>          xe_hw_fence.o \
>>          xe_irq.o \
>>          xe_lrc.o \
>> diff --git a/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> new file mode 100644
>> index 000000000000..ed9b81fb28a0
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/regs/xe_hw_error_regs.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_HW_ERROR_REGS_H_
>> +#define _XE_HW_ERROR_REGS_H_
>> +
>> +#define DEV_ERR_STAT_NONFATAL                  0x100178
>> +#define DEV_ERR_STAT_CORRECTABLE               0x10017c
>> +#define
>> DEV_ERR_STAT_REG(x)                    XE_REG(_PICK_EVEN((x), \
>> +
>> DEV_ERR_STAT_CORRECTABLE, \
>> +
>> DEV_ERR_STAT_NONFATAL))
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> index f0ecfcac4003..2758b64cec9e 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_irq_regs.h
>> @@ -18,6 +18,7 @@
>>   #define GFX_MSTR_IRQ                           XE_REG(0x190010,
>> XE_REG_OPTION_VF)
>>   #define   MASTER_IRQ                           REG_BIT(31)
>>   #define   GU_MISC_IRQ                          REG_BIT(29)
>> +#define   ERROR_IRQ(x)                         REG_BIT(26 + (x))
>>   #define   DISPLAY_IRQ                          REG_BIT(16)
>>   #define   GT_DW_IRQ(x)                         REG_BIT(x)
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.c
>> b/drivers/gpu/drm/xe/xe_hw_error.c
>> new file mode 100644
>> index 000000000000..0f2590839900
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.c
>> @@ -0,0 +1,108 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include "regs/xe_hw_error_regs.h"
>> +#include "regs/xe_irq_regs.h"
>> +
>> +#include "xe_device.h"
>> +#include "xe_hw_error.h"
>> +#include "xe_mmio.h"
>> +
>> +/* Error categories reported by hardware */
>> +enum hardware_error {
>> +       HARDWARE_ERROR_CORRECTABLE = 0,
>> +       HARDWARE_ERROR_NONFATAL = 1,
>> +       HARDWARE_ERROR_FATAL = 2,
>> +       HARDWARE_ERROR_MAX,
>> +};
>> +
>> +static const char *hw_error_to_str(const enum hardware_error hw_err)
>> +{
>> +       switch (hw_err) {
>> +       case HARDWARE_ERROR_CORRECTABLE:
>> +               return "CORRECTABLE";
>> +       case HARDWARE_ERROR_NONFATAL:
>> +               return "NONFATAL";
>> +       case HARDWARE_ERROR_FATAL:
>> +               return "FATAL";
>> +       default:
>> +               return "UNKNOWN";
>> +       }
>> +}
>> +
>> +static void hw_error_source_handler(struct xe_tile *tile, const enum
>> hardware_error hw_err)
>> +{
>> +       const char *hw_err_str = hw_error_to_str(hw_err);
>> +       struct xe_device *xe = tile_to_xe(tile);
>> +       unsigned long flags;
>> +       u32 err_src;
>> +
>> +       if (xe->info.platform != XE_BATTLEMAGE)
> 
> Why is this only on BMG? I see these same bits available on other
> platforms, e.g. LNL.
> 
>> +               return;
>> +
>> +       spin_lock_irqsave(&xe->irq.lock, flags);
>> +       err_src = xe_mmio_read32(&tile->mmio,
>> DEV_ERR_STAT_REG(hw_err));
>> +       if (!err_src) {
>> +               drm_err_ratelimited(&xe->drm, HW_ERR "Tile%d reported
>> DEV_ERR_STAT_%s blank!\n",
>> +                                   tile->id, hw_err_str);
>> +               goto unlock;
>> +       }
>> +
>> +       /* TODO: Process errrors per source */
> 
> Should at least print the bits out on the initial implementation?

This patch is taken from 
https://patchwork.freedesktop.org/series/125373/ which was not merged 
due to absence of upstream consumer
Himal/Aravind can provide more details..

I have taken a single patch in this series to add support for
csc errors as it has recovery mechanism and a upstream consumer ie. fwupd.

The processing of all the bits according to source should be a separate 
series. I can retain the TODO and remove the bmg check

> 
>> +
>> +       xe_mmio_write32(&tile->mmio, DEV_ERR_STAT_REG(hw_err),
>> err_src);
>> +
>> +unlock:
>> +       spin_unlock_irqrestore(&xe->irq.lock, flags);
>> +}
>> +
>> +/**
>> + * xe_hw_error_irq_handler - irq handling for hw errors
>> + * @tile: tile instance
>> + * @master_ctl: value read from master interrupt register
>> + *
>> + * Xe platforms add three error bits to the master interrupt
>> register to support error handling.
>> + * These three bits are used to convey the class of error FATAL,
>> NONFATAL, or CORRECTABLE.
>> + * To process the interrupt, determine the source of error by
>> reading the Device Error Source
>> + * Register that corresponds to the class of error being serviced.
>> + */
>> +void xe_hw_error_irq_handler(struct xe_tile *tile, const u32
>> master_ctl)
>> +{
>> +       enum hardware_error hw_err;
>> +
>> +       for (hw_err = 0; hw_err < HARDWARE_ERROR_MAX; hw_err++)
>> +               if (master_ctl & ERROR_IRQ(hw_err))
>> +                       hw_error_source_handler(tile, hw_err);
>> +}
>> +
>> +/*
>> + * Process hardware errors during boot
>> + */
>> +static void process_hw_errors(struct xe_device *xe)
>> +{
>> +       struct xe_tile *tile;
>> +       u32 master_ctl;
>> +       u8 id;
>> +
>> +       for_each_tile(tile, xe, id) {
>> +               master_ctl = xe_mmio_read32(&tile->mmio,
>> GFX_MSTR_IRQ);
>> +               xe_hw_error_irq_handler(tile, master_ctl);
>> +               xe_mmio_write32(&tile->mmio, GFX_MSTR_IRQ,
>> master_ctl);
>> +       }
>> +}
>> +
>> +/**
>> + * xe_hw_error_init - Initialize hw errors
>> + * @xe: xe device instance
>> + *
>> + * Initialize and process hw errors
>> + */
>> +void xe_hw_error_init(struct xe_device *xe)
>> +{
>> +       if (!IS_DGFX(xe) || IS_SRIOV_VF(xe))
> 
> Again, why skipping integrated? It seems like this might also be viable
> for, for instance, LNL? Of course some of the bits might make less
> sense for those platforms if they are PCIe-specific. But at least
> printing the register on an error seems interesting.

Are you suggesting to print the raw value in a drm_err log?
I could add that and remove the dgfx check, but if it is processing
of the indiviual sources and keeping count then that should be a 
different series

Thanks
Riana

> 
> Thanks,
> Stuart
> 
>> +               return;
>> +
>> +       process_hw_errors(xe);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_hw_error.h
>> b/drivers/gpu/drm/xe/xe_hw_error.h
>> new file mode 100644
>> index 000000000000..d86e28c5180c
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_hw_error.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +#ifndef XE_HW_ERROR_H_
>> +#define XE_HW_ERROR_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_tile;
>> +struct xe_device;
>> +
>> +void xe_hw_error_irq_handler(struct xe_tile *tile, const u32
>> master_ctl);
>> +void xe_hw_error_init(struct xe_device *xe);
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_irq.c
>> b/drivers/gpu/drm/xe/xe_irq.c
>> index 5362d3174b06..24ccf3bec52c 100644
>> --- a/drivers/gpu/drm/xe/xe_irq.c
>> +++ b/drivers/gpu/drm/xe/xe_irq.c
>> @@ -18,6 +18,7 @@
>>   #include "xe_gt.h"
>>   #include "xe_guc.h"
>>   #include "xe_hw_engine.h"
>> +#include "xe_hw_error.h"
>>   #include "xe_memirq.h"
>>   #include "xe_mmio.h"
>>   #include "xe_pxp.h"
>> @@ -466,6 +467,7 @@ static irqreturn_t dg1_irq_handler(int irq, void
>> *arg)
>>                  xe_mmio_write32(mmio, GFX_MSTR_IRQ, master_ctl);
>>   
>>                  gt_irq_handler(tile, master_ctl, intr_dw, identity);
>> +               xe_hw_error_irq_handler(tile, master_ctl);
>>   
>>                  /*
>>                   * Display interrupts (including display backlight
>> operations
>> @@ -753,6 +755,8 @@ int xe_irq_install(struct xe_device *xe)
>>          int nvec = 1;
>>          int err;
>>   
>> +       xe_hw_error_init(xe);
>> +
>>          xe_irq_reset(xe);
>>   
>>          if (xe_device_has_msix(xe)) {
> 
