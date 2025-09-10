Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99EF4CA101F
	for <intel-xe@archiver.kernel.org>; Wed, 10 Sep 2025 14:37:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42B9510E934;
	Wed, 10 Sep 2025 14:37:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rm+bIZk+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 428E810E936
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Sep 2025 14:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757515071; x=1789051071;
 h=from:to:cc:subject:date:message-id:
 content-transfer-encoding:mime-version;
 bh=JPPIDRbn77c0F6DsOvQSb7P4/xvwy/3+xx5qvfXWpIc=;
 b=Rm+bIZk+vJXIkTMJYInGpVzTIFzLd78Bga5tiZB0Mszf7SBV030vS6yR
 otJ1veyAa8mzMjoweqr9snzdDIvzfQOlCkTR+P4Xzxy83GNVjs/7A/Mfh
 hqkvopOh7ioRuzup3THkn2zK9jQ3ZypQGfchVrKSDvo03mGM7dVgUjjmn
 4lUMZY3EU03gtJ2zzDr0P6S+CZ0X/6DvYPFhYr2s06qWIBFEyQq9b6oFF
 ZTtt3WGpHCxAwcKkAA5Ygs+z43YWSSQjDTwconcTu3ymWTz+VU+/X3jWE
 cselrPgnXPrToPjivnlemAGjS0VEFlAc8rZV+9iYkZScYMTTBksPVKCvM w==;
X-CSE-ConnectionGUID: LjTXq2/ZTiyb3MNDe0d0pA==
X-CSE-MsgGUID: HBYtcFJeS6Wl620rRVuKXw==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="59684465"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="59684465"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 07:37:50 -0700
X-CSE-ConnectionGUID: Wte9Wm4BS9O9DsJw4MNYWQ==
X-CSE-MsgGUID: hZc817knSp+fc/jHGDTCJQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; d="scan'208";a="178613540"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2025 07:37:49 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 07:37:48 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 10 Sep 2025 07:37:48 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (40.107.93.89) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 10 Sep 2025 07:37:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=X6Vego+fP0A771BtiDFIdinOTgabZHHGQuXYIe+u4S8pNPeiUkDeAY5GMDSCgxnMDkthHqz+p+mej0AJYD4d17attRUGOCG9DSTgejPU8sbjv1tacJ7f+6gV+FVHMowwGHW65wpF9ahJMYmXcvak517j/2B43IUE949esCHAvHrUXXy4tZQnGCVM0iV7mePELBoCHvsK/ehrJJDM8cHzKJ4FvrBZRayCnIevRtgjXpdbA00EJSeGO8pS6YYg229y1Q7g5TsUKVpdc4RuSlCRoSPHm5sbo8z+LJdVx90eHcV7CKmNXMjZWKtXIvWTu2sRTzVzWZSgvwAavqsczUOtxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FG5f9TTZmCRtFwKb/JonFtWEJ9dJnuCWDLJVOutrKHE=;
 b=BAbzvzCeIYImiPVNvrmLJmn1lumHI64H9HnkNRjuEgZ/1pxssTiKH28zTJ+QElI4HvTy/bzSmxGfHmQLC8l4xQ2wqnaYrZj/frKi5GskmS8HYKfYLi2e3+VRAQ3sE6cZcQS5v6Qc1Tm8QDAm2REym3u5RI2XG/3L8NiibOvXHVciPfQuc/SP/F/tR//6saXbFb8f0i+509DCuCdZBz7ykrQuaE9xx2X1ZwtojtBK108GsnwKrBXfGcpeiJ1lF5g6MWmB5s7LQhP+sQyo3Xq3xaZ5kQT1mMr3t2EQf7+/7lQ4CjHJzbbqfKVOJFuowfM0M5XtOJxzW11tv1bvOAG0tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SJ0PR11MB6744.namprd11.prod.outlook.com (2603:10b6:a03:47d::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 14:37:46 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%6]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 14:37:46 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v3 0/4] Preliminary support for separate VRAM region for
 kernel allocations on tiles
