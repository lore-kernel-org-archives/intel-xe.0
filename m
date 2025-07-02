Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9016C77B7C
	for <intel-xe@archiver.kernel.org>; Wed,  2 Jul 2025 13:55:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A1310E713;
	Wed,  2 Jul 2025 13:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OiKuLsDw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7380010E713
 for <intel-xe@lists.freedesktop.org>; Wed,  2 Jul 2025 13:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751464536; x=1783000536;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JRnyOhDoFMKBEXX/9diibuDG2J16FRDSxavrB+PX2QA=;
 b=OiKuLsDwkxbHlxnkgJQB4AVIF15hRXSZ7OjnzpUlhQSU7LHwySWNAHOO
 TkcJRBjzU5r2m+D7g4zLzpFktZkz2FLoLTV+I6U7lwaEIUGX+M20zWB5A
 8dV0XoZYEfElE7eS8exB+9zhrBfJNgiSND6wzETkJNthO86iaxcUClhZe
 sBwov1Lm90hMl5Unsdx4dvbjmqnus+KtAAZHoJxuVUDPek+xdS9MgI/ds
 hgU6AbSMz1mmtuKPgdLEG1TK8r/yzhSK4RQKEBk5w9kTiF7cmKVTXCKgH
 ikw2RFS3cWGb31zkuMAtLHMCqSpVW2pILetiHwypfSmkrW9ydSSgHJED8 g==;
X-CSE-ConnectionGUID: 27eK8zLSRU+ONHCCEz6xFg==
X-CSE-MsgGUID: 3CePDmvZRRK3FNdxAcgdPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="76305916"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="76305916"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:55:16 -0700
X-CSE-ConnectionGUID: y4VTsb3TRaiWAsUKJOP25A==
X-CSE-MsgGUID: pGFOc3vISOmvcgAoWsvCPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="153538049"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 06:55:17 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 06:55:16 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 2 Jul 2025 06:55:16 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.49)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 2 Jul 2025 06:55:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Od/WQIeddoLSKhUNYm+xixpdTKnJ3jQDQG8aXZUV+sUkE1vJBtmMt62enl1H4xuSP63UxaHRpH/e0Z/cZZaaxIqyabRWtX/v9Jr/5E34Ic1do+maygHgGuPX6ztKr1pG1xvHtfi+fPxZSBVQ1LXOqxmG22fw6X/P+njs+2m4KEw5thLOg8VtH36kIYAd+08tNKmLowZ3KfaaRc6FFBCLZrcjDK4qbVZy0ZxL1pR3+eF9XbAn76FKaNn25lEYTmDn4tyMP3Oq1La1xN3wZbDg+i0Iw/3qEiog/89T9iRrj702MftAdyC2Js3ow1c1nXf+oFBvyS0K9QeSAzsPwMbDfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4ONIBq03zHubqO+TwVxbL6+b6hffQvhEA7qebrrVX98=;
 b=YCIl7eEj/uR4z+ICgx2nKAjLbzeCUH7mJocuhSNb4iPGnTlt1OsQYs0HpTEJnrV45xAsjOweP3LN7XXyGQu7dOG3UtwhEokUcoKDMRcVz1JJMwO+dBPewJq2VUSMoAtDFCa4mtPajef1MLTtKtVx/pVlcbi2xTdlMRK+p1/6erYrmuQ2oMih3holNWbPTJIEIxllltseKA+ZUS+m5E2eYp+7/Vc/yv1AeqIDaZIVxh83l4c6peM0XKqnTImMes00uTiHhaFHbtTSy5ot+TiJA99Mp55sZXOudR0dDJWwhKTpjYpdqnrxuAoPGsKb1B9vRKwNshQ3ZNFYuymXJO3gQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 DM4PR11MB6191.namprd11.prod.outlook.com (2603:10b6:8:ac::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8880.31; Wed, 2 Jul 2025 13:55:13 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::d3ba:63fc:10be:dfca%4]) with mapi id 15.20.8880.029; Wed, 2 Jul 2025
 13:55:13 +0000
