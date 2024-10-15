Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1476D1D882
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 16:08:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC55810E5B6;
	Tue, 15 Oct 2024 16:08:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P+3kA1gX";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9126F10E5B6
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 16:08:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729008510; x=1760544510;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=meSk9w4jKlfxISIviX+V/m627hGFfyQhnDWBAH8iOg4=;
 b=P+3kA1gXRgO/Dsyu7s5Pz3ZvIFioQNdFr9AY/1NBoT/GXGzMA+S9zK5T
 F6h+eBjcgdguSVdsqewdF3r3AAHoWYv//rcgBc6g5Xv19oQe9ftCYrf1X
 i8BOb9TPhoNOYxrLbtmeGMfDxCKIMvgTYxeUBXY6iX1BJupgjp2sSiJms
 USe9vmPRYeGZI3+/iS25cI8w2712isWwRDbZuI29jz3ASzaefNpKkVgap
 +4uIvikuEE5r4T84evCqjgDmcKgrKhSS9BVIkymEYCj80avzxqhdjrFG7
 jjUBM/rNsk4c/Vss3gLO3HQi2+xMmpyeoBALxQWIaYbIdsPB0mb6PIFO4 Q==;
X-CSE-ConnectionGUID: gmwEtw4FRsWUBD+FuEnbnQ==
X-CSE-MsgGUID: kpyWQS/mSAS4Aj8gWgurLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="28614640"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="28614640"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 09:06:35 -0700
X-CSE-ConnectionGUID: Tue7l8pVSvuuAjCGAqymDw==
X-CSE-MsgGUID: H9RFeHVRRBifzQ1c9LvwPA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="77958677"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 09:06:20 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 09:06:19 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 09:06:19 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 09:06:19 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (104.47.51.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 09:06:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kdSYhjrhGSfeN3upJEHn8im1RLOj/SFl2d0eMXKXp8I+c0vppJCyedCrWdqCZ3iOv2sEitTaIdf8q0u0RvPLoJJlfQ81+YnOycOPoOYq0xk8Gz+QCjPEX1FoVgOgdaMCsqpkmIryp4INbN5YOGv+pvI9Lm37Ck4/0LOOGa9huEOcKbA6jL/1G9BRLVWveSzC+VM86xEHnZiUFbywyyxmGjgoK6jWhbhSD8psO6/zpZjb237aVcRYrdP1lUzwB3rnG9OpXHGdnB+khIAwz5Wt9/s+e693BJrJhG1LLb0u3Kjy16HhQ5IfHsZjUPqMIrt7Ymzl57Y6XujViqen9aGepg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WO913KQxO/LOQ0+ePpZkIVNK7YQ3Hz68SmikO3lSEjk=;
 b=U45GI0hOeUAxiWLHuFRwY6+r4Hm7h47ML8ovgdejwGn+u4/ujKfCEC6hwMVnC71wJWX3V3n5z4EvIuAQC9NTsOaRJNpd9NJwZ4ObPT8wDxAeX69mOwTCBNQeEiSuAVIFr44kicriSGGO0O0370v+ApMzvWvSi0G2e1nfBZPt8+nQJqcMGAO7K02ErWFj+BbNGQH8Lzh9qnoIWP/8MinQnx3bAV7vxjt3npxSVHXt9e01a8E8MAkOcbxdvJ4uQNo1wOd3E6zdf4cFQhAIdpjqGoLbOSu8E1gBgvKvfs8xD9vUmc2QUvkat+dfyQog5E+YceqUh3pqBAJtAYiujoFemw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by CO1PR11MB4772.namprd11.prod.outlook.com (2603:10b6:303:97::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.27; Tue, 15 Oct
 2024 16:06:15 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 16:06:15 +0000
Message-ID: <d56e33ff-b8f8-4d77-961d-e2f3b2a85d3f@intel.com>
Date: Tue, 15 Oct 2024 21:36:09 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 11/26] drm/xe/devcoredump: Update handling of
 xe_force_wake_get return
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-12-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241014075601.2324382-12-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0029.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:b8::11) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|CO1PR11MB4772:EE_
X-MS-Office365-Filtering-Correlation-Id: bd5777c9-ef86-49f3-a229-08dced334c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QkMvNzV3ZmM4bHNlOXdvWWdpcDJ5TDNYRmRZakVXQzRrNDdVeDVOc3dBTWVZ?=
 =?utf-8?B?RVdPNDdXUzhLWTBSbnFZVGw5QnBiQnF4YkpHbTBQWWZkNnZKQndEWDhoODQw?=
 =?utf-8?B?b0cvMVEwZTNjR1ZRYUlya3RETFJTZkJrVWVlUnQ0WFQ2RTh5MXMwR0JhNktL?=
 =?utf-8?B?bk0xbzZEUnJXbEZKL3ZsNWdUUER6N0xjM2dXWHJQYjFMVGpVaXEzZTZ6cjI5?=
 =?utf-8?B?RldBbnF6WVk2RVQrb2swbXUxaWpmMHlMbS9hVm1qKzN5R2JWeGFITUJCMmJj?=
 =?utf-8?B?cDJVNE1kRWh4SHRsdUlxdDdkUEJQdFlkanVsYjk3UjltLzgybnZuZVJ0dmJi?=
 =?utf-8?B?eno0c0NxRDIrZUlaT2R3L24zeUVRaDEvQ1dNUVV1bFp4S1AxTDQ0b0Z1UmUy?=
 =?utf-8?B?YXVwSUVKUGdQZGZFMTNvVVdaZ25sREVLTkR6MDVGTmlqZjBNOXV0ZVYxVVIy?=
 =?utf-8?B?OWk3UENkVnp6MUtMcmZFaVR3Y2FqSkFRTGNDV2VFZU42Y3pJZFErVEJ4QnJm?=
 =?utf-8?B?U3djTnNEb1BOQzhBeUVzMGVLNTBWZE13dnM5VzR1T2VSa1NBTC9oRWlVMEhL?=
 =?utf-8?B?d1FTcFFYZ2N3U0xRR0JTRVJPMzZGMk00MmdQaGwzUEJDMnArRnRPQTQyWWU1?=
 =?utf-8?B?S2xWdkRBajQvUGNKSm5XKzl0OHp2L1JlSVptTEJDbGZtNjlMcFJIVEhLRFBN?=
 =?utf-8?B?QWpCOVAwd1RtY1hpUUV3V2FzVmRrZTRRdXJBZDR3Um5CcU5jN2h4WDlkS2xv?=
 =?utf-8?B?M2lTVDhOa0VWdWh4U2VyQnQyY0JRd0xqN0E2dVFaSDl2M2NIV3gweWo1QUlZ?=
 =?utf-8?B?M2l5ZTUxcmpPb2crQU56Q3VJNnV5dDlUbWZvMk9MdEh0cUlkZzB1dCtpZjgw?=
 =?utf-8?B?a1lWb3Z3c3k2TS84Ukk2VUx0dGZMcTRKMkprOWV6dytNMUxjSmRnZHkxM1Zh?=
 =?utf-8?B?NGhhelZaeTJOTWV4MWRPK0NaZU5KY0pKZGhacEwwNUJLY3ptdld1Q1I1Wndw?=
 =?utf-8?B?MmI0YVNaaWh5ZDVnbDBNbkRVYmN4djBaVTlqUHhZd2UwM0V0cGU4QVBVUFFC?=
 =?utf-8?B?bDQ3K1puVytXRjdySllNbnFJL29KT2ZJemhuTGpaNDk1a0l2Vll2RHVJM0lG?=
 =?utf-8?B?eGdNbU9TRWRNc3VGZWlzdzZneHI1UmFrN05wYlBBZTkxNDBQTVVRS3p1WDVS?=
 =?utf-8?B?VnJUamVDN013bG5lb3V2UFl5K055ZkkrOTZCM2w0VThSSmQ5UjNwTnpCOE1V?=
 =?utf-8?B?aEdONW5jMW5wVzlyWm5MNjVuYmszcVpURkhYSXNKNHN2Rk8yTUx2TGxCb0J0?=
 =?utf-8?B?T1lQT0lzM1UwVkNrdlloZ1lTT2pQbVhXWmgxaHdDSUZJMjZvSWFDTUkwM0tH?=
 =?utf-8?B?ZHZqTzZ5b08wVUt2RTEwRDJISS8rS2pzK0tQc3V1a0xtYkdBVmI5OWk1YVg5?=
 =?utf-8?B?TmFWbDQrcVFOSjBFSUtQV296cGZlZDJKVnFvbG1mKys3Q3RWVStoYVc3eEhW?=
 =?utf-8?B?ZTF4SDRRaGl4Q25kcVh4Rmtra3Rxb3E3Z0ZHQ3hxQ0JWTkY2NVU5VGM1UzMz?=
 =?utf-8?B?cHlLeCs4ZHdGSDk0Wm5XQ29Pd0RRWWpxbXpuNEhKMUIyME10cW84RlQ5RFhK?=
 =?utf-8?B?M012dStTYjBqbFUvUkgvWXJiSi9zMkdMMzF1VXpsRVdaK1hDcnFUcmxtZkkx?=
 =?utf-8?B?aXNaTllMTzRscEtLSHJsUk5Bd0dUL3h6d0E4eUNkQ3hZZW9NUHhtNEtBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnBxeXZ3RFFVeG8vbUIwL2VXMDl4QXNLTzlCYnp5eDZOTzNabi9zNVVmQTBQ?=
 =?utf-8?B?M2g3MlBndElkMm45eVJnWUx3QnA5K1pUajd0TG9yeC9RWWZDWGFUWWlNUHM2?=
 =?utf-8?B?cjh3ek1VbEpGSHE2MGpuNGZwVldrWVZqd2ZFYjB6K3BVMGd2eVcvOVNPbzVX?=
 =?utf-8?B?K2UrOUxNNmhTTVM0Tzk3SWN0cnFVenlmNmoyR1hsTkxuRUU2S1AvUlNqVDQ1?=
 =?utf-8?B?MThNdzhIK2Y2RHBadXhMZGM5TkRmNTlBWkxwRXpIZFhvb2thT0lNUVd3WjAw?=
 =?utf-8?B?S2tNUWVjYUcyV0ZuTEJORGtreGZSRExmL0dNRC80NDVaY2V6c0Y5QjhVU1BZ?=
 =?utf-8?B?OXcvSU5wSTg3cFBFTmNTaEp2VVJ3NVllV09IQnZwK0NkMktPakxjelVWVThK?=
 =?utf-8?B?WTZPUmNJZW5ja1ppdE9lMTRTUXU1UzNBelFIZXdBL2JvTk84WE5IU2RVSWhi?=
 =?utf-8?B?eFFYdTYzTUIvc1NCL1FzOW5jNmJRWGVnRFBRZzhBQWNEN1ZMSkxmTmlzeEtQ?=
 =?utf-8?B?Um1QWU5CdWQ3eXdZQkx5cm15VVB6L0k4WTNrN2F1S2txckFpbDhEdG1ZUFRM?=
 =?utf-8?B?UnU3Kzk5T3NzMGxCdS83bFZmclFYZktjd1RhQUJ2U2pJeGFJczlra0lJQXZX?=
 =?utf-8?B?cXJsd0F5NGs1TTlTZEpDYkpsUVM3eFZ4WWtVaHQrQUhtR3ZEeVZ3OXV1ejVs?=
 =?utf-8?B?MHFxRzJDelAvUnJ5ck9kQzQzUldBWDlPZnFRZVRlbkRCYW9tOXVQVGxkTkpO?=
 =?utf-8?B?TlhVWHNPQW9pbEEzU2Mvc2MvWnd5NUxTK3FkS0VNRkV1eUxrK3hZRGJPcWFp?=
 =?utf-8?B?dmorTkd0NU84cXFUL0Y0WjArVHl0dGE1Umwxb2lUc2M0ZjRPQ1ZBVkdYMnNC?=
 =?utf-8?B?UWpSb2tpMFBoV3dGYXliVmNFYUhWRTZuQVBoUGxrbVZzNSttM0dHRTAzcStp?=
 =?utf-8?B?Nm4vdEMrVlpyeWtFOWZvY2VlaHRkWjRoMEtFdmVqcXJyWjZhZE1ZMTlGMjgr?=
 =?utf-8?B?N2JlcWo2cGdHMDYwK3JwOHFyd0RJd2FaYkR5bUFFU1l4cHFJbU5raEdlT0J1?=
 =?utf-8?B?MUU1OHRPTTJJeDJDcmRWY2ZGU2NBZmxzd1RONWxNVXJ4Wjh5QVNINDhZMVc3?=
 =?utf-8?B?ZmlpN0xDL05xbVdKc0o0OHk0L2QySFJBczdtYnNaTkwyMzQzU09NWGJHazQy?=
 =?utf-8?B?cjdxSkNjRkdKSTFkV3N5L3JESG9ialFmQ0t6Q0E1T1hjeHIrakd0cHEzSU0z?=
 =?utf-8?B?TU41M2x4dDM0NW5paFpQaHJaODJmYWFzeWQzaUF5RDZXdVNYY3Z6RzBNNmJ1?=
 =?utf-8?B?NnlEYnFZSHR5RFdpRUlTQnhuc255TzI1ejR0aExaNVpHeGR4TXpJL3NuMko4?=
 =?utf-8?B?c3NoSHVVSkplZjBDYWloQU5XT0lPc2FNWlFKbUFLZXJ1WVMvTTdrMWJCa2Ja?=
 =?utf-8?B?OHBma0RYOEw4WUVweTRGS1pCS3BrUzZzZ2VsMnUwclJKS3BMQUJJRHZLRTNh?=
 =?utf-8?B?WTV3SkdsY2pYTkFzM1ZLTTlhZzN6S2hBNHI2bzBqV2Zib0k3Z0xoZnRZeWVy?=
 =?utf-8?B?VFpPaVRYalh4Y2NxeU5QWlNQamRoSlRreFd3M28wMjNMcHExa01hN2lpYlpS?=
 =?utf-8?B?cWd5ckUrMENCZUEwMXFjSHBma2g3RGk2Z2hJTjdmUnpYRFJhQUFNSzQ4L2ps?=
 =?utf-8?B?Q1dBcTJKQnlFZkZpdHJnMmN3Mks3cUVGbzRyQmdEQU9nT0xPbEY5QmdMS1JI?=
 =?utf-8?B?bkZSeStoODgrMEJOTzhWNDhBWVdONDE1TU1VUGhFOGV5MkZrYmV5VSsrbm1P?=
 =?utf-8?B?MjhaL1N3aVY5VXo4a0syeGc0VElUMHBmOENCaDRSQUtKUEplOHhoNUR3OTF4?=
 =?utf-8?B?bUN4bWYwbE1tVWU4VjRid3R6cm1jN3FSSDZSWnlFSnNybkk4QUQxOGg2SW9k?=
 =?utf-8?B?YmtmN2YrYWdVK1ZNek9XbkRWRjVPMG1WQ1piSXpzd1VlNWdYMjJYdFhzdTJy?=
 =?utf-8?B?WmgxUHlRdWloc042UkVCTG1TU0hQdU13SDBvdWlHT2hsYm5zTlUwVWpwalVR?=
 =?utf-8?B?NE92bGNqcXlod1V1L0ovVVlSblRZeUZTSVR2S3lQRm1zUXM3cUY3NFRBa29v?=
 =?utf-8?B?eHFCaGo3YzdIN0ZBZndLTnZBY0ZJY0V5TUZIT2tOdkllM0VIT2J2TUpLK1F3?=
 =?utf-8?B?N2c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bd5777c9-ef86-49f3-a229-08dced334c15
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 16:06:15.8231 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tiNwt1s39uQMVHI4wwag9A+reCjlxJXqYLZHcEBwKjJzGeJQYhODtxFRpJr1IbbbdG7AUDXX3Xr3OZAcbjP1sQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4772
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



