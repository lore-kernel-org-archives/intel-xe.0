Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69570C44506
	for <intel-xe@archiver.kernel.org>; Wed, 21 Jan 2026 21:07:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02FA310E1D4;
	Wed, 21 Jan 2026 21:07:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="US+IyOih";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7B4810E1D4
 for <intel-xe@lists.freedesktop.org>; Wed, 21 Jan 2026 21:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769029630; x=1800565630;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=LOllwW9b0CoaqR565g9I35EFdSjbiBDDLOYowRiHKW0=;
 b=US+IyOihE9OzZB4aG2ywBmL6WUa5l/d6JqZWZpMKoKpSB1wNN9fVpfML
 bsOsh9EpCHEUD71skIwlCp8S15oYZGvwwKw4yI/8J1NtRTKcJdC35EtGW
 2u+Qlq7R+8vxx9DqKar64c7V4eyWfGda/35PrIwPMi7zUe/zp2pXiLt+B
 7SbtXI3eScLYCFCt1HnMq55GwyNXHYetHA0R70GnJiSHpNxK6bXttnOWQ
 B538w2PCzfC+wslveuQXvt6aw81JVIgoHmP/36xDwswIlQewQlp4crBde
 NohorsEDBJiJ7D/tp4U0PCTHEWIaYhG1frFvOIjO2hw23j0qjea0XmOOj g==;
X-CSE-ConnectionGUID: Tpz3LjXxR/+C/dfvKeY5ug==
X-CSE-MsgGUID: A4NhNrgJSsSxtOT09kJHew==
X-IronPort-AV: E=McAfee;i="6800,10657,11678"; a="81373834"
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="81373834"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 13:07:10 -0800
X-CSE-ConnectionGUID: J3KklNo0TnOlqvrVfDIHjQ==
X-CSE-MsgGUID: QUM5S4jlTZ2ma6ZpzdEPoA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,244,1763452800"; d="scan'208";a="206450348"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2026 13:07:10 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 13:07:09 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 21 Jan 2026 13:07:09 -0800
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.70) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 21 Jan 2026 13:07:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DmQojtEJNTs3pF93EhKUHwbrPE4hNAYRUktP2Al40aR5Zkd+ZsgQax9cqgeiW5SpR/KauJYGfynBClYu2buQBjVIaqKQA8dnSD0fyaDrFbrAklMwP/5jfJtQwvuakAfcnt03Y5yuCpY1BIldrG9GocuZX/Gs3aBpCapEFLfr9wmAYzFg09S2aWKC4aIhBxuM6gmeuN+H5ZglbxJzJx8u09StOKUKPHawMhsAn2sAqF2XmxbXDrK8mdV83wB5sQPIlUH6yR1WhZPZgCjOA5NrEezJHrWjCrJHwqTMCtufSKvIIaV+9zT3S9+6fRQX0bcofMm/SYrwe8Iedm1IaCws8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Fs+uKR3bKobrJ/FZ9hbu5OeYgK4zSii+VrahjH3Sv/I=;
 b=wefiFx6NcttwtvXAS1rchYD2WN8J1nCWbWUehdnWBOp7FAiTUh6pyVojc5TK1a9ChBLHsenHEjsBPRR0g462NjDIcyvYisE9Yk1sGEagRUUrHoYP2krIVMMpLaDgFQjDnpOukdTCiYA2SeXehTYFTNzoG5RVhY2rk0AIeRM/JtyA/AWcpuPQjEBcQIkzXCUsRVyoVVkCwyMehxMNd7l762hlDDlxLAYGo117bWOLXcq8GY1D/aXoTjqHlSdR28yU84KOafXIChRZGqXD3IsD7s+lBdwxFuVvXtTbHSRcIw7RZiSxa8pHklKNgsQ3PgW51GKQz1vPTd2QZiJxKE3+NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com (2603:10b6:a03:4cb::9)
 by SN7PR11MB7139.namprd11.prod.outlook.com (2603:10b6:806:2a2::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 21:07:01 +0000
Received: from SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::1edf:e4d3:91d0:fd2d]) by SJ2PR11MB7617.namprd11.prod.outlook.com
 ([fe80::1edf:e4d3:91d0:fd2d%3]) with mapi id 15.20.9542.008; Wed, 21 Jan 2026
 21:07:01 +0000
