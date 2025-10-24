Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59E6CCF9E0
	for <intel-xe@archiver.kernel.org>; Fri, 24 Oct 2025 19:45:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8033010EB37;
	Fri, 24 Oct 2025 19:45:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aYQP0Z8L";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D0A10EB4B
 for <intel-xe@lists.freedesktop.org>; Fri, 24 Oct 2025 19:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761335122; x=1792871122;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ZtDbiXKO7sAJppOk8TpWwBsE4gp4F6ibBSu9/wJ59OE=;
 b=aYQP0Z8LP2+reHTMALoK3itUED/sfiNOoCl+Ht0/hF98+Ph5NP7EO7cO
 mkBdtxq2e7UqrQmYHuGIsZiKtRpWXtTXl5aWRkGsi5P2sv/3+UDE5nVqY
 Gm3lMfL29uKEx7TykYng7Zi9lMk0599Qw+tn9Uq9jgmpA3/5LwGm9jGj0
 qBcoFwUaaXXHVWCON7MuXjYI8PmXico7Ds/uxC2Lr92KIJF74SxvjUZ3G
 BtXIw7dPBnL6X/C/Y9HAKxf0Y7Ly0+KtPPYL9nuq9pfmyHQhf75BD8s0h
 zGK5n45uJb/QMIoayNXbvYyEyfTKMpBevIXMycHeHXwfqh02gHy/usRyC g==;
X-CSE-ConnectionGUID: R9qQ/BZwSn+2Cikq2whroA==
X-CSE-MsgGUID: 4brHFCf4SqOb3GyfxV+YYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74866875"
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="74866875"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 12:45:21 -0700
X-CSE-ConnectionGUID: r+eINjk4R7Wzd+u+pZAVWA==
X-CSE-MsgGUID: RTufJz2RQlO7ZkI0rpReIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,253,1754982000"; d="scan'208";a="215165061"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2025 12:45:21 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 12:45:20 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 24 Oct 2025 12:45:20 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.1) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 24 Oct 2025 12:45:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NvNRpC8u9Xl5xutrfyqQLF73CeIGIhD/rsi/1V9d48Gl6dkbBSHzTUP9ntt7eTRF38uRORAoMffklkBjcckm3zrpbyEHb5Xn4UzsiqIZckCAlyxZn0vfct9ecImEXtR9uh7mSkpcqqxMl68tP7cJbvqQjmvHHHgfLzTVG85bEyN66OwAwnHge8j5SzmEyJeqvr5L9NOqkQ3P4WFXBjei3sjc4s6eYItlvtl/T1EGwYfxarL6K7egzZKR2UdBfTt0XuWdcyxHbTj+FOxc1f/0bvS42nVl3udfRnjuO9ETRQe5yRwUyXIR0zSwnMzyxWFFlKMsIJ8jnzuBy8FvJPqHCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=datmVV73K9Gwz/ZPS3XnY/KZMU81L5HPTKhCtyfWvIE=;
 b=S6nX+sp84nkxD3TLFrFCRndnQ9m8tlP72pvz2ZBwY4uhhcljRX7Ip8zIJZPk3R9zYnN/e8PLUHQinZwqRMusqs4RVcjB+zlt3R4D67H6SJaNQil8O2c8+1wSRWyDWPt7aueVK/nZOThvhqxyyg53AQYs7ppg90Ge5rb8ggxKRhkep0cYUw9PUCpYwZ4uW8gPiNp0ahWrHYuV7Zg/8JaH3aWpAhCWklyHO53AWloZQcj/kYXJEE4Oq7whIC2LIoPgQ8k4Hr9my8y3ZTye7iqBZnXfvWQT5pjfrSf63R4JYVGEw7+N0H6kmRmqrvUQBFlcnmZrdomqD0JwRY4aghe5mg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by CY8PR11MB6841.namprd11.prod.outlook.com (2603:10b6:930:62::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Fri, 24 Oct
 2025 19:45:15 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%6]) with mapi id 15.20.9253.011; Fri, 24 Oct 2025
 19:45:15 +0000