Date: Wed, 10 Sep 2025 16:37:32 +0200
Message-ID: <20250910143736.792426-1-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0046.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::15) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SJ0PR11MB6744:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b20d311-9247-48ba-a3aa-08ddf0779b9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blZzaFprS3l4REErQ3BzR2Zkb01XRzZTckpVSWRxWnNZMjFLZG8rd3Z2a3hI?=
 =?utf-8?B?SGxTOGdMRUJlRjNkd3JncnF3Zy9vN1lMM3JZSXFBQXRQQk1OL2VVZk95dEtw?=
 =?utf-8?B?aEhWdEE2NnZVcVhxUHFVcXh0dU1uajhTNHlsWlJxNlg0Ryt5QUVZTEl3a0VN?=
 =?utf-8?B?cVRMdk13bWM4enl3SmFJM3NRcXFFVmIvRDRjWnNKeUhZeDVRL05VcFBBdWlh?=
 =?utf-8?B?eWNpcS84VnNzQmdJZXJWZloxUk91clBZSWM1T3ZKZm9BcVBTci9oL2orWms4?=
 =?utf-8?B?d0FTRXJXaWxUUUt5OVlBVUhYMmhydmZITXZTWXVITzUvVjRXQ0NyMGx3N2c0?=
 =?utf-8?B?bFRhbmpYcWFvUGRCYzdPbFBrQ0ZxOE5LbEJSZXdxejJId2hSclhWKzkrSFgr?=
 =?utf-8?B?Rml0eVZ1SjVWRUJEczkvL3U2WjYwUXBKdENQS0NWekx6YmpGcnpJQ1RTVjI0?=
 =?utf-8?B?VnRUS0VzeVUrL0dHQitIL0xNNVNHMTlyQ2hQaHo0NzZ0MGRaZUFWbnhxSUxF?=
 =?utf-8?B?RG03MjByZFdubnh5RkJWYlh4NUpYa3BkV0RsU2s0WnVpNEZjR1RyamJVR3hX?=
 =?utf-8?B?Lzl3dWduNEhmM1MrNXNmb01DTnBwSXJZbERoS2c2Mlo1cnpnSnhxYzA0bGVn?=
 =?utf-8?B?ZW1JVW1URUZrQ2ZnbE9sWDU4TWxuUWpPdExhcXJPMDF3UkRTV1dhN1dBam00?=
 =?utf-8?B?b3NmWm5NZksrWEZXbGhLSXVQQjRUT2lycEpQVVAvU1haUG9MSkJWakZhWE9p?=
 =?utf-8?B?c3V5OVd2ME1BcXZNdVFaZkNoMUNVTGdBZmZROWZXcFN3ZXJkZEgvTW5sTVhh?=
 =?utf-8?B?cTdzb1F0T1pQM0ROdHBwNFlORTdmbGZ5U1lyZjVEN2Y0ek03S3hkSnBBZmtz?=
 =?utf-8?B?d0tlMnlTbUxCZnNwa1V1VE1VUXdWQkl1cER2aGFXb0pvVlRRM2ErcTZxMlUx?=
 =?utf-8?B?YW9iUE0wSlhObnl6dTRSUFBDdFNJM2s0UEs4Yllac3YvL0dWaGU4SmdDem9E?=
 =?utf-8?B?ekFjUXpiUUM0MzZ0NGdyVXhBQ3hsNk4ydXk5TEZoTmlRV1hZc1g4VHdBRWJz?=
 =?utf-8?B?ZEMyc1VIMnk4UEFCZDAxdWpRR3RXeDQwUE81KzZUaWRwb3FaVXY2MjBHV3Fw?=
 =?utf-8?B?V1RiZlV3M254TFU3NWRtbUNkRzc4a2Nib28zcVNJQjkrQ1VnZDZlaTkyOTZE?=
 =?utf-8?B?b1NKOTNzR0NwUGtpWHF3ZHF3WEpSaW9JdW9PQlVoMkhsb00wb0lvRVhRbjNz?=
 =?utf-8?B?aU41SVA0dzgzOFkwSW5Gd1ZYTzBJenlKZmY2cnlrNGN5eGFaeFNyS29tQS9q?=
 =?utf-8?B?N016WVIvUWRWdDg1czdIUTNObVRhbTdaYm55RHBRQnk0NGZmYUt1bUFTSWYy?=
 =?utf-8?B?RzFJZjF5dEVYRnpZY0xqeGF1U1Z4alYyeWYvTW5zbFFIYW5hYUlsbFVva2JP?=
 =?utf-8?B?THErK0g2cE1uK3RiRUt0MnNXaGU4WG1XOHhtcTNsSFJPZGF6YTF6SXlKRWgw?=
 =?utf-8?B?dytQbkFxNWlqRnlBQWZUbHhQWE9HYldNWlBDYS9oMXVYRWlvYmN0cTZ2Q0hC?=
 =?utf-8?B?bzFzU0F1MFd3VDgxc2VWYzZheVpJYUplOHlYYmd6ZE9TZlM1Qmd1SVVHVXkr?=
 =?utf-8?B?Q1lWakFZNnRSYW9Id2hJMEZGYTZ6UUU0SGFJNUQ1Z24rc0EraFdXcDhtTThP?=
 =?utf-8?B?L1FhdXYrL0VLeXVrREV3YTlIS05RZkI0emlTbTZxcjdkYlpoemo5bU8wUTRF?=
 =?utf-8?B?TzZVZUxaTEhGWVVDMmdDU3JuSjAvd0xMbUJuWGowZW5PRHBaeFc4c0xJdnps?=
 =?utf-8?B?RU1ZTGxkbjdRRURtcERNVkhzejlTcDRURk1BTUYrNFZld1NuSEJ0aWRNVmtl?=
 =?utf-8?B?bk9DR1R3cGNla1A3MWFhRVBIc3U3K3FmNUdDMjZXYVVTSmwyY0JMejFROVVH?=
 =?utf-8?Q?kNUPDogqqj0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWF2TGhUbTlzVWpDbGF1SEY1bUZZSnp4dEQybEc4Z1NnNzh1VU9GRzRjZVFi?=
 =?utf-8?B?QnpuUkJ0Nnd3TWlTTnUxRlNtdWVOV2tvY2gxcHpJcm1SR01ENUllR3BGZ1Ra?=
 =?utf-8?B?Uk12eGJzYVNNZ0Zjc3BXZUYxdURSQWt6dS9UZmhsdUFpVmxzU01pMmlvOGZX?=
 =?utf-8?B?cXpkL3p3a3FqaFlNT2ZVRGRjZEdNcGEyZjlUbjBJM1A0eXJrZHBRTjJ4VXVr?=
 =?utf-8?B?OFBsdXorZHU3cEFDdCtrNFg2R0pFd2h5UGhsQzkrejR1a1RPR3J4MXA0UmMw?=
 =?utf-8?B?NVJ3ZERoMDJ6YTRBL1NaR3J4WEVpL215WkxRZGd4UlBVU1BQNDNiMEt0YmtW?=
 =?utf-8?B?blQxbFp0c0JnZ3hLejloT2dLbGR0dnNiSjh4RFduTTN6Ym5HS3RNTFJsNW84?=
 =?utf-8?B?NDhUcmdlaDNZNWE2bGxHNkM0dXFMMHFXbDcwV2tLRkVDaTdrTEdNaFA4ZHg2?=
 =?utf-8?B?UUhQL0ZiOURDSFNPdHpRM1VldHF5YUFGV1pMRmFKTlpHMmUzTjlDOWxqRVJO?=
 =?utf-8?B?dlpzc0ZXN0FXRUJpTEhsdEN6elR4aTJMLy8rak9VZ1V4UWgrU3dCd2tuZE16?=
 =?utf-8?B?cVA0dHBES2NOSnI3R1NVSVpjbUs4T0J0U1o2cTZMcDJIbjBsME9yRUpobFZQ?=
 =?utf-8?B?d0o4eW54ejZSZmNYc1poYmg1blBSdmxiMkUwZkd3NmU1MThhSmtqdnQ0Ukpo?=
 =?utf-8?B?Q0dUTFMrQWxZUDQ4NHJlL1d4eG9QU3lLa0JHai96dWNNenpRRWl2Y3UvNzVt?=
 =?utf-8?B?VE1BU0lkV3JMczFaWGZhbzNSelVuQVBJQUhVbXczQmwzaG03SVVhWC9TY05W?=
 =?utf-8?B?M21MZUFMbk5nai9Ha0VYRUczR0RHeFlEWlBReVE5djY5eGZNbnJIbWdpbzdP?=
 =?utf-8?B?NUwvcjhwSEdFVmxEaFdLWklOVlpPRGdpUlV1UlovQThKc1oycUtKQTZieFcy?=
 =?utf-8?B?R21Pb0YyZFpJUm1ERGd1eitPVWxGL2M4WGJHaTl1OGREWTlpU1RWS2hSUWU1?=
 =?utf-8?B?UGx0WUt6cVhRSDUwK2FpNWhlQUNoaUJmb3RQMFlVbTZ6V0ltbDBwOUdkMlgy?=
 =?utf-8?B?Z1JqdDl5SjM3cGw5UFY1b0VrNndTczFhVS9XakI4NlBUZlNjTURpYlRWRzIw?=
 =?utf-8?B?MmdhN0ZuZ3Vnc3FMYmZ1dnYxaS9ZNmRZbmloZy9IZ3hWRWc2dGkrdk9zczdt?=
 =?utf-8?B?a0d1V0ZGNnBjdVA2b1NlcXpwUmlPM3loVWZtN0UwazhHVjE3NEVlNFNzL0tn?=
 =?utf-8?B?V0NtU2pzVGZDbEJ5TmdZYVFqaHdVS0Y4UjZQc0owSUI2Q0ljZm92MjNKclFF?=
 =?utf-8?B?dUQrN24wZlZSVzEwTUprTS95alU4MkRBSXIySTBzeUNjK0xVMzVWZ08zVVg5?=
 =?utf-8?B?bERCSXVpNnQ3ZlZ0Q0JIQkpwSkpTKzRDNHZ0ajluWGxlK1VIRnFjamlCek1T?=
 =?utf-8?B?MVhXY3ZuWllubDVsVGhkK05DRmE0Ukg3dW1PZ0dBK1hlSkRvM0VsV0x4RFJu?=
 =?utf-8?B?ckUwd3dIcjdsUGQ2Tll6RE0wdFp2bkVOZ3lnSkV4TXJrais1OWN4MHo0eFoz?=
 =?utf-8?B?bHF3Z0JqT2pWZjBnSFoyL0RNY1VDOFJMZHphc29kcXVlakt3TllxZVExK21k?=
 =?utf-8?B?ekhnRm1abUFSaWtMMm81Tjh2dlcwTm5wTldRN01zNzh0eWVZWm11eW83ZEds?=
 =?utf-8?B?SndHZ0dSYVUwS09DNSsvZldsVHpQejBXZ2ZvTDUrd3BGLzdIREhOVTN3MTJv?=
 =?utf-8?B?enRyKzBHS0ZXQWdrTGRFaTVIQlg4Unl2Zy9BVW5CZDZEdTc3dUlpbzZ0Zmh3?=
 =?utf-8?B?RTlhWGlkNi84cWhzbXR3b3VycmVJQ2hxMENCMGtnN0VKMlo4alR4TlRUUFVl?=
 =?utf-8?B?aE4rb2g2QmwwS2MxdmVJZXM2WWNmNFB0bGhUR0t2blp6MnFjS29oVDVjcFIz?=
 =?utf-8?B?d25kUXNscEpvMU5URlZmcmV6bE5IcU5URGJid1NtQjh2OVh2ajNvekNwRGxG?=
 =?utf-8?B?VldxdW9kN0VjUmo5MmlyWU5LYWhsUnJLSkdhSGNVak5zYlliTUNBRGJMZk1y?=
 =?utf-8?B?MU1abFNPOEJRaUxRcllGdHlwSHQ1ZVU3eVNKZGFVQVdrVHQ0aGQyVzhBcnpq?=
 =?utf-8?B?bEhEbnhQckk1bXBVMGxKSEQrWnRtOGpDUUNUVTl5UTNFY2hCR0xLTW5lYnd4?=
 =?utf-8?B?Unc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b20d311-9247-48ba-a3aa-08ddf0779b9b
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 14:37:46.0674 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KhGdjMUp9j4MAjcB3ncMnzjF9DXac8619L5UD4eY1iyMyEFbLXoEvZt2BMWmYqKYoYwG3aGdI21PO0pdC29I0k69xlrJw38jMrh+u4+ZZd8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB6744
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Until now, all VRAM BO allocations, whether from userspace or the kernel,
were placed in the same VRAM region assigned to a tile. However, in some
scenarios, it may be necessary to separate these allocations and place
kernel BOs in a dedicated VRAM region.

