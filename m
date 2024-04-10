Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 341EBCD11C2
	for <intel-xe@archiver.kernel.org>; Wed, 10 Apr 2024 13:49:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B989B10EAE3;
	Wed, 10 Apr 2024 13:49:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DSuhxI2J";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97EF110EAE3
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Apr 2024 13:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712756985; x=1744292985;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=L67MDPW0G5KT9BYe3Im3eJkxOTLy86g9kZLzax02UrU=;
 b=DSuhxI2JlMPxR+p9wWHffZ5rWllsmDa3ROTE0JaFwhSulmKHZS1+tQHY
 ChGs3YBcbPRGr02a1bLTKT+IPqW+t943XENE4cnOf+vuuQOP8Y9XJyOJi
 /Qxy/LpY8/hpx8rUqhq4DcDf0otj13Zff2X4rgqu8kToRHLvErfLv6ra6
 q5sT6p7FuXMQSkvn8mfxGPOsoajEj8A1dlE0HycH4nVK7rhO33E8Fcx+g
 gXcGvbyXdHmMWZUWzQMgxseKD1ZWK5OjC292LBfmBJO594VhHvcAOF0r1
 aqJvfTtgMjQpAGuKdQyQkBNUjqXUxRpZsyqMfvrAUzQ5peH1kyMQFQSEc w==;
X-CSE-ConnectionGUID: NOJIE6AeSJukY+83KIUzpg==
X-CSE-MsgGUID: Giuhs0qqTvyi7zau+jvikw==
X-IronPort-AV: E=McAfee;i="6600,9927,11039"; a="8243817"
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; 
   d="scan'208";a="8243817"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2024 06:49:39 -0700