Date: Fri, 24 Oct 2025 15:45:12 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>
Subject: Re: [PATCH 03/14] drm/xe/pf: Allow change PF and VFs EQ/PT using sysfs
Message-ID: <aPvXSE6q_QXdvoHj@intel.com>
References: <20251020182414.576-1-michal.wajdeczko@intel.com>
 <20251020182414.576-4-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251020182414.576-4-michal.wajdeczko@intel.com>
X-ClientProxiedBy: BYAPR02CA0050.namprd02.prod.outlook.com
 (2603:10b6:a03:54::27) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|CY8PR11MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: f47617d7-6d05-48bf-df13-08de1335daa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlVvbklFQ2RaTFdBV1ZXL1FuVmlhdkZRMXJzMzdtRlkxSzB1NXAyY2VqMlRE?=
 =?utf-8?B?aTFOeE9CVThjVmU0ZVM4K05UdTA2U0NRWDltelQrTUJQU2hVU3ZreU44SkIr?=
 =?utf-8?B?WlZZQm40dWtVVlJYcDQvUkNxY1B4WDJxZExmVTZnVXJ2eVFNUzE2VUxIeG5I?=
 =?utf-8?B?ZmZVTVNzZ2RqTGd3Ni83ZGU1ZlZNVzAxcHhNMVRxOWIvbFl3bjFVYmhVc1Fk?=
 =?utf-8?B?WFFxb0NOMkJ6ejc3VzRVRXlpM2RQZ3d3dHBsaUtxamFvQ1RyR0ozZUNiTWto?=
 =?utf-8?B?VTg4M0NKTlpLRHJ1Ukt1OTVzUDdhWXg1TDIzRjZrUGtRZ1dVcllTcEVjbzhu?=
 =?utf-8?B?NjNJK2p3c1NNZHJVdWRxTVVoVWZRSitIekZJUTlWc20vQUQ1Y09ZUzN6c0hq?=
 =?utf-8?B?SkRFV2JSVWFxa3NZd2NaZ2dydzZSWXVqNFB3eUpmL29jdkxaSm9MUUVodnVI?=
 =?utf-8?B?bE5XWWwwRnFYRzhtOWdCRy9kYXE5OXA3WFZSRmtKYnVCUkRSMVJWYUJkVmFL?=
 =?utf-8?B?MmpDN0ErVitJemJvWlNXYW04TkZTdS95ZVppTDduNnJtRUdTUFd3VnFUV1hV?=
 =?utf-8?B?UkZCdG5mVUowcGExNDVFVmdESy9mRWVCZksxYTIyTVVONU9BOWxOR1p4cUZh?=
 =?utf-8?B?MlpIUlplNDdjZ08wMThuS2UwYnAzQkVMVGRRbDh0ZG5ISHFPS1FmMUhtSzMv?=
 =?utf-8?B?bU9zRE5yMlNsWUNFbTVwcm83QWlWczQyYTVNYUFwYVJZejUwUnlpR2F2TlJW?=
 =?utf-8?B?RTIvZjZWTkZiSFdmbWVRRTloaXNwWUE1QXJVRjRIMXhaWmNnTzJNc2xJdXVE?=
 =?utf-8?B?QWRKb3RsMkdoTUZZMENxd1hDbld3dUNwOGU4Sm95WnFWRDJTTzhmQ3VheGhF?=
 =?utf-8?B?YTBpZUkvYzYzYWdEbm9KM3RNTFJSV2VoVGV5SEYzMVFTMlBtTk45WEdxclRr?=
 =?utf-8?B?TWpwelhEQ1hXM3dCcDBDYzNMWnFab0JGTXJGTWx3b2FKR0xhNU5DUjZzSkta?=
 =?utf-8?B?TTBFT3F2R1FCT25PUnovcG5uTW9YUWdVYlFReGczb0NSdDF1OG1WSXN2RTk3?=
 =?utf-8?B?WVEwYyt1TmpTNzhyL0Fqd1MrVVorSlpVb3p5d1diTEZZZThJSHhRT1JVWWxw?=
 =?utf-8?B?UHlFT01CcFVqYmVHYUdETGpHTWdTVDR0cWdxa0RLOE5McFBoOXVDUzVQbEc0?=
 =?utf-8?B?VmRDUjRNdExxUGhjcnI4d2VDYmtQOERxV3p2dzdrb3FZeDFlQzZkTUtXK1N4?=
 =?utf-8?B?UllaTWlrNkQxa0lWTFZCYWxhWFBrT2g1SE8zQWVIaXBPSk9aY0dOaThET0ti?=
 =?utf-8?B?cWpRZ3l2WWZTT0xFTU1vaitWN0I3OFg5QVQyTGwzZzkxYm5qeWNoQWtMV1A5?=
 =?utf-8?B?N1lUbFhrT2xZSkNtSm9QOG8wYzdJbmIrVjFOQXR4VEJtTHE3ZC93RUZsOGZN?=
 =?utf-8?B?ci81STB6Y2FXRllsZHZKREpzU1pzREhrZXdIcHRSY1IveDJ0Qk0xWTNRZEht?=
 =?utf-8?B?M3l0R3R1QVJlRFI0bzMzV0Q1aXV1MEw1V3BVQUpON1lkWXE0cmxNejdNaFJq?=
 =?utf-8?B?ek1zSGhhTmZCa0JManNmOE9WbEZ4MUtXb3RXWTQ4SUY1dkJDYTBGUFVNVlhQ?=
 =?utf-8?B?UllRNTQvTHBFRmdwSFV0SHFQZktyODVQNUZYTytUSVd1VTF4d2JhSGlka1NT?=
 =?utf-8?B?SGdFd0xuTHd2bXNDb1ZJVmgxRzNTMkYrNERONWUzMnpaQWRuN1d0eTRHRm9m?=
 =?utf-8?B?azRwS1UyYldhNFkyMS95MVpNanBYd3NGTG44U0lrYkJ0eEJpU0xPazFGLy9j?=
 =?utf-8?B?RjY5anJtbTRsc2M1Vmx5NVZJYktWeU56YkpkcjlXakh2MDJrRU9SSUtWUWx5?=
 =?utf-8?B?Yy9CZm81NFV5YTlDTldONTA4SG1wdGdJTkVmeUlHaHRVaXBwYnFzYW1VNkhs?=
 =?utf-8?Q?CnaKRQ2GzrYPRpGsmjq4OUlp9/yyqzEp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OG9xcS9vOEVNemN3b3lXaGJ0Y0orUmgyMTZUZzdQU0d3Yks4S1ZIazBuUnNK?=
 =?utf-8?B?cDFmKzZrT3B6dzBPV3JISldySEpZRkQ5aHN2SmZ1QlRuZTNDSTVJY0d4Mjhl?=
 =?utf-8?B?Vm8rYUFyTWlrL0dQWHpibGd0UzhDS2xSdmR0dThwU253VGRMbFFPY0xNSDJi?=
 =?utf-8?B?SGtKTmVZK2xrejVWekY1aWR5b2tqVElIcnBtQk5JOXorRGUrWFVINUV6ZnRt?=
 =?utf-8?B?Yk9YQnNVUzViSDRhTjVpM0Z6dEJtYWFPOUZ0Y1psZG9GN0dRL0VwMm1aY3k4?=
 =?utf-8?B?T2I0TW5FeGwxd3JEdGNTczg2TkluaVN6bERSejRDZXZab2Zzai9IaG1ydGk4?=
 =?utf-8?B?cnkwZ2cvUEpCcXRFbzVVdnFMcDhvNUwxTWgzdGFCbW1vSnVIYzNvSE1wN2VK?=
 =?utf-8?B?bDFRYitFSklIa1EwTXdsbCtkb1RSVEhnMElKcEllT2lXMGJ1aG5qNlBMTGVs?=
 =?utf-8?B?bHhERE1BR0FSWGhPMDZORmFEVlIwb0wrZHhoZmJzdUpodFJVWmFTMVFWcHlp?=
 =?utf-8?B?L1VzOTBscFZwTGFHbnR1UnpHYzN3eHUyNHRGTE5jSEVKZEQrSEJ1SUd4djhI?=
 =?utf-8?B?cUkvMUZnTUJjelBtZDVVbkFBdjZnMmNOWXQwc2gvcDJaZFVHOEJXUFJXZlkv?=
 =?utf-8?B?L1Z0ZkpMODdVUkprK0NSY2VlZjErMjhFRmoyWk5HZnJpdUhYMW1XLytlT3Nv?=
 =?utf-8?B?UWZKL3JlQUpOVWszMFBQb2lsdVN3bmx1YTAxVTl5MHg3NmhMVWQxTmthOXdV?=
 =?utf-8?B?ZjJRay9Mb3NtVXVQYVoxdnIyRkkvYk9OTURTMUhKbHF3VUM5ZmdqeUNTSXRC?=
 =?utf-8?B?MW5TYTE3di82TlN3WEtTUWllSXJWOFM0N1ArczVLdldKbnVFYzlKdHo4enQw?=
 =?utf-8?B?b3dSU3dkTXhCa0VtSGhIdklubDZraU9WblNwSVF4dG54NkhqWG1nMWl6ajd2?=
 =?utf-8?B?UFplL0JGQWVMTDVkb05xUU5mdTVlMHhjOU13WFUwUDdQb0hBMDd4Y1d4eTVG?=
 =?utf-8?B?Lzc4czNCWnZYd3ZuQW4xb2xhdUhYWW53RmVMY0dqM3BOcnJEdnB0MHZBRTM2?=
 =?utf-8?B?VEVGaTdzMjB1b2JSUmduNlg3cFBaU1MvMDhvMEx2OFU4TjkrbHhXRTBHcGd4?=
 =?utf-8?B?bk03aWhZTUdLMXdxNTNwa051YWIrbVhkV2pXZUFlVjdFMXNPeE90SDRab0RC?=
 =?utf-8?B?NUx2V1o2K05nenlVV2M3NFRMN25nbVRYdStVTDV5cCs4eHFOaEZnbnJLN2hS?=
 =?utf-8?B?dDB0bDMzV0RzRmZWWXYwOHFCQ0lRUUE4cUpBTkxyV1J3cFAybFFyMHl1OXJU?=
 =?utf-8?B?RHRYdEpabHA5OGo5aUV1cDZVeklxNjltdi9SVW83Y0RWR2ZpSTRDRW0rQUx1?=
 =?utf-8?B?Uk9GTW1WaExNdnlIN05ESHRGSSswcHlVNFlBOXBNR3FBbXdlcnpNdmFzZlpB?=
 =?utf-8?B?Ly9Ldk5JSXZjUWVNS0oyQ2huV2F3a3hrczFueGlJOHNtOGZ5aTBBcWZMajlL?=
 =?utf-8?B?VGFabDU3K3d4cUNMQlZoZ254eHBYdDA0cUpkYUZxRHBrVnlROU91SXpUQ1Rs?=
 =?utf-8?B?NjJZWEEzMXZCU3Fic2JhKy9SbmJ1SHg5MFJGRmZqcGxLOW1ia2NFblNRQU4x?=
 =?utf-8?B?VU9zY1lodFJVK05DVXpLRDArT1dCWGxMczZWV2xJcWRoNkovWVJmYXBUNXFx?=
 =?utf-8?B?cDFmNlVzVytyMUNlNFpzVmZZTFdDLytjY3BoUG1OZjN4RnczaGdONFUvcnk5?=
 =?utf-8?B?Q3h1T3NiWmcwMElOcWlOdmRUVHdwbGt6RVBtSWtZOFlNWE5OQWpJTytJZGtO?=
 =?utf-8?B?YStXZ3JCMjdOekF0bkUxdVBVcmt2cC9ubkw3RVRzVERobDU5RXRkZUFMSGVH?=
 =?utf-8?B?eU9XNkYydkxxR2RvM1N6OVdPV2c3OC81am5OdFlsSHViNkVXNHZmRkhRQlA0?=
 =?utf-8?B?VEpyRitZYVc5Sko3YVRadWZUOUVDbmhNN3ZwQi9RS2p4RWlxREdlSi8yRXBl?=
 =?utf-8?B?WFl5MmR5Q2dMRWp3OTJBL1djaFdoMHB5UVh2b3JOcktSZEpLUDlFb1JVUTlS?=
 =?utf-8?B?eEJVRHlRUEt6STNiUXkra0VyRWdaUS9hVXB1ZUttYm9xVm9ZT3g3MVNNeExS?=
 =?utf-8?Q?5q6NL/HFi4qPmua6fSwjB9MLL?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f47617d7-6d05-48bf-df13-08de1335daa6
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2025 19:45:15.7360 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rjJ3TwhLCsUPqyyrkU2e/yMrPFJIKnWt/T8C8GynmJmpLFLzuUzQ5YbHoxoJE3vYzgfDCrEJDbyDLrM5xAiTCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB6841
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

