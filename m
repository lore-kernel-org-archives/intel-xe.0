Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFC6C25B78
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 07:51:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C8CA10E0BD;
	Mon, 27 May 2024 07:51:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ivNp7I4s";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 825A310E0BD
 for <intel-xe@lists.freedesktop.org>; Mon, 27 May 2024 07:51:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716796294; x=1748332294;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KLfl0B8vyV18pF9iQeVL2M/5XpVxox7KKqEQVAiVQ6s=;
 b=ivNp7I4sXyTwP20I0gg2ui+Hcpr5b4wFNbFrCVz+17uMua0augSkx6ew
 HgGdEe00egVR07Uqy+VPXFD//UiGuFdPY29dEq77lftxYVNp+bcJeceyI
 q2kC8FtpqJepc3HNpivqdmvjGlj4jXGfnK5wwqfFCAQmaKtIrQrUoCoKK
 MsFm2VGTBLQtwTqo1v1DTfkzBmPpP6Sgc9WlIRFs1NqG25aJEHv5Lo/pj
 yHPz+tyIs4fDhRPHZj25XoYTHqNSD4XZA7l33nSFYC6TK3y2iOBS4BoNw
 L+f+unPkuhCynCeCVo2gbAxEfHYFvg4vhWRNqJA38sYz1VyWzad5i5qz+ w==;
X-CSE-ConnectionGUID: gmFGOk07Sfy6mUsExQD79Q==
X-CSE-MsgGUID: bm5x5oNHTFWuULdfm9NeZA==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="13043614"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="13043614"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 00:51:33 -0700
X-CSE-ConnectionGUID: 16GG1s4uRZe6iq89K9EzQA==
X-CSE-MsgGUID: Sc1bfPMORl2OCKiQRJMg5g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="72086693"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa001.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 27 May 2024 00:51:34 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 27 May 2024 00:51:32 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 27 May 2024 00:51:32 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.173)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 27 May 2024 00:51:32 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gDvC2N2eHMfKjCAZNw1gKSk02RReqe49ap7RK6hKy4KmNy1IV7Umf24bgfevGHQm3abZBjF7lyyCoVyb6GeqbHsxvZV+jUwiNnn8qDoFa8Rif8HeSCLe4a1vFfmKSXCqOxOI6IAZPKiojUIJxv4ZWiQi+59Ni3i4s+4kWlxf5s46tpOv6jo+P6EmMc/Uut/oKmSHnnpBBd0Kk6C12pwWXNGNQ0SxyoX2g8r+G5tbIUS5zDBPOGXds4FpZkAUPz0bccHh1oPOdKMC6HFyvw4zp99J6aVngfKQgNeNg4VORX2q5yctknOin0Dup0X41f6rxQR/C+fLcNBP8DFS5ZvVLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ZLe5TLYP8r9clu/02kQNRPelO2VWsv2Xxa6aAacwr0=;
 b=EbXuVnfZJTvcbul8pKNqqTrhq+VVpt4S1+tPsh4bawlKDULavmhcNEQOI9LaOBqkwGjarZRjt56vnEy9w0bgM36ZVnpOkCDG+oMbQZ/M/JDAtzcfp15T3e4FEd23HomFXv1GfTGEfv0g4gwNvzn5fAsO8qbjIBXODzWOxQ9kySUH2XE7wJihkvMEFPg4pyass4hMKruq3pY/HvmYlED/ZHtC8uBjtnN+XjpSeAvNmefXqqJjwiq/PAH6LGBnRm0Hgdg4gmfEudSDxIW097ii17cxNWGq3sXT2bobPLp1nAw4VBnK5plqhld4JCIGGV4sCp5GrKyRIQKFhPAIp9h3KQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 PH7PR11MB6977.namprd11.prod.outlook.com (2603:10b6:510:205::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Mon, 27 May
 2024 07:51:30 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::927a:9c08:26f7:5b39%4]) with mapi id 15.20.7611.016; Mon, 27 May 2024
 07:51:30 +0000