X-CSE-ConnectionGUID: 3kaH7rCjT/Gzn+EyYKOlCA==
X-CSE-MsgGUID: KwSHOGRYQrWeYFy/taXLpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,190,1708416000"; d="scan'208";a="25078132"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 10 Apr 2024 06:49:38 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 06:49:37 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 10 Apr 2024 06:49:37 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 10 Apr 2024 06:49:37 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.171)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Wed, 10 Apr 2024 06:49:37 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QCE8Hcd1uxAng8Fn5UBQbhoXyzj59HewPjuUkXTzu5o456oZWvgARNYqAXZlhmkgkH3h6OxsEzKzLtho2vmkDWiH8p4y9wHQ+9DzAr8M/K9aRlBe3cIgF+V8TncvUrIVZeAsj2NKYMReNt8Vd2oLZlq5bR3UPT1lCDYGfHx/CxCSuBmHCTwmzvTol/iaEDahZsbpZXnoCdwTppzo9NMnd04+4Rer0Y+cwSJr7dOMN4f91CRWjD2DolFIlV9N287/gRH72pW61Pq5z7ovqU2QvYR7yTiGwqIFQa/HEATubNOIVcx92u0tjm7Fve4aLmWJFDjKMa2cPYHDPOldZ/+kKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fpQwDROJGzBQZ0REbldO3lz6izVHWugF4gj2m8wA04M=;
 b=dAc8mT5cBTo3+y1Zcc1UOg2QVtTqqf1TLuuugxQnRBV2BCKzJ2BHxUcD+N0KOLTL7+yCla1dQT72quoKu32pYcsTPlk/izcuNqLF8joYQv4Zo58WZT3yt1ob27uv98SvRa1QNmf2C+puStDP+6blQvYIvRVxswKilb919hTHY7Ryu3WAfOUaL9yVn9q+wzPbMRnw0VazANGuwCDqckID4kOlWyjQCGnWNwBgfQUrRpdcAUf8aFX3/wEmcwFISUkInlPQZ98xHS/dpdXsNNGuRfqg+3/LzB0lfQAtefGJMbHBJ2m7u8mviM0Xd6dnp+UJ5RHpzDm7nw5hzCjRSMHPdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ2PR11MB7501.namprd11.prod.outlook.com (2603:10b6:a03:4d2::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.26; Wed, 10 Apr
 2024 13:49:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7452.019; Wed, 10 Apr 2024
 13:49:34 +0000
Date: Wed, 10 Apr 2024 08:49:31 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>
Subject: Re: [PATCH v2 2/4] drm/xe: Incase of action add failure, remove
 sysfs only once.
Message-ID: <myprxvssrrulycavnwvwta2jara56rydqynzo6ddtf6xo7mnwa@y73nd3slazwc>
References: <20240408144944.604448-1-himal.prasad.ghimiray@intel.com>
 <20240408144944.604448-3-himal.prasad.ghimiray@intel.com>
 <atf7fcy2ignoudayaogol7v3bk5qcxmpmjtseltdbcyykzm55n@x2mwopb74dns>
 <cbe92280-f46d-42a9-acb4-35e080844562@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <cbe92280-f46d-42a9-acb4-35e080844562@intel.com>
X-ClientProxiedBy: SJ0PR03CA0159.namprd03.prod.outlook.com
 (2603:10b6:a03:338::14) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ2PR11MB7501:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BuejhTUsegRjZvr57fV7ZZreVxvUpnDRSXYOnY+whFHp9xAclxh4mywQvtZHJTYVwlgJwmRbc/Jk2aRsU0NbIo7EqphLMARbqvPDrwA5ZGtTduei9xeLqHUFT8zDHVWRXXUDZlZZC4TS991d8XNlYmwFHg1QdBUx+oG3zLZ972dX8nqBWNwQ78ElFmQjslmGiig9F+ZGR9psDfF8WRkKzT8/QueHnFbZWdRsbzgzMEPJmbS3VlqWSbw9rmXwTv2ucjiJuFqCYBod5JYzE2WXt3/lC/W1SYsQ1CYjNW1HH9+8XU4FnryBkazVasHqKsMTR9QWksoahsZKpZagX2DTMpGgkq4r7ICcG+u/B09Vql5BAYBgwtCKg0/J/eUnzFI3qS9R08OP6hIfdXUge3njYBUwigDWMLPUXBOWlPGBXbC4Sb3Zp8609vSdYCMXblrxtjj+UBVgvWVUaAbv9+WbazPBVlMWJDXKqd5epZJADtQ88ZhYkQlrO8+oDbnVxafvXlWtVo8IyXNdWb+/7R46QNT+jyvGNG+K3Np5wxqpvvuhxUVcYu3gGuxpfqEEDZDKoDoHnqLOtWZQcBpco1uU3sZ1uy++C38xKMyGGXjMx8r/Pl+P7E0RFbyTmh6ySkccEMRpRa8wwQcj7EoUQwoAaVnJOaNZlJfjoHn1LTHnGVw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Msn7ofhsMqUA8gPcGZNrOQcizekCpuDfk77LBavTDfIzMvNa5lgOnKqeO9u6?=
 =?us-ascii?Q?Vm4NpKMHXkK6vzIz26R+c1PxVOyGjVRJNS1/TBKBpCm6y2jKbpvOhryPfuBJ?=
 =?us-ascii?Q?M25AwqhoguQVe1YgiEwmPFBhs2gcde7k9bgiWAQuIQqMCbtCmQ7RYvhtyOM7?=
 =?us-ascii?Q?jdaFmLPUKjBYplIdpfaHj16zCVAi/PvHOSMkorl1ig0PQkUHe9SqWesibqEp?=
 =?us-ascii?Q?7FlONrNG/WhQDm7oRxj0aqGQZ4MaaoLYBMihlHyeZVRQNDjnbkHwrsQutWbN?=
 =?us-ascii?Q?0mMAOx7iPCup4Ty8JGDzJjnWhVwSNqIaAyEmkgjpjNFENAEv6+wa590uPv/6?=
 =?us-ascii?Q?9y0sapNCjk6ysZBHhoSfdS6uyAd1Ct3wCc5mnh9yt4SBPkEZUzKtVbddEV64?=
 =?us-ascii?Q?tGaU6ImdL1OJkTA36DdCj0LSfMYDCuf3YqGbD7pHk7PciK9slXonLZeO35i8?=
 =?us-ascii?Q?RhDpOlCXoSwzWdPDeshDuu1PkBNhHWs5AFA2VuquilewV1hl/jgFO9G2p8JV?=
 =?us-ascii?Q?IWAcbSCXgPP+WV0UIahp88rRenEVcsA0h/8murDsAlX2csgTaUx209M8PwvQ?=
 =?us-ascii?Q?eJ8SkJaV8IRKf6AdMixEW9iHkG5w3TS70YIpRwEWVUJfaXaNeU8rnO9cclz3?=
 =?us-ascii?Q?uU/csGLVFwH2pbPVqM0PyfkObe8y531JoKgtSiA4cfg1inifHvbvfCXpJilr?=
 =?us-ascii?Q?jWJGh2egv8oFbEnjxTXu4rycVhwaGO16SLdkn3eyv8J/1pbEB5sAmd2etc6s?=
 =?us-ascii?Q?2/ble/C7BvqKU00U83yWQXnkk3w5X1jf0b4xxHUC4MGyeLpeZrmxim/zMecm?=
 =?us-ascii?Q?2N8nv8PDBLNifY38j30Yw3IuCW7e5rKSidPls0o6vBGkrDLK+sYbX5u9Wnw/?=
 =?us-ascii?Q?hpPWmHsgHtEZPGHzptEuLb1uAmSkFcaO30Pquj9Txkr/B705Lq3zG/xCKmjA?=
 =?us-ascii?Q?S2xycMkkRCLpO+62Ma8Gp0R0Z6Anop/o1/s7vSWsY1/X6CD8AZEPENe3vp8X?=
 =?us-ascii?Q?SKwTKRzvqGSZ+3xG/sP+5oIv/LPMyaeBQuyRa0uAZ0gCBbb0o3qntBIbAc0J?=
 =?us-ascii?Q?y0D3u4HzlnHvezt+j6kMbrhtx5AteNf94+dl/zYwVO12BMSCMsx+yofamzKe?=
 =?us-ascii?Q?5uJ+ParEOLVBQw/EqbqH1zwqDKTl+Fh9taV+xpQo4HWHaUHH3tDDrzOTb+0s?=
 =?us-ascii?Q?AoeOMj/plxaRnA9AqsMDQkP9M5bkTm6cOkWOKSANrDX36Ivj8RAMArKqCZEH?=
 =?us-ascii?Q?8MiTMpohV5+IlJfVtXpRn8ZElkFA35PH67OPavPUCYEnjvEYHENySz74ZeLJ?=
 =?us-ascii?Q?+TuMOj2SJKg2g5Fptf0y2h3quX3X54vB6TpD0R8cSxCRDrpdNKozEtw2t1Ze?=
 =?us-ascii?Q?KDIFAV9BFfcdZItGNsL8gp2T1i+dunMHrSKNIuiNPxkxWOq1a5phu2evqthN?=
 =?us-ascii?Q?H0lw3mIOZLrK5KZliQFCDPmVVpM2L0cjZ18DSVyNbg/DnFsSKuHKgICxpTLB?=
 =?us-ascii?Q?PdMS3Zj079GnvNolUAw/GI0VIBepYq5vH4GyZPbHuidOQsAd/ZcXoKNwpCKe?=
 =?us-ascii?Q?Ns3t4lvyIJpSAk0u9JKe49Ni7xyvlTSrfIlCAHCDokQzoaUNaHHp2yqjCCCw?=
 =?us-ascii?Q?iw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2fddd273-1d2f-496c-4c9a-08dc59650e12
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2024 13:49:34.4052 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KRJyAsOFV4sJYDC/U/EBcCkB39BHqYuWQZzZldQjrAloknCys5kpnCH9rA594bqLZXgQOwPRRWtMF/8IcmYxcQkxUuD4GJHo2piN27v+f1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR11MB7501
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

On Wed, Apr 10, 2024 at 01:46:12PM +0530, Ghimiray, Himal Prasad wrote:
>
>On 10-04-2024 01:22, Lucas De Marchi wrote:
>>On Mon, Apr 08, 2024 at 08:19:42PM +0530, Himal Prasad Ghimiray wrote:
>>>The drmm_add_action_or_reset function automatically invokes the action
>>>(sysfs removal) in the event of a failure; therefore, there's no
>>>necessity to call it within the return check. Additionally, it issues a
>>>warning regarding the failure to add the action. Consequently, there's
>>>no requirement to print a nearly identical warning within the xe driver.
>>
>>there's actually no need to print a warning at all? If we already add a
>>warning in drmm_add_action_or_reset(), that should be sufficient.
>
>Indeed, you are correct regarding the warning need. Including the 
>warning print from driver doesn't offer any additional benefit. 
>However, I opted to modify it and maintain the warning print in this 
>scenario to prevent the potential noise that might arise from the 
>static analyzer detecting an unhandled return type from 
>|drmm_add_action_or_reset.|

you are not ignoring, you are passing it to the caller. If the caller is
ignoring it, then it's another problem

Lucas De Marchi

>
>>
>>
>>Lucas De Marchi