This series introduces initial support for such separation by allowing
an additional VRAM region for kernel BOs to be assigned to tiles. In this
implementation, such BOs are identified by the ttm_bo_type_kernel flag.

To maintain flexibility, this series introduces a new BO flag:
XE_BO_FLAG_FORCE_USER_VRAM. It forces BO allocations into the
general-purpose VRAM region, overriding the new default behavior.
This override currently applies to BOs associated with user contexts
and BOs used for VF memory.

To preserve backward compatibility on platforms that do not have a
dedicated kernel VRAM region, the kernel_vram pointer will fall back
to the general-purpose VRAM region.

v1 -> v2:
- update commit message of "drm/xe: Introduce new BO flag XE_BO_FLAG_FORCE_USER_VRAM"
- replaced for_each_bo_flag_vram with the improved
  for_each_set_bo_vram_flag helper
- moved the VRAM flag iteration macro definition into xe_bo.c
- drop unused bo_flgas from bo_vram_flags_to_vram_placement in
  "drm/xe: Add initial support for separate kernel VRAM region on the tile"
- use hweight32 helper in __xe_bo_fixed_placement for readability

v2 -> v3:
- rebase

Piotr Piórkowski (4):
  drm/xe: Add initial support for separate kernel VRAM region on the
    tile
  drm/xe: Introduce new BO flag XE_BO_FLAG_FORCE_USER_VRAM
  drm/xe: Force user context allocations in user VRAM
  drm/xe/pf: Force use user VRAM for LMEM provisioning

 drivers/gpu/drm/xe/xe_bo.c                 | 90 ++++++++++++++++------
 drivers/gpu/drm/xe/xe_bo.h                 |  3 +-
 drivers/gpu/drm/xe/xe_device_types.h       | 10 ++-
 drivers/gpu/drm/xe/xe_exec_queue.c         |  7 +-
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c |  3 +-
 drivers/gpu/drm/xe/xe_lrc.c                |  3 +
 drivers/gpu/drm/xe/xe_lrc.h                |  6 +-
 drivers/gpu/drm/xe/xe_pt.c                 |  2 +-
 drivers/gpu/drm/xe/xe_tile.c               |  8 ++
 drivers/gpu/drm/xe/xe_tile.h               |  5 ++
 drivers/gpu/drm/xe/xe_vram.c               |  6 +-
 11 files changed, 109 insertions(+), 34 deletions(-)

-- 
2.34.1