Date: Mon, 27 May 2024 09:51:27 +0200
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/2] drm/xe/vf: Use only assigned GGTT region
Message-ID: <iwqdtu6ly4r74zackvu42umrsnzhg7ptgvpdrxqy7od3pjx4mh@2imws6s52ea6>
References: <20240524113714.932-1-michal.wajdeczko@intel.com>
 <20240524113714.932-3-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240524113714.932-3-michal.wajdeczko@intel.com>
X-ClientProxiedBy: VI1P194CA0027.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:803:3c::16) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|PH7PR11MB6977:EE_
X-MS-Office365-Filtering-Correlation-Id: 211f61e8-7f96-4387-0a50-08dc7e21d1ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0N5SFhrUFphYVg0TGROdW5OWWM1aElVQ0NjbzY4dUU3SEhjWUpIeXhJWi96?=
 =?utf-8?B?VUpaZjVPREVvZlNsbXpvNFc0emhYby9CWWZjT2FxZXRmRkZtZzlWeml3RHpq?=
 =?utf-8?B?VlBXUlNpd1haSXorZjBBd01uTVNKNWRRd0hhVWVkcmVDSXdXVGhyM3hreGZj?=
 =?utf-8?B?bFpCOG9PRDExM2hzQklQSml4TVZGcitJMzB0MDNBUXZ1NGwzamQyb2FBNFgw?=
 =?utf-8?B?bVRPMnlMeWQxMXU1V0ZCVWdkazV1RU1aYmh5S3l6QmRaR1IvdTgvU3hVOWVP?=
 =?utf-8?B?MVNuZzlhT1JpZnpKTllPc0xHMjVyQVpnMlRlUXBDN0hhaERMTFpvMkNyeWNL?=
 =?utf-8?B?aFZqeURia3pZMC9OeFJ1Ylh4U09xdStwam1ybDBSRFVMQktYVXhsMmw5bTlP?=
 =?utf-8?B?MGdwVjNweE03N2RWS1NrcjVtVzFuWFoxc0RubWYydVlyaHQ4azYyZWQ4RTFK?=
 =?utf-8?B?emJkUUJrTm5ORktOUzJtNEhKd3Q1bnNpZ0RLc0xJZHJaZFl0bFFyWU5QZDRw?=
 =?utf-8?B?SVJuNDFWNHIyc1RGbkF6ajExU0hvdnRSbVZhQ2szVFU2S1YxZEJlUnhUWHAr?=
 =?utf-8?B?NmU1c2w1cTRMNm5aWmd5bU9Ebm5aMmZuRTJjZnNwajBNTWU0QmVZOU05a1hC?=
 =?utf-8?B?WVFWc1JqSWJlRU80UHp0dVE2SHRSNnRDc25ieDJGZXNwYXVlb1ZhbFlsc0t2?=
 =?utf-8?B?dmRDMk1rdm1UMUtXdlRJenA4Um14SUprWW9Ca3N5SVVVbjBDaElubUo3UG5F?=
 =?utf-8?B?ek4wVU5Kcjl0QXh0VFNYbVhhK05obFlHL0NZL1d1UjFHbkp0TzhTd1hnNVQx?=
 =?utf-8?B?TDlFc2xCU3NqcUtKa0MxWW9SVjBDV0hoc3RlalVZL2tGeXJpR2dSc20xaDhr?=
 =?utf-8?B?RWhGTGNicjQ5S282VXBHVHZEbE1rU0ZKVS9xaEMvRlpHdXcyZVU0YUVkMFNQ?=
 =?utf-8?B?SDBMRE1lbnE4VHBEK3lscUJRcm5OWDVWVWVkWithR1VMOTBMVVZGUStCWVVT?=
 =?utf-8?B?YlZUQ3dmaWVoQmIrZWtpNmdxRVltRUN6MzJycHBjZURTczV3ckhIUWVUd3VG?=
 =?utf-8?B?RnhReEdmc2JOajNCaENSTlFWNVlld2wySmZ1ZDB5ZkFLYTNYRW5iVlJMSzF5?=
 =?utf-8?B?N0xwZWN1UmV4QnN3MnhPRzZTelArZmdqRlFhUnRvb09OUGFIc3lkdkpWSnB2?=
 =?utf-8?B?K25nWS9vMk5tOTZ1bDljLytWRDhqaEZrcEdQY01QNlE5a2RpQmprRkZFK1RI?=
 =?utf-8?B?RWozdW04d0htSFo3TWVRT0JyL3R3ZkVaaStaL1RweVdJN2dsakRGRnVHT1V2?=
 =?utf-8?B?bUdJdFE2b3cxcm9iK2lHc082LytoOFFoVmhGaWxLdThyOHdNNHkzT096ZEpL?=
 =?utf-8?B?ZFhMakc5bDlhbDJtK1F6dmpybjdRZXRHaEdjYjI4aXI3aExNZG16MXV6NTBy?=
 =?utf-8?B?TXNpaDdxVWdqOU1NYlVrOUlHL3hDOEgwMEE0d0ZqSDZvZHZhcDdWbHo2bjg5?=
 =?utf-8?B?QWFrZGhJdzlRd0V0aGUwV1FSZGJlSUZNZDNZZ1JVYm1CVXlkTnl6bk1aYW1J?=
 =?utf-8?B?MnZaWnU3N05jRHFvWU8zdTRLZlJPdmF0cU05YmpsV29lcDVQZ2cvenJhYkpO?=
 =?utf-8?B?TWhhUHlsUlZsZjBWSDFOeldZdEFxa3plSUt2d1dUWVhyM0VlcVhueGY2Z0Ux?=
 =?utf-8?B?N1NBWUdoKzdTMHJSaHZtU0wrcUdSRWd6TWE2M3RlQ2taUDhETTBzNTJnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NyttN1YzazR5ZXlUTHVYR09tUCs5aVhNZ2NtS1BiZmh0L3N2bm1hMXA5SmUr?=
 =?utf-8?B?M2lXcXMwRFoyZkEwQVN2ZndEcHFIQTl0S1pydjdyQWRsekFkTU9QVlBFK0VN?=
 =?utf-8?B?RDBHVE9saEV0QTM3MFphcFpoRTZqeWlKVzk1SEdGVHdKekNiRFVIUEZxREk2?=
 =?utf-8?B?cWd3Wkk3SkErakEzWThOOFFSb3ZlK3JMK08wNmxIbWJNTWJ3OWtkVVBQYTZJ?=
 =?utf-8?B?T2NZaExTejZyWDZadk5nQ2pmei9WbFNWMFNMRXlMWUZ6dlF0OXJhR0poS2Fy?=
 =?utf-8?B?R3hoSUNPbkZjOW1zdXROZ3p3Vm1lOWJKZ3h5cHhJRmxZaUpRVWZtZU5MdkJ4?=
 =?utf-8?B?R3dDbzU2cEhQblAydlRQR05QNy9FQzFpQ1JpVG1lcThxeitiVFNpcWVmUjhI?=
 =?utf-8?B?dmJ4NjVHNUVIOS9OSVNhbUc1VTFPNnZtWXdwRnFQZHFlYkZUQkk3R1ROK0JD?=
 =?utf-8?B?V29PdkFvQXJxK1ZBT2RPYlYyNTErZVhibW1qdE1GNDhTV3E4NFhlSncvZTRm?=
 =?utf-8?B?WW9kUkVnWUZ0TFFhbUVRaCtmVHlsY01RY29obkZVVmdiYzhrTUY5QkVkcjhl?=
 =?utf-8?B?cUF3aE1XK3BDa0NYQi9SeTVIdStIQjBlVG15bGdMUlRrMERYZjM5NEJ6dHNa?=
 =?utf-8?B?eGpTZ0lYYUM1NmEySkFnUXdVaUoxTFp5SnJ0eDF1VFpQVDRKNGZoOG4yRk1C?=
 =?utf-8?B?ZEN0MjNnN3FzYmJIV21pOUpPOFd3UUdWc3NleGhrbERZdktEYnF0dytMU3lZ?=
 =?utf-8?B?S3VFUVhpRVhSbDZ5T2hSZkNOdEVYOWhVRVpFWWhja0x0NWllZ2tub0JkNFhw?=
 =?utf-8?B?QktMeWhqTDJBWlIzeTV6R1BVZldOb1lWK0dqMCtBMTdiMWN1RDNCZGg4aFBt?=
 =?utf-8?B?STN1ZnNqay9jYTgwaEJhSVJLMURyVVZBY1Z6K1NuZTBKaFJYNkVRTUNUQWg5?=
 =?utf-8?B?Nzl3Ryt5TXZWNzZTMHlqWUdLQWFOR0J1QUd3eXBBQ2Rzc3RCeGhMSWxVTVFj?=
 =?utf-8?B?ZEFzcnhaTm9GSEpnOUVxTW9sL2dmWC9SQTFlNXAwTkttRkVMWDUxZGw4VE9t?=
 =?utf-8?B?NGlJa3oyOHpMRHJDNEZTeTAxZXUza2NpVlhxUVVqR0RUR1RUWExuZ0Y2cEtP?=
 =?utf-8?B?NXQwUHRvd3paWldHM3MvOE1OVW5LajlCQmRNRjRxQnhRQjlnN0Zvb3ZqOUl6?=
 =?utf-8?B?NW04U3IzK2dKMHBySE1GTjRBaHlIUjNYZWY1cGx1dDdkQnc2R3BuU1oxL2Fj?=
 =?utf-8?B?YUx1SnFpdnFybWxqOHNUbUdiT1Z2SStLdzVhME5uNGd1aFEvdVYzUVE4bDlT?=
 =?utf-8?B?RVJnQVAxZnJQYzB5Q3NZSEhJZC9XaGhJbnJUT044bHUva3B1dldyQms0bHI2?=
 =?utf-8?B?Z2tCTXJCWitQTjJMUmdsTW5BTHQySkNlMXFaenUwTnZSSW1UVGdJT0M4V3Vq?=
 =?utf-8?B?c2t0Q2NTaFJ3SVFVZ1VrTG1XWkQ0ckFsUUJzNG8yZk9TUGdUbFhlaTZNaHUw?=
 =?utf-8?B?MUd5SERSbitoZXV3Tmh0QjAxN2k2dlpBbHBPSHBTUU9FQUQ4bXFDcHdodHpF?=
 =?utf-8?B?alRvam9JbDFWZFNCUWpzcjdIZWExTE5UeklwVGRCdEo3TmVlU1BBZkxZazEr?=
 =?utf-8?B?c3V4d1BKbW9tWGZhZ2xJZ2x0RDhYRkRvTGZvR2tBNmx6ZUtsMnN2MDB3UWFJ?=
 =?utf-8?B?WWZZSGIvK2JhZ29nd1lpVWRpbmJKT3l3MVhhTTlNbUxJajc1aU5naVVWb3NI?=
 =?utf-8?B?bG92RlRwYjFCRnhVWlVVM3pwWjM0MVdpNmFxRFlxTTI4RTN0S3pXZm9TNlU4?=
 =?utf-8?B?cnhaN09LNnM1Nk5zbGlCQnVmUFhDNXM5ZjQ3NFZLMjdrRzY5MG5vTjR4YUVZ?=
 =?utf-8?B?anNBUlE3Z1hrNHl4U0pWKzVnY3ZtVnROQTlJV2g1ZkZrMzlYOGtGbVZNTnV2?=
 =?utf-8?B?U3NGNDVoZUNHS051SDZuMHFBWW13ckIwbDBIR1pnT2ZQMk54dUNIUnFhd3F5?=
 =?utf-8?B?c1hId0dncDIxUmpxTFF2VGF6UzhKR1BVV1hlUy9paU9SYlBiOUNvS3o4RUlX?=
 =?utf-8?B?YkNBcWE5WjNJTS8rc2p4R2pURHNwV2RpS0NORmh5RTRtbzRjZmRvUnAzSnNx?=
 =?utf-8?B?Zk5OL0tLeXZRWGMwV0tTSlA1VFNLT29lK2szejhzK2lBbURBaGxyWG1RdjJF?=
 =?utf-8?B?anc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 211f61e8-7f96-4387-0a50-08dc7e21d1ff
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2024 07:51:30.3793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 73cy8/gpwS2S+pC63uQKeERROgEODWSeH4b+JeNNMDw1HyMam7mu5q4xsqN6IqSxoYBxHwzIAFjyXodSPO5wPxU6rPn3k+LAfvXmUaGlYFY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6977
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