Message-ID: <8fdb86d8-3d24-4958-bb39-b3b021f57f49@intel.com>
Date: Wed, 2 Jul 2025 19:25:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/7] drm/xe/doc: Document device wedged and runtime
 survivability
To: <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <lucas.demarchi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <raag.jadav@intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <frank.scarbrough@intel.com>, <sk.anirban@intel.com>
References: <20250702141118.3564242-1-riana.tauro@intel.com>
 <20250702141118.3564242-5-riana.tauro@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <20250702141118.3564242-5-riana.tauro@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA0PR01CA0040.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:81::9) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|DM4PR11MB6191:EE_
X-MS-Office365-Filtering-Correlation-Id: e08e64a1-b9fd-4b33-4155-08ddb97010e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MnBPQmo0Ly81WnIxM3YrcERWZWhWVTZJQ0F1bExhK2x4UU9pTTI3YkxOU1JL?=
 =?utf-8?B?UFNuVXorMjlyUm04emNMTmU4WDdGZWNIelBKbjN4VFJBRDZFdkZJUkxYU01N?=
 =?utf-8?B?S0ovbFdRM0dScVZqaE5OYW8xbDI0RXhJWEJiWE04aVc4RjYrYzBjNEJLUUhE?=
 =?utf-8?B?U1JQUGVYdktsaDkyMTlzYk5SeDNEV29iaHBLWTZ6ejZsRjBwb2tvbW1SSVA4?=
 =?utf-8?B?YjY5RG9YbTU2c2tyWFFXZzhGcVVrbFBxejRFcW9McDF1TkhudUVYN0I4aU9X?=
 =?utf-8?B?emgzVm9zcDE0U2djOFprMFlveDhhQWNQcHJ4U0tyL01OREVyZE0yV1kvSUpo?=
 =?utf-8?B?aUJqR2J0WTlnN2NydElIVGxnd2lHblFvVWg2TUpDenN3WGxuWFJndTJHdW9O?=
 =?utf-8?B?eFpXZTZSMXRVaGRnQUl6djVQTWphdTVVOUNXdTRQS0lpZ2tkeU10RWozNlM0?=
 =?utf-8?B?WUF1MElHVG9EdjdoYTljTGtJUFY3b0R1eUZuQmxjSXRNazJxbnNuOGhscFBP?=
 =?utf-8?B?SUlHZUQ0QitLTTFKdmRkZklIN2ZGV0xXYzI4NG9WcXFsTjhSOUt2NHAzKzBZ?=
 =?utf-8?B?SFdRNDloUXNpRVNBcjZTTzMrREFtNjkvVm1DYXlHN09DczJRSEcrWmROSGNY?=
 =?utf-8?B?aU04WGFPYmpXYzFHMDhKdEw4T0tCUlBzMFBWdnVXUUNNVkFCdkI0QlFKV1Rm?=
 =?utf-8?B?dGRkeS84d1daV3Jrekt3SWhKd2pxVkd4Nm5hU2ZXM0hERERpWXRGeG1VNXZ0?=
 =?utf-8?B?QkRINFFoOUxNdEpkb21NVzZ6N3ZFKzF4SGJIT0l6OXVaRGN3K3hjVkEySVI4?=
 =?utf-8?B?NHRVZG5wVWUvS1JZWEh1blVoNTZzc1Y0YkFVVEJUZmxleU1OL0hhYnRid3Nv?=
 =?utf-8?B?MkFVSGV0b1Jxb25XT24rTXNMVVRRNFMycWpyYTFaKzRiYVByTnhUTk5vaFJW?=
 =?utf-8?B?TXBEalR6QlZ4SWFyTEhWMm91ejV0bEc4Z1hTSm1PVkg4M2xPOHEveThhRm5X?=
 =?utf-8?B?OTNETXpMYW9GK3Y4ODVPZnNkMFkzVVE3eCtZdjdMREpMYW4vTUhVcVlYWHpS?=
 =?utf-8?B?aTBQR284dk1JUXltcmllUmdKYzg1RjMrYzcrbXVTVkNicjAvSHJNUEMzMkND?=
 =?utf-8?B?V21qWXhqZDkwTmk0d1N4R1pXWitvV0F3RXUvVTdVNzhsVnJ2bzRRSWEyRTRK?=
 =?utf-8?B?WlVqdGdCWnBnN1BNRkx4eDVBY292ZDI5V0M1TUhkU2JCUk9zaEViVUFrTDdG?=
 =?utf-8?B?MTFIT3M0TkVmUENLRE5TaDZmdi9yRlM3dm1nT1VFL01NcjFuSlNKS2t2QWNt?=
 =?utf-8?B?Ym04Q0pTU2IvL2czRjVWejhoRHk5TDU0NFZRcjdsMXdBM1c2KytKRkZXQ0wv?=
 =?utf-8?B?b3U1TENGSHdzVVg0MnlNMjFJVUNPZWlwSXRIVUYxZmNLemloRWlyeWZnWG5k?=
 =?utf-8?B?a3N4WkJCRHhpV2tnSnFXV0NOTlhGKzRBQW83dEFtNnpCWTBIT294eGJxKzMr?=
 =?utf-8?B?d3FZOFB2UEdtcUM0Y3pWdC9YRVhvcndBUTRNakNTdndXNU9HRHc2TS9iMDVq?=
 =?utf-8?B?WkZZSE5WQ0JpUzZHUEtmSTE1d2hVWVNoU3VSdFdCL0Z2MHNFa1g2VGlFZUov?=
 =?utf-8?B?TmJsRUxSU1l4NTduTFNCY1BYRzh5L01zam12S2VMRDY4M0xYbWlqZFNtdnI1?=
 =?utf-8?B?dnRoSHI3NFRHajhtMS9mcmZBY3BLei9lSklDMDY2MU1pajRsUUpZRGI1Y3BY?=
 =?utf-8?B?YUJxSGs0bDU5SWRseEwzbTZwMW1GZEZYYUtYWFh1NjBDQnRRK2VqRUpoWDRy?=
 =?utf-8?B?QXNKMC9CZUNXSXBYYkVZOU1Xb0VlYnNQL3hTOWVKNFdQeDVrQTAzMFVpYmR5?=
 =?utf-8?B?cnZ4UDVWMUs2Z1dvVHR0bkpkYm9PNGE0ejZVYkNWMUdObVpGYmtvWmlUSWlS?=
 =?utf-8?Q?wK6hXCvKHhk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WTJoMHkwVGk2NmZsOTVPNE8zMHEwMVR5Tkg5SHBVZ0N0N0l4OEorVmhTSms5?=
 =?utf-8?B?OHIxdGtxSmdVK1ZEQnF2clBaSDIwWEYyZDdKUmtIK1Rkc3NOY3F0OU1ockxE?=
 =?utf-8?B?TTFRUGQwK2hjU0xkQzcxUjJqSHY4Ym1OSCtIOHg0M3FoQjV4clJabnVIM3Qy?=
 =?utf-8?B?OGVWdjcycnFOVmphd243bUhXVzgwSVhFcTJJL3dBNjlPdmdnQTZWbFl5Snho?=
 =?utf-8?B?Z0lhU1V1dnZxeE9xMVF1OFp3YXpyQXFjZkcrVXNydVNjT3VVeTY3dEZrdEJj?=
 =?utf-8?B?MCtmcWg1Mk1HdmE2R2ptMzNHVlQycHVYTDllL2hpZXUxU3ZBZWl5c0VZNEEr?=
 =?utf-8?B?cGRjT1BMZ29nYlZZNVRwLzVDeHMzNit6a0l0Q1JtYldkY3p4OVFyVXNHaVQz?=
 =?utf-8?B?MGdsWWJnWVVMZ045WGpNRFN6b0hNdmkvVnJYWSs3dXVRQ1RCdWZ2Wldyb1Fh?=
 =?utf-8?B?Z3ZmZHpTdzEzY0pIYTBWVEpnOUpKY1ZFaXc1WSticFZpV0J3eVRvTVUxbDRK?=
 =?utf-8?B?WWZVSmRLTFJobnhDWEw4OENqUDFKcFFZTlZxTXE5N2FPQVpsTmdjMlFONml6?=
 =?utf-8?B?SktiTkNUNFVaRlk3RklRY1FBN3RsQWF0QkJ2NEcrSERxTzBhaG5pdUxZaDVV?=
 =?utf-8?B?b1pMK0ZYRHFyVUdwN2taLzNYOUdzQzNCOUVrRkRwcVIzK1A3aSt3cURUbjRM?=
 =?utf-8?B?OFFROVJGUkg1R2svUnp1NHhydkJGVVpNcnZpUDdWZG45R1RqbVBIMXkxNHFx?=
 =?utf-8?B?RUh6UzIxbmM0cXBUY05MaG55MEIxSjMveEJ2Ymc5cHk5YkpkVXBzU0c0MWND?=
 =?utf-8?B?VW5QOTRad3p4TzI5UUY5WEtHdlVPZFd5VFptMXhoWlNWeHFkWW5PL0hONEtP?=
 =?utf-8?B?aHlEUU5ZRVVDUGpsRkp3eXduUWduamVSUzdTbjNkS1hzR2wvaWxqU2o2MEQr?=
 =?utf-8?B?QXZQV1NGQ1VxSlVMRkNQNzFkR3hDMS91NEE5WUpLeGFOa3lNaEVncFE3R2pz?=
 =?utf-8?B?dUxEbVUxQkZCOFVnUEhYb1Z6bUl5MnJUWDE3MjNwa0VndUx4eWRWNk1yR1Jm?=
 =?utf-8?B?bDQzMVIydUVKekN3cUpZcGxKemJ4U0kyTzZabVZ1UVJzN3JEYzFQR2s3c0w0?=
 =?utf-8?B?RjdnSXg5OFJqbXY1Nk5HbThOTmR0NGVHTnlWNDVMejBNWm1NTDZzNHhxT1Vh?=
 =?utf-8?B?OUhrL1RIVkdieU52NkFlTzJ3OWZ3Nmt0M0RYOFR1eHlBcDJYV3ZPWUZCWTVL?=
 =?utf-8?B?OFVvN2MzRXE5eFBMQjQ5WDl4UXVLc2lYekFRV2FxU1RYcDBYcnRwajFHaG1r?=
 =?utf-8?B?b05DMjE5ZWRnbGhtZGI3Qy9WUVZHcWhKVThtbCtYUzVwNWRDeXE2Wlo5MGlD?=
 =?utf-8?B?SGNUVzVOaWc5SlNzWnhDQ1A4Y3paQjZRM2U4NTBiMGVYOHY1dU1iSStpclY1?=
 =?utf-8?B?dWhFREp3K1BPbE1ZOERSTWx4WWw1cm1TNHIzYWh1RWxFZGJzbVJEa3N2ZFZ4?=
 =?utf-8?B?amVPTzRVamZQOFRsampyUlV4cGZjQjlXRzdwa3Ficjhza0hkY2hBd3BtR3RY?=
 =?utf-8?B?OURYbDNjWEg0cVllUENkUFdWeDNWL0VtVUlvWnZXRjNSQTZBMkpUTjFlcGdx?=
 =?utf-8?B?TFJBREN4dncwQ1h5bmdWaFkvd01LeHdBeXd3cW1jMEVJYndpb0xCbnZPVFZv?=
 =?utf-8?B?QUNTK3NSeVlxaDJVb2JrQ3BNeGZ4YTBIVWZDUFByVS9INFlKeWVTQk1IM3NE?=
 =?utf-8?B?dFlQUXlPTlBJb2ljbWkrYkVNRmRuYnRWLzhMVjVKdHRHUGh3dUx5a3h1OStv?=
 =?utf-8?B?SHEvMDJ6K3R5RVV2cGVaNE9Oam84MmpVSEw1UEVsMlhwNmxwRXNEcUZsQm1y?=
 =?utf-8?B?d1FaVU01WG5nZDVaa0RKdEdoSlpEbWhPRklKUWQwQ2k1TllQOWFHNDNEK0ZN?=
 =?utf-8?B?KzZnN01MNHRwNktDVkNPRE1wWTBzb1FyKzRaVm1BT0FlRUR2UHE0bkdGbm1w?=
 =?utf-8?B?T2pvcG8rUFBtbzBpN3IzVWRvUGR0YVNDOVdkNjhPR3llSVdXQUszREF5TWRw?=
 =?utf-8?B?YUlIRW02eEFqWVd5SVM5clYzTmtCVlZpNHNJbWxaekFJOGtWUVE5QngwOXNB?=
 =?utf-8?Q?KbUYcF9GaHDlmSEwGJaI+Stkc?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e08e64a1-b9fd-4b33-4155-08ddb97010e7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2025 13:55:13.1332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aIJuFPyeTpviEaBhHn2sPtbMeZLV3bWRmeJAkp4qdd47+MTxubErw1dvS/9/qOYyR/Bt4lzaIptx3TFdUdvxdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6191
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



