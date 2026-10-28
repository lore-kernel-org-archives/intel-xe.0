Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 080AA606A327
	for <intel-xe@archiver.kernel.org>; Wed, 28 Oct 2026 17:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=P2hegEVK
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C49B110FDE6;
	Wed, 28 Oct 2026 17:24:54 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EC7810FDEA
 for <intel-xe@lists.freedesktop.org>; Wed, 28 Oct 2026 17:24:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793208289; x=1824744289;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5n0mBegiLk4oWBrO7YYS+byta4eQZ9o0LIB9gB7F5Ow=;
 b=P2hegEVKIoJbiU8eJbsy7oxkZ5Y0q5wKxW5QHY+e1bxoZDGGBRU7stOg
 Ezz8hYM1QKZj+DGuwT15swx8xpp0rAaClITf7dTZugAQUXlw9TI12kFvt
 bX0IjJ8kgEbX+SpsnW11q+Dj+xiaNGucT75aYBYrjfUXEfzVXkf7aM6eo
 8V7pXhATGzKHya98FW0UUZVkkMtfjiUDUaMUM9Np4CHaHp2EhoMErGaVa
 tvtx2/fS4+meyxUi2CZNfRbVvium4dwke7iCymmKDODsfzu/cSCcBJxaW
 XSgq+reiPScDEzQEw19sAnl9cuao3Ogm0fgP72Y0KY2iZ6AwIulw5r+vL w==;
X-CSE-ConnectionGUID: YVE3FELcThCeYRgkSL84gg==
X-CSE-MsgGUID: 2QXoGaeJS62dPnT4fmoUpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1941125"
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="1941125"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 10:24:48 -0700
X-CSE-ConnectionGUID: OmFIPebfTbKBoEtY0Od5hw==
X-CSE-MsgGUID: 13nCogukRt68DfpZMChleg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,183,1787036400"; 
   d="scan'208";a="5425827"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2026 10:24:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 10:24:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Wed, 28 Oct 2026 10:24:48 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.9) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Wed, 28 Oct 2026 10:24:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9ckB9a8jeupNKdk/bqQnFAWn6cc2jp5rb+b04b4zT7Dl+kyyEEUuwSxxYxWs4l74wZMKkMSsuQU0cX+fMbMC42AzeYdLjlFRGkuajlXBlhfMWCsvJxMiVC381lIDeb7PvxAPYffG/hshUlugeG6OfK0oGzsVkRo8Q36P6O7/9+AlDQisV/sW2aQ3ClOKvmQ2VHEhTh7WOyHqaL98GVkV2kmbZKdj56IlJIPTwRkIGYeNDd/S/ZNxaObdLCPv1y7pYYSxLlfq8hUhi5+d0pd65IyRJ3vPbB2gForJAVs2lLolEerdwjRL3lg9O4FZR0MlFLYWEgwLhiCvoxfeZG+jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n2AK0NLqHnb0p7c8/DxDnVhaJGmFr7x1Mzb1Zrwua0I=;
 b=tLHpEtf8EcwddJn8G1D9FfW3UEcmOfd/wE2VFBvcOzVAEC+eeF9zawwPMZKOkLUQFUgv4hg0aOgi6Tu2LwpTuXbexXyXB8gRb5UY9D2n+EIHtEfzous2EXX1gOy6bQIt54zqomo94VsVvrv3a/WPuYlEbouFKKKt5c6CuO2+5VhdM8gmdi/aIijmgeLVBRN2ddobytBlLTXOq/AVMuR84VNQp3DwpiqB28zjqnxIOAuvAXS8SpWLkecXXcpZYANv1MPabSZMYdnPILc+DnxRjIsTAqh5eQUxCT30neancUjVXOQH4GyPDhpf7eiZPw2yRE66NNMF/v4giC58/W0Avw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB7145.namprd11.prod.outlook.com (2603:10b6:510:1ec::17)
 by IA0PR11MB8417.namprd11.prod.outlook.com (2603:10b6:208:48d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 17:24:46 +0000
Received: from PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b]) by PH7PR11MB7145.namprd11.prod.outlook.com
 ([fe80::341e:838e:e911:f62b%6]) with mapi id 15.21.0569.007; Wed, 28 Oct 2026
 17:24:46 +0000