On Fri, May 24, 2024 at 01:37:14PM +0200, Michal Wajdeczko wrote:
> Each VF is assigned a limited range of the GGTT address space.
> To ensure that the VF driver does not use GGTT allocations outside
> of the assigned region, explicitly reserve GGTT space below and
> above this region when initializing GGTT.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device_types.h |  3 +
>  drivers/gpu/drm/xe/xe_ggtt.c         | 14 ++++-
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.c  | 93 ++++++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_gt_sriov_vf.h  |  1 +
>  4 files changed, 110 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 8e7048ff3ee5..dad7e9554c2c 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -196,6 +196,9 @@ struct xe_tile {
>  		struct {
>  			/** @sriov.vf.memirq: Memory Based Interrupts. */
>  			struct xe_memirq memirq;
> +
> +			/** @sriov.vf.ggtt_balloon: GGTT regions excluded from use. */
> +			struct drm_mm_node ggtt_balloon[2];
>  		} vf;
>  	} sriov;
>  
> diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
> index 17e5066763db..b01a670fecb8 100644
> --- a/drivers/gpu/drm/xe/xe_ggtt.c
> +++ b/drivers/gpu/drm/xe/xe_ggtt.c
> @@ -20,6 +20,7 @@
>  #include "xe_device.h"
>  #include "xe_gt.h"
>  #include "xe_gt_printk.h"
> +#include "xe_gt_sriov_vf.h"
>  #include "xe_gt_tlb_invalidation.h"
>  #include "xe_map.h"
>  #include "xe_pm.h"
> @@ -141,6 +142,7 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	struct xe_device *xe = tile_to_xe(ggtt->tile);
>  	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>  	unsigned int gsm_size;
> +	int err;
>  
>  	if (IS_SRIOV_VF(xe))
>  		gsm_size = SZ_8M; /* GGTT is expected to be 4GiB */
> @@ -194,7 +196,17 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
>  	mutex_init(&ggtt->lock);
>  	primelockdep(ggtt);
>  
> -	return drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
> +	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
> +	if (err)
> +		return err;
> +
> +	if (IS_SRIOV_VF(xe)) {
> +		err = xe_gt_sriov_vf_prepare_ggtt(xe_tile_get_gt(ggtt->tile, 0));
> +		if (err)
> +			return err;
> +	}
> +
> +	return 0;
>  }
>  
>  static void xe_ggtt_invalidate(struct xe_ggtt *ggtt);
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> index 66069eb8c5be..5ef0c3d78e7c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.c
> @@ -14,9 +14,12 @@
>  #include "abi/guc_klvs_abi.h"
>  #include "abi/guc_relay_actions_abi.h"
>  #include "regs/xe_gt_regs.h"
> +#include "regs/xe_gtt_defs.h"
> +#include "regs/xe_guc_regs.h"