On 7/2/2025 7:41 PM, Riana Tauro wrote:
> Add documentation for vendor specific device wedged recovery method
> and runtime survivability.
> 
> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
> ---
>   Documentation/gpu/xe/index.rst             |  1 +
>   Documentation/gpu/xe/xe_device.rst         | 10 +++++++
>   Documentation/gpu/xe/xe_pcode.rst          |  6 +++--
>   drivers/gpu/drm/xe/xe_device.c             | 16 +++++++++++
>   drivers/gpu/drm/xe/xe_survivability_mode.c | 31 +++++++++++++++++-----
>   5 files changed, 56 insertions(+), 8 deletions(-)
>   create mode 100644 Documentation/gpu/xe/xe_device.rst
> 
> diff --git a/Documentation/gpu/xe/index.rst b/Documentation/gpu/xe/index.rst
> index 42ba6c263cd0..88b22fad880e 100644
> --- a/Documentation/gpu/xe/index.rst
> +++ b/Documentation/gpu/xe/index.rst
> @@ -25,5 +25,6 @@ DG2, etc is provided to prototype the driver.
>      xe_tile
>      xe_debugging
>      xe_devcoredump
> +   xe_device
>      xe-drm-usage-stats.rst
>      xe_configfs
> diff --git a/Documentation/gpu/xe/xe_device.rst b/Documentation/gpu/xe/xe_device.rst
> new file mode 100644
> index 000000000000..f9b962169919
> --- /dev/null
> +++ b/Documentation/gpu/xe/xe_device.rst
> @@ -0,0 +1,10 @@
> +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +.. _xe-device-wedging:
> +
> +==================
> +Xe Device Wedging
> +==================
> +
> +.. kernel-doc:: drivers/gpu/drm/xe/xe_device.c
> +   :doc: Device Wedging
> diff --git a/Documentation/gpu/xe/xe_pcode.rst b/Documentation/gpu/xe/xe_pcode.rst
> index 5937ef3599b0..2a43601123cb 100644
> --- a/Documentation/gpu/xe/xe_pcode.rst
> +++ b/Documentation/gpu/xe/xe_pcode.rst
> @@ -13,9 +13,11 @@ Internal API
>   .. kernel-doc:: drivers/gpu/drm/xe/xe_pcode.c
>      :internal:
>   
> +.. _xe-survivability-mode:
> +
>   ==================
> -Boot Survivability
> +Survivability Mode
>   ==================
>   
>   .. kernel-doc:: drivers/gpu/drm/xe/xe_survivability_mode.c
> -   :doc: Xe Boot Survivability
> +   :doc: Survivability Mode
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 5defa54ccd26..d6b680abc3ae 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -1119,6 +1119,22 @@ static void xe_device_wedged_fini(struct drm_device *drm, void *arg)
>   	xe_pm_runtime_put(xe);
>   }
>   
> +/**
> + * DOC: Device Wedging
> + *
> + * Xe driver uses device wedged uevent as documented in Documentation/gpu/drm-uapi.rst.
> + *
> + * When device is in wedged state, every IOCTL will be blocked and GT cannot be
> + * used. Certain critical errors like gt reset failure, firmware failures can cause
> + * the device to be wedged. The default recovery mechanism for a wedged state
> + * is re-probe (unbind + bind)
> + *
> + * However, CSC firmware errors require a firmware flash to restore normal device
> + * operation. Since firmware flash is a vendor-specific action ``WEDGED=vendor-specific``
> + * recovery method along with :ref:`runtime survivability mode <xe-survivability-mode>`
> + * is used to notify userspace.
> + */
> +
>   /**
>    * xe_device_declare_wedged - Declare device wedged
>    * @xe: xe device instance
> diff --git a/drivers/gpu/drm/xe/xe_survivability_mode.c b/drivers/gpu/drm/xe/xe_survivability_mode.c
> index e1adcb33c9b0..0dc8fd77a9f4 100644
> --- a/drivers/gpu/drm/xe/xe_survivability_mode.c
> +++ b/drivers/gpu/drm/xe/xe_survivability_mode.c
> @@ -21,15 +21,18 @@
>   #define MAX_SCRATCH_MMIO 8
>   
>   /**
> - * DOC: Xe Boot Survivability
> + * DOC: Survivability Mode
>    *
> - * Boot Survivability is a software based workflow for recovering a system in a failed boot state
> + * Survivability Mode is a software based workflow for recovering a system in a failed boot state
>    * Here system recoverability is concerned with recovering the firmware responsible for boot.
>    *
> - * This is implemented by loading the driver with bare minimum (no drm card) to allow the firmware
> - * to be flashed through mei and collect telemetry. The driver's probe flow is modified
> - * such that it enters survivability mode when pcode initialization is incomplete and boot status
> - * denotes a failure.
> + * Boot Survivability
> + * ===================
> + *
> + * Boot Survivability is implemented by loading the driver with bare minimum (no drm card) to allow
> + * the firmware to be flashed through mei and collect telemetry. The driver's probe flow is
> + * modified such that it enters survivability mode when pcode initialization is incomplete and boot
> + * status denotes a failure.
>    *
>    * Survivability mode can also be entered manually using the survivability mode attribute available
>    * through configfs which is beneficial in several usecases. It can be used to address scenarios
> @@ -55,6 +58,22 @@
>    *	Provides history of previous failures
>    * Auxiliary Information
>    *	Certain failures may have information in addition to postcode information
> + *
> + * Runtime Survivability
> + * =====================
> + *
> + * Certain runtime firmware errors can cause the device to enter a non-recoverable state
> + * (:ref:`xe-device-wedging`) requiring a firmware flash to restore normal operation.
> + * Runtime Survivability Mode indicates that a firmware flash is necessary to recover the device and
> + * is indicated by the presence of survivability mode sysfs::
> + *
> + *	/sys/bus/pci/devices/<device>/surivability_mode

typo. Will fix in next rev

> + *
> + * Survivability mode sysfs provides information about the type of survivability mode.
> + *
> + * When such errors occur, userspace is notified with the drm device wedged uevent and runtime
> + * survivability mode. User can then initiate a firmware flash to restore device to normal
> + * operation.
>    */
>   
>   static u32 aux_history_offset(u32 reg_value)