Message-ID: <5ba99703-abb5-4a6c-9de8-54c585cb32cb@intel.com>
Date: Wed, 28 Oct 2026 22:54:36 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/i2c: Fix use-after-free on driver unload
To: Andi Shyti <andi.shyti@kernel.org>
CC: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>, "Bartosz
 Golaszewski" <bartosz.golaszewski@oss.qualcomm.com>, Danilo Krummrich
 <dakr@kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
References: <20261009164241.923756-2-balasubramani.vivekanandan@intel.com>
 <7939f69c-bc63-4465-a578-8024e20c4eb8@intel.com>
 <auCda9k66Yi_Mh0z@zenone.zhora.eu>
Content-Language: en-US
From: "Kumar G, Naresh" <naresh.kumar.g@intel.com>
In-Reply-To: <auCda9k66Yi_Mh0z@zenone.zhora.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0076.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:ad::17) To PH7PR11MB7145.namprd11.prod.outlook.com
 (2603:10b6:510:1ec::17)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB7145:EE_|IA0PR11MB8417:EE_
X-MS-Office365-Filtering-Correlation-Id: 83ed45cf-88e2-4388-450a-08df35185c72
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|4143699003|11063799006|56012099006|261009223027099003|261026121527099003|10067099003|261021123027099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: isH2V1jqZ0dc15ooCdsFPBYOrrGsdOufBVBeDL1x4p230JD6LQYpyMkuYZIaOpb5/9QPh/wJx969kL92AReRWsuHirsUeWqMrxm7LBL+Hw3QFY91UpupGG4nWSK3xaxqNvljWndpPXq3uYvpUBqLScBLiCQTowMks4zbl/O5aCzXosFMALQCblh5ECYTNUgX4jipOmzHNsWkVSSW9IiTT9XswVHP75ilORp19Nk/oPCcPPpGQCn4ZwTqUEx23EW3zkJGXyV9cgwdEVAHtMOe7VGJiDCEl6nzSwGo0v5E+wr15O7DtIu5e+hfHg1CP3iWM5K7+mR8wU5xQFS91YMluypxksqslJytMni3MGxsH7FydOi5MubDJCm4Vo7szLYW2jY6BbAMRo3NaaT/5GhbcIQgq0yLX2Ep6z3O8DClEEt8rQq9viigo5aXQeLFpGGwlf0rvqaXPFX1i0mrIyCIFgHhpeyvA+ZoVjMvbOmHK+fr2VMv/2CAr3Sul8Z5pX13kUq4V0eSUUTs1IkiOYyoI5exFTvS1r6yE/jwT0m0xIAB0mGZuesP+mSm2bNj+ObdMdOuIfF4ATk4qW1Qo6jhceo4aBgr9hkx+pv+cw+8xh0huVb4Nqibs4fL99d+Nob6hgc8yhsua3Zefy9wHw7aMQkDUyTTUZ5RTVxzreBBBR0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB7145.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(4143699003)(11063799006)(56012099006)(261009223027099003)(261026121527099003)(10067099003)(261021123027099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VGJUblE5N1V2R1Awd2xJK3Y4KzJ5cGVQZDVoS1g4dzJEeWZ5dzhOQUhkUHN4?=
 =?utf-8?B?UFU3R20wT3ovZ2ROQndORWFHamhRRjBuVjhyMGd4THVNTTYxRXJmL2xob2JS?=
 =?utf-8?B?Qmt3UCtHekpxSlY5dmw0aldSRUcwSEFpci9tdVFLd21zUC9HUG5zRWQxNlpi?=
 =?utf-8?B?SmRpUzNQVXI3Y1pIenduVm40VUpIZmI5aSs0UTJZMlllTXAyWUFYUXhwVkRu?=
 =?utf-8?B?UU1jVzFjbHJxTlhPMUpQcUVhNjNVSkJqUGRoWkZxOU1CNm1LZDJSbDNIcDdZ?=
 =?utf-8?B?c0JUbGFrc0N3bjdUMlYrTEViUDlnWXE5MnBGcjQwYk56SDJXMnIwMzNOQmdz?=
 =?utf-8?B?K1BMbkZZNysydnF4eXIrdFNtMEFZOStheGdVQS9yblZvb0c0RzEySjNEQ3hC?=
 =?utf-8?B?bDJ4clRVeWFleHhKaWQ1SmlTRk9kYlRIMmdkYVJoM1lSaVVES25IT21uNlRp?=
 =?utf-8?B?NHFtZnd0eW9kcTBOOHlFdlp0eTAyVG1LYWdha1FXZVVkVnZBWU1pNHUveDJU?=
 =?utf-8?B?SkJVV0o0Ri9YWEFaRFo4a1Y2Q1BoUURMaUdEQVlmQStaVnBhQXR5d2JHNlpJ?=
 =?utf-8?B?ODNMZXJpTjF1OTAreFNMMCtISUFsMVd3Q0p1Z0kyWTBPS3JiVGM5a0VnZFdN?=
 =?utf-8?B?MnVTSGY5MFdJNy9ZUmE5eDY2S3VpUE5WRnZkb1UvN3RQZWNPSGdTLzJCcGhI?=
 =?utf-8?B?YmtENmJBV2MwSjBnVGdvNjZMaDZ1NnhYaTdFbm5kVlYrQVo0amptOGE3U2Zk?=
 =?utf-8?B?c3RXaDIxeHRwM1JHMDloMlhmMVlNRy8vOVkvSlp5S1l2NHg1V04zQlpZcTJS?=
 =?utf-8?B?M3ZnV0JUNWRKYmhhVXNDOE1iejQ0WUhkZWpXUVZBRGlnYmRvcDhGVjQ4WlJC?=
 =?utf-8?B?V21oekoxcGxaM29GZVdVOFRDczgwVW1VVnk0aUk4UzBFckM4K1k2dHQvcnFJ?=
 =?utf-8?B?c3BEVlVKVEp3WWZSUmdRcFIyQU56QXcyWWdaRHJKRzExcUdxUno5cHJuV2dD?=
 =?utf-8?B?UWUxMWVNWnYzSVBwZHNqSmU4ZGcxRk1KV2FjemlCSVpZSzFRbkJEdGlreTFH?=
 =?utf-8?B?TVFDRGRPd1d6ekVGNlZFa1Y2UVdoVGdlNE5zY0tybE5TK0w1VUNZeml0TW1G?=
 =?utf-8?B?TVc2R3Q3Rk43S1N1aWZIMmRNSjBQbm8xWFpabEFqcXJuZWg2RUNBNmNrSVgw?=
 =?utf-8?B?ZGZ1UUZYNkdBMDU2ZXlqUnFZUmdxaEYrYlMvZ1FXUWVqbjdiYVBwa05jWGlW?=
 =?utf-8?B?S0xIbmdDWEx6aGJsSWFOeENFU09IMzJjc1IyRVMwdEJzNHNRSERBaXlHTkNs?=
 =?utf-8?B?bGRuQlBVY1FKL05CRGg0TEhuWFBpc3l5cmdTVmx5Zm9RSmJseUtLd0Y3SXN1?=
 =?utf-8?B?d0NPRHNoSFh6UWdjZnZ6aG5SWUQ2OHo3bDNJWHJaZDZLd1F3NXRBRVlEWlIz?=
 =?utf-8?B?UUFVcHkrWDdLSVRuczdOdFpRLy9xNmp4UHRTTkIyYTZwQlMrWnFXcTN4RGZW?=
 =?utf-8?B?M0p0ajlmZDNDc3N0TGtmc0poQUUzTXNwWG5mQVcxT0ErR1Bra1RNRmJ5ME9G?=
 =?utf-8?B?N2gxOUdGNUNRSW1MTUYxMitVVENYbU95bmlIRFZGTTh2OHNsSUlLVndrdk0w?=
 =?utf-8?B?ellGTzRKT3pYZlRuSnRLUlBMVERxNktVMjc5VUdOejcvdWhGekVqTXZvZUYw?=
 =?utf-8?B?RkdFdDkyM0JXcmVtUnBFMmZEckhBSi9jeGczTks3eWhmZGo1ZVQyV3hYUjdZ?=
 =?utf-8?B?QzFSMk9Mem1jdWJMc1BMOUN3RU9Od2RrZ1VGZzVURHVPT0RTM3RmdERweE1O?=
 =?utf-8?B?Z01mcHF6Z3NnN3lObWZJNG42WmZIL29jMXIyUFEzY3NhSU0wMlhEN2JaTUxs?=
 =?utf-8?B?NHE5STNhYzYvOUNsZTZyV1RLRThmRHM1bkMxS2F6aWsvQStBb3VkajZkZHlB?=
 =?utf-8?B?SzRNL1RKUXdHVTdrU1lDdWtDZXRmL2FFaklxcUVaYzZ1a2VOc1VLUjMxaEQ4?=
 =?utf-8?B?aVRiQ294NEIrK0lxL25LTWFOOS9ueU9VajBvTGYrSmJjVll0Mjc3UXVGdExk?=
 =?utf-8?B?cDBVR0R6bU9oVTN5UkFSUjZjSFVvMVJKK28zTmp0OEEyR1BrYjYxNDkzZm5U?=
 =?utf-8?B?QXpDOGNQcDlBQytSOTEra2dRU0x0TFhMRGJBNGNpcVVnUTk1VEh5VXl3SnJG?=
 =?utf-8?B?S29sZHhZSnF1b2cxZjV0alY4ejJNcDlZUGhBeG40UzB1U2ZseVJuME5BcmZn?=
 =?utf-8?B?aE52NVlTUkM4S001VEpBMlpPL1FNa0p6VzA2V05FNlN1MXltRGpSS2pmM2N2?=
 =?utf-8?B?c2pJVkIrUTNhWmU0SGNVWXVNUlVTQW5aVGM3d3ppQUNid1BpZExTZz09?=
X-Exchange-RoutingPolicyChecked: zgh9ClUQNgDvZEuaJbhXqcdBCx7ZDgXWXCzBmBRV+NpLTLEcQdqgERPogJGxpZPTiZUryIr19ldtYwU+zK8/yc1eem42VCzS+vdE0765dEUj9TFwXbTwJrRrfGS9mNs1DuW3fDqqglg13ThwJN+2dkqt65IK7Ex3MDArv5itK/NkAU+pP9OxRa/6ioEvX5GMljYBoBSa9RrnXUmHU/Iw2JAzhtSOHnanQ9o1paLkqWrEgqCk8nnlrn+IMGDx9iIJFgy+HevIKqrCnWWBpUzM6SChpqLaj7dJp+IwyZqYioJewBhCcCTrl3e4CXPZ+0rbQBO/3s1nu+733w87L4eKCg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 83ed45cf-88e2-4388-450a-08df35185c72
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7145.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 17:24:45.9642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oH0J+vYOPvIsC7wMfjvOAOM5VelkcmZzGibKarbVHTylhltMVF9W1wPUy8tjz0jEuzDmzDT1fu4D85dO3FunZpgPIuXa2pfpT+bKI2WQKDY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB8417
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 10/27/2026 6:19 PM, Andi Shyti wrote:
> Hi Naresh,
>
>> @@ -1198,6 +1199,16 @@ void software_node_notify_remove(struct device *dev)
>>          sysfs_remove_link(&swnode->kobj, dev_name(dev));
>>          sysfs_remove_link(&dev->kobj, "software_node");
>>
>> +       /*
>> +        * A managed node can end up mirrored onto more than one device (e.g.
>> +        * a bus core copying the fwnode onto a child device, as i2c-core does
>> +        * for an adapter's own struct device). Only the device that actually
>> +        * owns the fwnode releases the creation reference and detaches it;
>> +        * every other device only releases the reference software_node_notify()
>> +        * took for it.
>> +        */
>> +       owns_managed_fwnode = swnode->managed && swnode->fwnode.dev == dev;
> at this point fwnode.dev is NULL, set from device_del()
>
> Andi
>
yes correct, device_del() clears fwnode.dev for the primary fwnode 
before calling software_node_notify_remove()

