Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5CD1D1D882
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 16:08:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93A5110E5B6;
	Tue, 15 Oct 2024 16:08:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lTfzrh00";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA0D410E5B6
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 16:08:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729008493; x=1760544493;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=5Kp7s9l3dVuY2NpA6kwYBoz9Im8q7w37PR6xVB+RB4o=;
 b=lTfzrh00IpUEYBUZFFlekf/LDsl0tjkWUQVlg0xiDlnzbwTC8WhTItyP
 ilq5HVA47s/w9+YoHCGnGkIABubrrG09mxQmA/gKS3Ipg+o17O2HMmAl7
 lGhN2BPsXUIeB/+nLxehFL18gVLM5KYZ0FV3m6MBdISfcPk2uS5S3sT9y
 pYh0YEZLvnahcLasNNlMs/etUlJOqxJNarRClxqoHJHC6gbMKFWurFQ0F
 IwMotZ0QaP8BkDUtSJfc3IdebPT5d4euvA2eQbMajQhmVNyV4LZATz+uc
 DNb6KXmgO+v4b/zW18wLWfooUmDjwW+W1bdHW7UCeGV+BPsRX25c/ydE/ w==;
X-CSE-ConnectionGUID: 9fb4CdwTQgSQ9xopHmkeDA==
X-CSE-MsgGUID: +M/Qt9/LSTG2zKv9lcUnRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11225"; a="53822751"
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="53822751"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2024 09:08:12 -0700
X-CSE-ConnectionGUID: jVkqRqNgSU+RjEV/n9NCCA==
X-CSE-MsgGUID: BIsyDXPNQYS8sdCbaX8K2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; d="scan'208";a="78408245"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 15 Oct 2024 09:08:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 15 Oct 2024 09:08:11 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 15 Oct 2024 09:08:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 15 Oct 2024 09:08:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JQ4SkDjHo/p5HBPvhk+MT1wsY/sTk+mV/3Oj/moEpOfi5JjisyVnP1lbJw03lP0ux1gHdOREYYRU8pCf+pyOy1bQWs8dMmZzs016GOY6WBa5Y1lnlP381Kf8yjKgEmCXutxcc6b8cAEcimjZd+20P/ZGbT9g+ArDv5MMvJYz4r91w7wY5fuqNYo1OF9aYYLzxkKXHbJriIi0BU8g9RfXl8gnqULjakev9y13AyZTYIqxQizaLmlI5HrSBu9WZbrsKSnLrg9/r2j/XjDylxC7O8p97lpbTuccGA97VjFI51zZLOWLE3bPqNdCEJsY1XIx5J//ggJc7DQOS6qgLGhIWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0gMX+XdjReQO4O93o1CciMD6GzDTXppv3pLr0OKU6IA=;
 b=XtlaQknWfBAX9cH13mO62dAgf6qZ3ndmByxrjaRTmPkvmF/fxrynl0JiH8+GrQPkmMqT0/YOC/+iI8B5TRg0zvxK1u7jtp1tBhEMbsg0V7QBkftAXgfDx436HnGy5y4H5b3eM4TFK0JTml/5vWy4r8eo4O5KJJwvE+Kt/bMhQbM1Tx9hld42zyDTE8icnpSNmaDJro47O6cvPZ5wPBAsMrf1GyYON4x29PSzL/Dohwhrg5GVEt48tjhrVnX9YFKmd0tsqZTRH2PfUYGZOuivSpyuFdv27/jRfk+ccL8Tt5n9nSdbVdHHEC4SnuansBziiZOV4Jrw893SuriorpRGug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by LV3PR11MB8507.namprd11.prod.outlook.com (2603:10b6:408:1b0::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.21; Tue, 15 Oct
 2024 16:08:07 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%7]) with mapi id 15.20.8069.016; Tue, 15 Oct 2024
 16:08:07 +0000