On Mon, Oct 20, 2025 at 08:24:03PM +0200, Michal Wajdeczko wrote:
> On current platforms, in SR-IOV virtualization, the GPU is shared
> between VFs on the time-slice basis. The 'execution quantum' (EQ)
> and 'preemption timeout' (PT) are two main scheduling parameters
> that could be set individually per each VF.
> 
> Add EQ/PT read-write attributes for the PF and all VFs.
> 
> By exposing those two parameters over sysfs, the admin can change
> their default values (infinity) and let the GuC scheduler enforce
> that settings.
> 
>  /sys/bus/pci/drivers/xe/BDF/
>  ├── sriov_admin/
>      ├── pf/
>      │   └── profile
>      │       ├── exec_quantum_ms	[RW] unsigned integer
>      │       └── preempt_timeout_us	[RW] unsigned integer
>      ├── vf1/
>      │   └── profile
>      │       ├── exec_quantum_ms	[RW] unsigned integer
>      │       └── preempt_timeout_us	[RW] unsigned integer

Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

> 
> Writing 0 to these files will set infinity EQ/PT for the VF on all
> tiles/GTs. This is a default value. Writing non-zero integers to
> these files will change EQ/PT to new value (in their respective
> units: msec or usec).
> 
> Reading from these files will return EQ/PT as previously set on
> all tiles/GTs. In case of inconsistent values detected, due to
> errors or low-level configuration done using debugfs, -EUCLEAN
> error will be returned.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 116 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.h |   8 ++
>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c     |  54 +++++++++-
>  3 files changed, 176 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> index 663fb0c045e9..f2e14103c9aa 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -152,3 +152,119 @@ int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provision
>  	xe->sriov.pf.provision.mode = mode;
>  	return 0;
>  }
> +
> +/**
> + * xe_sriov_pf_provision_apply_vf_eq() - Change VF's execution quantum.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier
> + * @eq: execution quantum in [ms] to set
> + *
> + * Change VF's execution quantum (EQ) provisioning on all tiles/GTs.
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_provision_apply_vf_eq(struct xe_device *xe, unsigned int vfid, u32 eq)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int result = 0;
> +	int err;
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_pf_config_set_exec_quantum(gt, vfid, eq);
> +		result = result ?: err;
> +	}
> +
> +	return result;
> +}
> +
> +/**
> + * xe_sriov_pf_provision_query_vf_eq() - Query VF's execution quantum.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier
> + * @eq: placeholder for the returned execution quantum in [ms]
> + *
> + * Query VF's execution quantum (EQ) provisioning from all tiles/GTs.
> + * If values across tiles/GTs are inconsistent then -EUCLEAN error will be returned.
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_provision_query_vf_eq(struct xe_device *xe, unsigned int vfid, u32 *eq)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int count = 0;
> +	u32 value;
> +
> +	for_each_gt(gt, xe, id) {
> +		value = xe_gt_sriov_pf_config_get_exec_quantum(gt, vfid);
> +		if (!count++)
> +			*eq = value;
> +		else if (value != *eq)
> +			return -EUCLEAN;
> +	}
> +
> +	return !count ? -ENODATA : 0;
> +}
> +
> +/**
> + * xe_sriov_pf_provision_apply_vf_pt() - Change VF's preemption timeout.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier
> + * @pt: preemption timeout in [us] to set
> + *
> + * Change VF's preemption timeout (PT) provisioning on all tiles/GTs.
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_provision_apply_vf_pt(struct xe_device *xe, unsigned int vfid, u32 pt)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int result = 0;
> +	int err;
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_pf_config_set_preempt_timeout(gt, vfid, pt);
> +		result = result ?: err;
> +	}
> +
> +	return result;
> +}
> +
> +/**
> + * xe_sriov_pf_provision_query_vf_pt() - Query VF's preemption timeout.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier
> + * @pt: placeholder for the returned preemption timeout in [us]
> + *
> + * Query VF's preemption timeout (PT) provisioning from all tiles/GTs.
> + * If values across tiles/GTs are inconsistent then -EUCLEAN error will be returned.
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_provision_query_vf_pt(struct xe_device *xe, unsigned int vfid, u32 *pt)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int count = 0;
> +	u32 value;
> +
> +	for_each_gt(gt, xe, id) {
> +		value = xe_gt_sriov_pf_config_get_preempt_timeout(gt, vfid);
> +		if (!count++)
> +			*pt = value;
> +		else if (value != *pt)
> +			return -EUCLEAN;
> +	}
> +
> +	return !count ? -ENODATA : 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> index cf3657a32e90..cb81b5880930 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> @@ -6,10 +6,18 @@
>  #ifndef _XE_SRIOV_PF_PROVISION_H_
>  #define _XE_SRIOV_PF_PROVISION_H_
>  
> +#include <linux/types.h>
> +
>  #include "xe_sriov_pf_provision_types.h"
>  
>  struct xe_device;
>  
> +int xe_sriov_pf_provision_apply_vf_eq(struct xe_device *xe, unsigned int vfid, u32 eq);
> +int xe_sriov_pf_provision_query_vf_eq(struct xe_device *xe, unsigned int vfid, u32 *eq);
> +
> +int xe_sriov_pf_provision_apply_vf_pt(struct xe_device *xe, unsigned int vfid, u32 pt);
> +int xe_sriov_pf_provision_query_vf_pt(struct xe_device *xe, unsigned int vfid, u32 *pt);
> +
>  int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs);
>  int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> index 15072779be7d..d5ad7aa7a899 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> @@ -13,6 +13,7 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
>  #include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_pf_provision.h"
>  #include "xe_sriov_pf_sysfs.h"
>  #include "xe_sriov_printk.h"
>  
> @@ -23,10 +24,14 @@
>   *     ├── ...
>   *     ├── pf/
>   *     │   ├── ...
> - *     │   └── ...
> + *     │   └── profile
> + *     │       ├── exec_quantum_ms
> + *     │       └── preempt_timeout_us
>   *     ├── vf1/
>   *     │   ├── ...
> - *     │   └── ...
> + *     │   └── profile
> + *     │       ├── exec_quantum_ms
> + *     │       └── preempt_timeout_us
>   *     ├── vf2/
>   *     :
>   *     └── vfN/
> @@ -85,7 +90,52 @@ static const struct attribute_group *xe_sriov_dev_attr_groups[] = {
>  
>  /* and VF-level attributes go here */
>  
> +#define DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(NAME, ITEM, TYPE, FORMAT)		\
> +static ssize_t xe_sriov_vf_attr_##NAME##_show(struct xe_device *xe, unsigned int vfid,	\
> +					      char *buf)				\
> +{											\
> +	TYPE value = 0;									\
> +	int err;									\
> +											\
> +	err = xe_sriov_pf_provision_query_vf_##ITEM(xe, vfid, &value);			\
> +	if (err)									\
> +		return err;								\
> +											\
> +	return sysfs_emit(buf, FORMAT, value);						\
> +}											\
> +											\
> +static ssize_t xe_sriov_vf_attr_##NAME##_store(struct xe_device *xe, unsigned int vfid,	\
> +					       const char *buf, size_t count)		\
> +{											\
> +	TYPE value;									\
> +	int err;									\
> +											\
> +	err = kstrto##TYPE(buf, 0, &value);						\
> +	if (err)									\
> +		return err;								\
> +											\
> +	err = xe_sriov_pf_provision_apply_vf_##ITEM(xe, vfid, value);			\
> +	return err ?: count;								\
> +}											\
> +											\
> +static XE_SRIOV_VF_ATTR(NAME)
> +
> +DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(exec_quantum_ms, eq, u32, "%u\n");
> +DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(preempt_timeout_us, pt, u32, "%u\n");
> +
> +static struct attribute *profile_vf_attrs[] = {
> +	&xe_sriov_vf_attr_exec_quantum_ms.attr,
> +	&xe_sriov_vf_attr_preempt_timeout_us.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group profile_vf_attr_group = {
> +	.name = "profile",
> +	.attrs = profile_vf_attrs,
> +};
> +
>  static const struct attribute_group *xe_sriov_vf_attr_groups[] = {
> +	&profile_vf_attr_group,
>  	NULL
>  };
>  
> -- 
> 2.47.1
> 