Message-ID: <bb14af79-4553-43f0-b7a0-fac2e7f943c1@intel.com>
Date: Wed, 21 Jan 2026 13:06:58 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe3p: Disable GuC Dynamic ICS for Xe3p
To: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Gustavo Sousa <gustavo.sousa@intel.com>
References: <20260121143732.523081-2-balasubramani.vivekanandan@intel.com>
Content-Language: en-US
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
In-Reply-To: <20260121143732.523081-2-balasubramani.vivekanandan@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0118.namprd05.prod.outlook.com
 (2603:10b6:a03:334::33) To SJ2PR11MB7617.namprd11.prod.outlook.com
 (2603:10b6:a03:4cb::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7617:EE_|SN7PR11MB7139:EE_
X-MS-Office365-Filtering-Correlation-Id: 4728933b-5ddd-461e-f9ee-08de593104ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d293ZklWdk40QW00Uzg4UFBmc2ZiK1NnZ1JXaC82NzhOZmc1OG5rakEwOFJ4?=
 =?utf-8?B?L016OVpJcFdrNHpMUXlJbXFtN2lMTktja2tMK0I3Tk5TYldja1Fxd3lxR1A5?=
 =?utf-8?B?SGJtWlZlR1l6YnlQTGhjck1pYmJ5Z3M2MERZQUllWGp2T3VsM0djeUhQRzFP?=
 =?utf-8?B?b1Myb0lYY2xlZVhPOVhPL0kzSFpxbWxqcitySDdVeFVQdVR5Z2xZeGJnOXlU?=
 =?utf-8?B?N09RTXF3dXBMeVRud2VCOW03V3lIY2lMYVdabVBiVlR0eUFtODNNNDJRdDJo?=
 =?utf-8?B?T3Bqc3c1ZHVMWU1IQm11eWZScnp0OWJsL0lRbThPSGtBRHNTdWpmN29ic3Rj?=
 =?utf-8?B?RlpCQUVKTGFPY1pUenRGdEFlMGZVNGdZRmRkVHlzVWFwemNnbWFOaEZGZ3Fp?=
 =?utf-8?B?M3RVME52Nm5tRmxrSGdWazJNRUFTME1UWlZaQkNjbVpuRGY1NUpaNi9iYkc5?=
 =?utf-8?B?SmhtcGFvRWZWV1QvRWFXODJZQkUxMGZ5WEorQzErNUJRUlNiUjBJSGl2OE96?=
 =?utf-8?B?NG5pdGE0eWw3OGJPbFc4bm16MHlzMFZQSEhYUE5BRHh2RXBydVQxSGlUVnJX?=
 =?utf-8?B?T0hxbys0TWFNdmtYamxTOW1lc2FHOG9oTGJBemFpVzZRSFhVcGRnd2xjcXBJ?=
 =?utf-8?B?dXMzU2VJN1kzMzJ3Zmk5Q0t0Yll6eHY2Y2ZuS2c4UG15b2g4aUIraUIzK2da?=
 =?utf-8?B?OTdwTDYydG9MWnBrRVN0cUZEMG81K0VKYmdpYlFaa1dlUTg2NmZGTUIvZHll?=
 =?utf-8?B?bXNyK0Y4c0dMU1VGUndKcXdxcnhteDhjSkJxWWFzZHlvQmFEQ240djMydVlG?=
 =?utf-8?B?NS8xN1lsTHVSNW5xYTk0QTU4MkczTUVEK0tCSGxCZXRiY0F4VVNreERjaG1B?=
 =?utf-8?B?aUZQRFdpaFFnWmhZclIxRzJ3MjVxSXZRZ1lkaFZVY0NYMHJNdmhvTXIrWUNL?=
 =?utf-8?B?aFhnN3Bqd09JcHhuSjR2cERSZGFwZDhzSTRBRUEvdG9BYS9Gd2JibWxQcDMv?=
 =?utf-8?B?aGRVNHN1Q2FPd2dZMEFFQ0lFZjhtS1grak5jUUc4VXVORldtN1hFbWxoaGJn?=
 =?utf-8?B?VmUxbjh5Y1JrQnBKS1lUTUlEempJNmdNZFJjUXNwYXFJTUpEaGs2L3gvckJL?=
 =?utf-8?B?MkhraVJvc05KK1FhNzN2Sldmcm5jcG9OdTVGZSswaTJkWHBqWDZMTmdITXBU?=
 =?utf-8?B?LzRaVzZDTnJJQXhnNHR6SHdQV2tlWUoxNUxUYmFkTkRLQ3RuNktrRDEydFlV?=
 =?utf-8?B?VnVjcHFSWVNUdDhGNkZ3VlpKZmpGaThkVHRKVXk3K0VkVGxLK2lZWEZhTHp0?=
 =?utf-8?B?czdUMXR1UXVjcjU1bzh5eFA5d0c1TFBNMGJwakJ0ek4wYy9TT09Da1BRckZ3?=
 =?utf-8?B?M2dPbWV5c0hkTHZaNElZZE1wL3FsQ05UZEVDeDhwdURxQlpQRVUrSmQ1emhl?=
 =?utf-8?B?UkJyZm5MSks0VDFwaWV2bzdkcy9yQnFWV241ZzNaT3ZRZWZwYldsZ0FZSXNy?=
 =?utf-8?B?aGl0ZndFSlVmOW1zNjBwSVFyUkVwd2IwYkFUUlFJZkxrbFZOWkl0RDdveE0w?=
 =?utf-8?B?cExMeDlKUDFObnhNelNXclc0VlA4dk8xTW1nV1BXZGorcjJqV1RJRk0yRE0z?=
 =?utf-8?B?cFpENS9TLzJhcjdhci9JMmo1M040QWUyQTBYY2c0RytZRk9WL0dmQy9CVy9D?=
 =?utf-8?B?Qml6K2J0Q3NoVHVKczE5SGxFbHhFUWZnekVlZHNKaEc4M0NieXZ3azZLTXkr?=
 =?utf-8?B?c1AzNnAvUzBaRVdQbTNhNGx6QXBGMzJOMWZtWHVvcjRYTzFPdnlWcGEyVEFF?=
 =?utf-8?B?Y1NXdmlqN25ieWp4V0U1eHV3OGgzTmQ5T1g1aUlwZ3Evb1VzWnZjYVJZbno3?=
 =?utf-8?B?OXViNkg3UENHa3JnSExwbXNBdHVpREdTNXV5MDV2OW1zV2ptUlpuRit2bi80?=
 =?utf-8?B?OUM1bHpxcWdORVJvODl2OFNWL2N0ZTJVYUlPck5wZjh0Mzc0NHc1bTJTU3Zz?=
 =?utf-8?B?WU8valBqTmt6VkJnNk4xRjRScXljSFIwN3VJYjFsK2tKUkR5UFNodW5mRlo5?=
 =?utf-8?B?ZWlVVWhPcmdNRjlqcWdPVGVNamNEOW1oeDBvV08vbksvZHdhS1Y1WDIvTWY4?=
 =?utf-8?Q?2IFM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR11MB7617.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkZBaEVnVkxmVytJbW1VSGpDY3pGOFlvQnRHdjZBdzU5SmxjQlJ0UmYzSnl2?=
 =?utf-8?B?TzgxTUVSRGF3Ym1CZFBlbzJWL1dOdFN6cjVIQ05sOHJCMm5QMVpET3VjRFhU?=
 =?utf-8?B?akZhWU9iZ1ZuTTVORHpXRjF4SjRFYVNZOVI1U2Q0dnovRHM4UkpHYnpBclUw?=
 =?utf-8?B?aTJwMkFOaEZ1eVlCdlYzSkZ5SWtJcXBWWmNhbXZKRmNlSnljU2o0ZVh2UWx4?=
 =?utf-8?B?eE1DSVNROTdyNEVSaE9Cako5aUd5K2JkZjI5ZXlWLy8xUU9TNG44YUlIVkVF?=
 =?utf-8?B?SmR4T2lFTU5UZ05OYWFvOWRkcFNPOU1UYWlwcldZWEM0RGZIMEEzMDNvL0Qy?=
 =?utf-8?B?eTdFeFlYWXlyRkRJQVI4dmRRRXoyaW02MHE3LzU0cFd4ZmRWYlU0cmVRZ0Fs?=
 =?utf-8?B?V3Z0TisrRjFBSVdLZXpEWjVhL2VJMzJIR1BwQ0pFK1BZSlZ4U2NJZ1dVai9j?=
 =?utf-8?B?VzRmMGFOMmdmOUxDQVVHY2NESTNjRVFEbytRN1JaS1gwOTdCdktORTZ4aUFK?=
 =?utf-8?B?bnd1NW9WUTNsSG9GVndadU1tTXVMTFEweGNrM3pkdmkwMEhNTldLdTdUdWJm?=
 =?utf-8?B?T2ZnNzBCektDcCtpbUpSUHJ5eFNRZHZ3WUphaXBkZ3JoK3dKOExWamxENGtB?=
 =?utf-8?B?TGpGMHZXN3FjZUpKYjlLMFVRbFpPSGNwYTB4UkRiRngvRTlRVEszcHVNeit6?=
 =?utf-8?B?ZWVQWUUrSVUzUi9qNWd1SHFlS0g4TWdsMDdkK0UydERscGhsQXN4QmlSRmlz?=
 =?utf-8?B?dFE5TFFwZUJEbml5a2YwcW1wcEJzd2dHTEhiTEUwbDZ5Z1Z4TkRGeWFsSHFH?=
 =?utf-8?B?OG83MnZwVWxxU1liQU1pcytHenNyMVIvUFVqV2xObGpVbXdXK3ZuU0FxR1By?=
 =?utf-8?B?WXF6UW15MEozRVg1c2ZYclk5bmxzNHF1NEdWM3o2a3FUUnJ4YUpLMTRsc3Ew?=
 =?utf-8?B?RytyL1FuRkVCQXhwWEhkaGtVZVk5SjB1bkdBT1hxR01nSVd3d2UxUG5CWWNM?=
 =?utf-8?B?aHBPMHFza3dBRi9TYXhjOUlzNGZVL0NLcWZYbjhFZWhQTGxBbnJ4NjBlU1NT?=
 =?utf-8?B?YStKdE5xS3F6UVp4bVlIQjM0NjNZZ2dJbmJBSUZnZmFwTEs5SlB2cS8zeHVF?=
 =?utf-8?B?Z2ljNlVlQk1ndXdkNm92L24vT1NaTUdFMDZyTUErTmhScitLZlJpM0N1djZr?=
 =?utf-8?B?RUlEWWphWE5UblVCejVhY3Z6NUVybElOZUt4YnVOS2x4T1F2Ylp0a3RSaU5R?=
 =?utf-8?B?TWF3V096TjE2SlBDWHdGVTNVWmhkbitxSE15R3Z4elAvSU4vVFQ0QXdsYndz?=
 =?utf-8?B?OVhpajBWaDJHMHFtZ0tjRk4zTFpYSWRUOCtpTkQ2Sjl5cUN2VUZEaXpJYWQx?=
 =?utf-8?B?Q09OVVNocjdjVXY0ZnlER09JM3F2L05HMEhSRXRpRm1JMTc5ZjlBMm5NTFJI?=
 =?utf-8?B?ai9MNlNtZFBGQ2dpQTBRWUM5R3c2Sys3UHlOL2dhRXlDM2RuZ3JLYjZzdEhm?=
 =?utf-8?B?TDBxYjZTZ1N5aWw0YWtOQUVXQ09MbnRhdlhrWVpmTndMWlBBeEF0SXlNVUVP?=
 =?utf-8?B?TE5RcS9SeXlITkxpc0VIQzU1cWQ5WmFKUlNsejUwNUc4ZEp3ZTJsZzI5cklq?=
 =?utf-8?B?d0MxVDd6RDZ4V0ZiS0xadlQ1bXBMbnNKODVlVk9xQjgxU3pxVFJnYTNOYjZI?=
 =?utf-8?B?bjQxNnh3UE92NzFHSHJzUUVDeXpidG5UNk5IVUdIcDVPak80K09tYmszWUdE?=
 =?utf-8?B?LzNzYXNKNmFJWUtYcHRjNnA1dUJzSFYrV01vQi9GQTdEZHhtaGVyU0ZKL0JF?=
 =?utf-8?B?NU5xeXUrOGdnVUxEMHlhNHlQZTNPYkxySm1wQVowVS9DMlFuUzAxOTYzVVZv?=
 =?utf-8?B?M1F2citiSE11aFkrZTVlM01jMjFXeFdLYmZ1Zzc1cUZyZTFsNENPTjVCeDBG?=
 =?utf-8?B?T0VNMjBFNElKT0lYaGhDL29hRUt0TkNhTjVHSjlvTzdTTSsvcmczSU5Vais2?=
 =?utf-8?B?bnVaeDRmMHB3TStPaTFTQ2pwTS92M3ZSQ3JQd3Z2TkpVeXRsNitpWFNubmhr?=
 =?utf-8?B?RUluSGdnZ2FTeXZDTGUzUEF1SHJnUkw0YTc4YmNDeTA3WnNCaXBHVUpVQ0pT?=
 =?utf-8?B?c1N6eTNVZjRWd0dSS3lYbFhhRFJZUTFxSE9DQ0RySHJUYUNZVFJjTWZDZG8v?=
 =?utf-8?B?MHk0d3hIM0FSTGdFYlFDcHlTME0wTjdxaDFtb2pqUDVHQzg2cHdhQnU0TGtl?=
 =?utf-8?B?MUd5VlU3MGVSUkVaTTlyN1V5NzUxbk5WVW9SenBScy92dkRBRUFnSStDK1Ji?=
 =?utf-8?B?MWZRZ1ZrdUw0TWwrV2VnVXUzN0pkOXZZd0tTZUhocXR2VVZETFJ6YUN0T3Zv?=
 =?utf-8?Q?/slhEC5YPAeFwbzY=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4728933b-5ddd-461e-f9ee-08de593104ff
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7617.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 21:07:01.2319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SKxlR0SLeDJFIxUYF4d5gk6f9uDpE9/j+jDrtj8W8RhZiYFQcGAIa7OJFIQLGQ+BwP7TBVBLGnQsB7yR8JZhzGp/QuWQv2hyYOlAXGd/+7A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7139
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



On 1/21/2026 6:37 AM, Balasubramani Vivekanandan wrote:
> From: Gustavo Sousa <gustavo.sousa@intel.com>
>
> The Dynamic Inhibit Context Switch (ICS) feature is not currently
> supported on Xe3p due to conflict with multi-queue feature on the GuC
> side. Disable ICS so multi-queue can be introduced for Xe3p platforms.
>
> Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
> Signed-off-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 7 +++++++
>   1 file changed, 7 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index 44360437beeb..e350ded92544 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -608,6 +608,13 @@ static bool supports_dynamic_ics(struct xe_guc *guc)
>   	if (xe_gt_is_media_type(gt) || gt->ccs_mode > 1)
>   		return false;
>   
> +	/*
> +	 * The feature is currently not compatible with platforms with support
> +	 * to multi-queue, even if the feature is not enabled/used.
> +	 */
> +	if (GRAPHICS_VER(xe) >= 35)
> +		return false;

This has been fixed in GuC 70.50.0, so this check shouldn't be 
necessary. Are you seeing any issue with that GuC version or newer?

Daniele

> +
>   	/*
>   	 * Dynamic ICS requires GuC v70.40.1, which maps to compatibility
>   	 * version v1.18.4.