It doesn't look like xe_guc_regs.h is used directly - please, drop it.

Other than that - LGTM.

Reviewed-by: Michał Winiarski <michal.winiarski@intel.com>

-Michał

>  #include "xe_assert.h"
>  #include "xe_device.h"
> +#include "xe_ggtt.h"
>  #include "xe_gt_sriov_printk.h"
>  #include "xe_gt_sriov_vf.h"
>  #include "xe_gt_sriov_vf_types.h"
> @@ -25,6 +28,8 @@
>  #include "xe_guc_relay.h"
>  #include "xe_mmio.h"
>  #include "xe_sriov.h"
> +#include "xe_uc_fw.h"
> +#include "xe_wopcm.h"
>  
>  #define make_u64_from_u32(hi, lo) ((u64)((u64)(u32)(hi) << 32 | (u32)(lo)))
>  
> @@ -474,6 +479,94 @@ u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt)
>  	return gt->sriov.vf.self_config.num_ctxs;
>  }
>  
> +static int vf_balloon_ggtt(struct xe_gt *gt)
> +{
> +	struct xe_gt_sriov_vf_selfconfig *config = &gt->sriov.vf.self_config;
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
> +	struct xe_device *xe = gt_to_xe(gt);
> +	u64 start, end;
> +	int err;
> +
> +	xe_gt_assert(gt, IS_SRIOV_VF(xe));
> +	xe_gt_assert(gt, !xe_gt_is_media_type(gt));
> +
> +	if (!config->ggtt_size)
> +		return -ENODATA;
> +
> +	/*
> +	 * VF can only use part of the GGTT as allocated by the PF:
> +	 *
> +	 *      WOPCM                                  GUC_GGTT_TOP
> +	 *      |<------------ Total GGTT size ------------------>|
> +	 *
> +	 *           VF GGTT base -->|<- size ->|
> +	 *
> +	 *      +--------------------+----------+-----------------+
> +	 *      |////////////////////|   block  |\\\\\\\\\\\\\\\\\|
> +	 *      +--------------------+----------+-----------------+
> +	 *
> +	 *      |<--- balloon[0] --->|<-- VF -->|<-- balloon[1] ->|
> +	 */
> +
> +	start = xe_wopcm_size(xe);
> +	end = config->ggtt_base;
> +	if (end != start) {
> +		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[0]);
> +		if (err)
> +			goto failed;
> +	}
> +
> +	start = config->ggtt_base + config->ggtt_size;
> +	end = GUC_GGTT_TOP;
> +	if (end != start) {
> +		err = xe_ggtt_balloon(ggtt, start, end, &tile->sriov.vf.ggtt_balloon[1]);
> +		if (err)
> +			goto deballoon;
> +	}
> +
> +	return 0;
> +
> +deballoon:
> +	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
> +failed:
> +	return err;
> +}
> +
> +static void deballoon_ggtt(struct drm_device *drm, void *arg)
> +{
> +	struct xe_tile *tile = arg;
> +	struct xe_ggtt *ggtt = tile->mem.ggtt;
> +
> +	xe_tile_assert(tile, IS_SRIOV_VF(tile_to_xe(tile)));
> +	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[1]);
> +	xe_ggtt_deballoon(ggtt, &tile->sriov.vf.ggtt_balloon[0]);
> +}
> +
> +/**
> + * xe_gt_sriov_vf_prepare_ggtt - Prepare a VF's GGTT configuration.
> + * @gt: the &xe_gt
> + *
> + * This function is for VF use only.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt)
> +{
> +	struct xe_tile *tile = gt_to_tile(gt);
> +	struct xe_device *xe = tile_to_xe(tile);
> +	int err;
> +
> +	if (xe_gt_is_media_type(gt))
> +		return 0;
> +
> +	err = vf_balloon_ggtt(gt);
> +	if (err)
> +		return err;
> +
> +	return drmm_add_action_or_reset(&xe->drm, deballoon_ggtt, tile);
> +}
> +
>  static int relay_action_handshake(struct xe_gt *gt, u32 *major, u32 *minor)
>  {
>  	u32 request[VF2PF_HANDSHAKE_REQUEST_MSG_LEN] = {
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> index 0391ed72a570..7a04bcaffe9f 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_vf.h
> @@ -16,6 +16,7 @@ int xe_gt_sriov_vf_bootstrap(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_config(struct xe_gt *gt);
>  int xe_gt_sriov_vf_connect(struct xe_gt *gt);
>  int xe_gt_sriov_vf_query_runtime(struct xe_gt *gt);
> +int xe_gt_sriov_vf_prepare_ggtt(struct xe_gt *gt);
>  
>  u32 xe_gt_sriov_vf_gmdid(struct xe_gt *gt);
>  u16 xe_gt_sriov_vf_guc_ids(struct xe_gt *gt);
> -- 
> 2.43.0
> 