On 14-10-2024 13:25, Himal Prasad Ghimiray wrote:
> xe_force_wake_get() now returns the reference count-incremented domain
> mask. If it fails for individual domains, the return value will always
> be 0. However, for XE_FORCEWAKE_ALL, it may return a non-zero value even
> in the event of failure. Use helper xe_force_wake_ref_has_domain to
> verify all domains are initialized or not. Update the return handling of
> xe_force_wake_get() to reflect this behavior, and ensure that the return
> value is passed as input to xe_force_wake_put().
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> 
> v5
> - return unsigned int for xe_force_wake_get()
> 
> v6
> - use helper xe_force_wake_ref_has_domain()
> 
> v7
> - Fix commit message
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_devcoredump.c | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_devcoredump.c b/drivers/gpu/drm/xe/xe_devcoredump.c
> index 99842a35dbf0..8b0ea77661b2 100644
> --- a/drivers/gpu/drm/xe/xe_devcoredump.c
> +++ b/drivers/gpu/drm/xe/xe_devcoredump.c
> @@ -158,13 +158,15 @@ static void xe_devcoredump_deferred_snap_work(struct work_struct *work)
>   {
>   	struct xe_devcoredump_snapshot *ss = container_of(work, typeof(*ss), work);
>   	struct xe_devcoredump *coredump = container_of(ss, typeof(*coredump), snapshot);
> +	unsigned int fw_ref;
>   
>   	/* keep going if fw fails as we still want to save the memory and SW data */
> -	if (xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL))
> +	fw_ref = xe_force_wake_get(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
> +	if (!xe_force_wake_ref_has_domain(fw_ref, XE_FORCEWAKE_ALL))
>   		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
>   	xe_vm_snapshot_capture_delayed(ss->vm);
>   	xe_guc_exec_queue_snapshot_capture_delayed(ss->ge);
> -	xe_force_wake_put(gt_to_fw(ss->gt), XE_FORCEWAKE_ALL);
> +	xe_force_wake_put(gt_to_fw(ss->gt), fw_ref);
>   
>   	/* Calculate devcoredump size */
>   	ss->read.size = __xe_devcoredump_read(NULL, INT_MAX, coredump);
> @@ -236,8 +238,9 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>   	u32 width_mask = (0x1 << q->width) - 1;
>   	const char *process_name = "no process";
>   
> -	int i;
> +	unsigned int fw_ref;
>   	bool cookie;
> +	int i;
>   
>   	ss->snapshot_time = ktime_get_real();
>   	ss->boot_time = ktime_get_boottime();
> @@ -261,8 +264,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>   	}
>   
>   	/* keep going if fw fails as we still want to save the memory and SW data */
> -	if (xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL))
> -		xe_gt_info(ss->gt, "failed to get forcewake for coredump capture\n");
> +	fw_ref = xe_force_wake_get(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
>   
>   	ss->guc.log = xe_guc_log_snapshot_capture(&guc->log, true);
>   	ss->guc.ct = xe_guc_ct_snapshot_capture(&guc->ct, true);
> @@ -274,7 +276,7 @@ static void devcoredump_snapshot(struct xe_devcoredump *coredump,
>   
>   	queue_work(system_unbound_wq, &ss->work);
>   
> -	xe_force_wake_put(gt_to_fw(q->gt), XE_FORCEWAKE_ALL);
> +	xe_force_wake_put(gt_to_fw(q->gt), fw_ref);

LGTM
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

>   	dma_fence_end_signalling(cookie);
>   }
>   