Message-ID: <758e44b9-8612-4af3-ae40-4f8e1d471395@intel.com>
Date: Tue, 15 Oct 2024 21:38:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 12/26] drm/xe/tests/mocs: Update xe_force_wake_get()
 return handling
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>
References: <20241014075601.2324382-1-himal.prasad.ghimiray@intel.com>
 <20241014075601.2324382-13-himal.prasad.ghimiray@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20241014075601.2324382-13-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0180.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::18) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|LV3PR11MB8507:EE_
X-MS-Office365-Filtering-Correlation-Id: 35856d24-b911-4b50-3733-08dced338ece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVA2S2hNMHc5WmRJQ3ByWFhTV2RLM0JkemJObFNvZ1hrRm9HVWhwbHZzR21D?=
 =?utf-8?B?NkNyOVhnaVpqUERvZmZWbTVlQThBbDMrZy9mckdSejl1L2Rhb3ZTaGxPSlh4?=
 =?utf-8?B?NTRwdlhhUXJiRDJSV3NaZGhPWjBGOGpteWtDK1F2MFNmZ1V2Q3ZRTHdqeFM5?=
 =?utf-8?B?K2J6QVR1d1RQQUszcGtNUG9IZENocEUyQTdvYnZqWVljTWxWYi8zUFA5STl3?=
 =?utf-8?B?WFRhZUxJZVRIVSt1S0R2NUI5cS9CcmNrOFBkV28xRlZvMnZwWEZ0Wjhhb1hW?=
 =?utf-8?B?bTNmckJPd0ZNNVYzN2JGaVBQVVNDYjlObi9mSkpwdVhhU1d4UFhadmhtWEl5?=
 =?utf-8?B?MGd3SjZrWnhlN3ZxOS9zMVFZVk1KQmxydi9QczR3NldrSnpvc1YrVEJ0a3Nh?=
 =?utf-8?B?SGFzcFhqUlcxTnhQeWtUcVJwUndlbmxtWDQzS0w4Y3BjMVVydFpqSGNpdjBi?=
 =?utf-8?B?NnROaCtlaEVlWDVVeTEvQ1BDMHRKQ0U1aDJkUUdONTNUNDZnbnlXbzJPcFNl?=
 =?utf-8?B?a1dVTjFVRUFudVEvSjFwWW5FODJpQ3g1MHM3YmVpNmp6cnNuMnZrT0t2K2dM?=
 =?utf-8?B?di9sZDlNbFdha2JadDZYSFNsRXV3S1ladUdSb2Y2Z2E4eVU0M1FCaXNPenE4?=
 =?utf-8?B?WE5MaFlyMVhTY0lpaHR2V3R4VlBOK0NyY0RRR0ZVS1h0K2N1RjhYcGxnWUJL?=
 =?utf-8?B?Zm43Mmp1N2JUU3FSejhCcER5dGErYmNIVHJmNnY3SC91d21wRGYzaFF3M3Fz?=
 =?utf-8?B?YXIrNFl3NnZoYVNpb1NDa0RTMlViVlBQeG9CdEJ4V3k1aW9nVjl0SmpWWjlq?=
 =?utf-8?B?UFpHWHlUQlV6UitLUHN2Y1l5T0xlUm9MRHg1R2piYnhJeWpnSFdkYVpHNlhN?=
 =?utf-8?B?WnRjejRrVkZSTWpQY0I3NC9aMVF3eUlFampScWd2aUlhU3JUY2RUMzZvQ3B4?=
 =?utf-8?B?NzVUdDFkRmh2V21Hbm8zT1hyK3llb09tUm1SYjNQQmlnbzdoK2FKR0pKL0ZD?=
 =?utf-8?B?MHlCeU1rZ2NIZFYzMC9LRHFJbFlYZzF2K1d5SCsrQjIraStaRjNjTDA2d0M0?=
 =?utf-8?B?WGZyQlZnSlFrV0FDcUR1SFUraUF6TXlVNDd4Ny9jU3JXcUVvc213UU5EU2I0?=
 =?utf-8?B?VlJuSC8yaEZHMjN3aUR5Z3NLZ2Q0dklkeFhqaGQzbWFRN0FFWk1iR0NsY2dr?=
 =?utf-8?B?eGY0ZGVFMTZPYlgxMk05L1luSUpISVhLcHNIbXE0RnhzbzAvekE5elFCRHRW?=
 =?utf-8?B?TEN4WWl6VTViSnIrcjE3bXpEMEtXdGJKeGtTN1dSVlg3cmlwMnV6ck1YU0pv?=
 =?utf-8?B?aVZGMTFQaGxrZUVndWFEWVROWUpUdWEvVDAzR09abWNpQzNwcmo1ZDQ2NWtB?=
 =?utf-8?B?SGpkc0hyYmxVNGRGZXFsajNyRE9UMEN6SUtWZEFCT2hUQVpacVkyZkM5Unc5?=
 =?utf-8?B?eGRhTGZjQS9zK1lVZCtzb2ZEUE1yaHo3OUNqc3RFWnpqdVJidFZRT0hDS01r?=
 =?utf-8?B?TnVIdUdvMll3L0ZacVFzcXNlK0Z5S0pqMHNtL05tRE5VV1h5b0JtRWxzd1Rs?=
 =?utf-8?B?d0RGWjQ4djZVT2xacURYTkUxa3pKUEF3eTlpMUtMOFpXcms4cVVzNHB5bHRk?=
 =?utf-8?B?WVpiUVlUL3RoYVpkVDhaRjFXb1NSZTQ2RWpxNWxRT2t4bXlvai94eUQyaC83?=
 =?utf-8?B?bmRhWFppbHZUZDlvMk1MaXF3S3pRWGxJeWUycXhmRzZBMmMyRG5LZmF3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QTRHRWN3aHhjS0VLSWd3QWFNclN0ZW00YldTRWt5cUhQNmVQQzJ6NUFpdkIx?=
 =?utf-8?B?ekhxck1TU3VIb3p3MnptV2NHSmovcDk4c2R4UnpHUXR3Z1ZQUHlzYTBmTm0r?=
 =?utf-8?B?NjQycEU3NDZxZ0VEMTV0STUrWFNzR1dVYXBSZlpxbEY4bzhKNGFVQ1Z2dmVq?=
 =?utf-8?B?VkF6UktzMWdwWUF1R09PaU81d0lIbjh4bDNzSjBveFRXTE9UV1lndDg0eG9H?=
 =?utf-8?B?TU94dTdmeDQyVXRCZmFFc1BaSmI3dm5HUzVqeldBR2xFMmhZZW9lR2hqU3VS?=
 =?utf-8?B?ekduaWNkb29BZk9YMjFORlNsbUlZcFRRUmhxWklFMFNkUHYwb2kyeWdETm91?=
 =?utf-8?B?cEFQNlljRGFRUlVzdDlsV2dITjE5eTRhWVRZU2lBOXBiLzlCekp4SkhuM2tE?=
 =?utf-8?B?dFVud2Z4TkwxZjZSU0RlUURWbnk3UU11MSswdUlST0x0T3RkUGw1bWpvRHV2?=
 =?utf-8?B?WWt5bzlqWjl6RHZ6WitLSWszTXhGQnJObjFRTktGZktqMzhhYVZWOHRrZUJa?=
 =?utf-8?B?SnFVN3RpZHdSK3BhV2c3WEhXTDJIaXV1QzlNVEhCQ1NMWWVhSVZ4S2JRSmhB?=
 =?utf-8?B?Wno5bG5zb29uSmpwYnA4cHhtekN3b1dVYVVKZHF4bW91dDZYUjFuaDZJSDJZ?=
 =?utf-8?B?YnVOUXdNQWoxdDdzbEtGU1hVc0xTN0FBQjdKd3N3bG05VzRpVFd6NEpLWks4?=
 =?utf-8?B?WmVyR0hEUUNDRmJlYU1TZlRkQjlVdzBkalpUOWtFSGFjbmNyTFhkVlV2OWVz?=
 =?utf-8?B?cVpGYWFtNGZOeFdJVEN0bEc3Z2R1bkJvOWFrZFlRbjh4N3dMWGdpSVZES2JW?=
 =?utf-8?B?bHBva056aUtqWEVIaUgvTVE5bkFFcEljRTVuTnByYUQreENoKzFRUk44NmQy?=
 =?utf-8?B?NjNTaTN1QXdmaWFOK2xvdUR0WWZ6Q0krWHo5U3lETVZkczJFYncrMVZralVI?=
 =?utf-8?B?bVVzODFteE1TYzdTK1VXa3JSSlRQMXhXSkhOYWdkdTlvMmxJU3RRVng4OUdY?=
 =?utf-8?B?QXYySEIwUSt6SjBIT2ZFcFEyUENOdzdTN3JacklyZ3dUQklTYThyMExKTTda?=
 =?utf-8?B?WU1OV2syelVoektHTDQ5aDNFbWxtYkxaNGk5NFVGRmVDWDhFWW8wd3hkSi9j?=
 =?utf-8?B?TE94ZEo3Z3B2MGhHSUVka1BhMHRSNGcyMzVhMkg5TTVzMjcwKzNvMmlEOExM?=
 =?utf-8?B?VzNHUlRGbm1mZzcxcEovSFMvRzNjandReit0cWNNRkp4NVc0OTk4dnZBUFZz?=
 =?utf-8?B?Z254S0FDWVpvWi9pL3VYL1ZLckJUQy9oMGlTYWdYMVhZSlg5Z2NDTkUxMFpP?=
 =?utf-8?B?OWdidU9CUDF5bENwOEtNdkJSVUpyQ3R6d1F3NFRCWVVMYUZTK3kzc3lMVDZS?=
 =?utf-8?B?Tk5DSUJyeklSOTRMNWZUdWlzc2lubzJBNmw1cEM3Y0hKa2k3WEMwbERzcTZ5?=
 =?utf-8?B?Wm90NEEveUpxaFpURzBFWU1Zc2lyTGs2Q0Nmc1kvS0x5Y2tpWXl0UDkzT3ZR?=
 =?utf-8?B?dTNjSklTbVBHeXZpRStVdHNuOEtibll0QUFWM2pHWmJXZHdHYVpRYkdzcU9h?=
 =?utf-8?B?a0MwMmNkb21acVV6Y0Yzcis3Zkpmekk0d3FJTGlUK2NOWWxXcmhCMEk5dkFn?=
 =?utf-8?B?SHdCZWgxdDJqTGJZZXhudFhTeCtjSWl1Tm9Wc1krdFBwMDJia3lodkcwVmNz?=
 =?utf-8?B?SGt5U1htUStadWxjYXZLcDE0TzdUY0oySkUyN3huSEJBNWRGT3dXTHlJOFVl?=
 =?utf-8?B?U0pZVkFZQkZlN3MyNjVWbmthcWN2c2FreGFZWW9jUFc4ZXFrblJ0K0tLanBj?=
 =?utf-8?B?bzN0WmQyRU9lUmVwend2RVNhTHRjVG1rUUxXWmF0T0c0cXdTc3dqeDQzNllI?=
 =?utf-8?B?bDlGbmRJSmN0UnlmbzN5MTNJZ1N5aVdnMHhxaWRGZm5pRXZlOTlCY0VRbEZB?=
 =?utf-8?B?RmYxbnZwbm1OamdQcldvVGJHTFJEL1dVQWlqTWwrTHdPQVVKRnUxc3lTSGww?=
 =?utf-8?B?cTZVenJNYUtJV0VzUnNIUFpGQ1hUWVFSUzJ0dmY4RU53NThkOXMvODNWMkVN?=
 =?utf-8?B?YVg3cHprN29VOXdKSzZuc2g3cjZVaG8rQUowR2Z4SktrVmRvMVZzTkNyZ08x?=
 =?utf-8?B?cm54SXFqVlNyRjhQWmlMaW1QMWR4N2dWWjM0MC9Mci9KaWhFU01zeEs0RzI3?=
 =?utf-8?B?NlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 35856d24-b911-4b50-3733-08dced338ece
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 16:08:07.8001 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7d7Zwp0+hdBvZIRCl+dIJ7X8Z5T6BDF28+HjMWHfAEuFhRBfcoWXSaehriHxvtoS7CwNFTOq3XM41R3LazCs5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8507
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
> With xe_force_wake_get() now returning the refcount-incremented domain
> mask, a return value of 0 indicates failure for single domains.
> Change assert condition to incorporate this change in return and
> pass the return value to xe_force_wake_put()
> 
> v3
> - return xe_wakeref_t instead of int in xe_force_wake_get()
> 
> v5
> - return unsigned int for xe_force_wake_get()
> 
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> ---
>   drivers/gpu/drm/xe/tests/xe_mocs.c | 18 ++++++++----------
>   1 file changed, 8 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/tests/xe_mocs.c b/drivers/gpu/drm/xe/tests/xe_mocs.c
> index ea932c051cc7..6f9b7a266b41 100644
> --- a/drivers/gpu/drm/xe/tests/xe_mocs.c
> +++ b/drivers/gpu/drm/xe/tests/xe_mocs.c
> @@ -43,12 +43,11 @@ static void read_l3cc_table(struct xe_gt *gt,
>   {
>   	struct kunit *test = kunit_get_current_test();
>   	u32 l3cc, l3cc_expected;
> -	unsigned int i;
> +	unsigned int fw_ref, i;
>   	u32 reg_val;
> -	u32 ret;
>   
> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	KUNIT_ASSERT_NE_MSG(test, fw_ref, 0, "Forcewake Failed.\n");
>   
>   	for (i = 0; i < info->num_mocs_regs; i++) {
>   		if (!(i & 1)) {
> @@ -72,7 +71,7 @@ static void read_l3cc_table(struct xe_gt *gt,
>   		KUNIT_EXPECT_EQ_MSG(test, l3cc_expected, l3cc,
>   				    "l3cc idx=%u has incorrect val.\n", i);
>   	}
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);
>   }
>   
>   static void read_mocs_table(struct xe_gt *gt,
> @@ -80,15 +79,14 @@ static void read_mocs_table(struct xe_gt *gt,
>   {
>   	struct kunit *test = kunit_get_current_test();
>   	u32 mocs, mocs_expected;
> -	unsigned int i;
> +	unsigned int fw_ref, i;
>   	u32 reg_val;
> -	u32 ret;
>   
>   	KUNIT_EXPECT_TRUE_MSG(test, info->unused_entries_index,
>   			      "Unused entries index should have been defined\n");
>   
> -	ret = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> -	KUNIT_ASSERT_EQ_MSG(test, ret, 0, "Forcewake Failed.\n");
> +	fw_ref = xe_force_wake_get(gt_to_fw(gt), XE_FW_GT);
> +	KUNIT_ASSERT_NE_MSG(test, fw_ref, 0, "Forcewake Failed.\n");
>   
>   	for (i = 0; i < info->num_mocs_regs; i++) {
>   		if (regs_are_mcr(gt))
> @@ -106,7 +104,7 @@ static void read_mocs_table(struct xe_gt *gt,
>   				    "mocs reg 0x%x has incorrect val.\n", i);
>   	}
>   
> -	xe_force_wake_put(gt_to_fw(gt), XE_FW_GT);
> +	xe_force_wake_put(gt_to_fw(gt), fw_ref);

LGTM.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Regards,
Badal

>   }
>   
>   static int mocs_kernel_test_run_device(struct xe_device *xe)

