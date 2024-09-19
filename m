Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E3C2CF3962
	for <intel-xe@archiver.kernel.org>; Thu, 19 Sep 2024 18:09:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CDEB10E741;
	Thu, 19 Sep 2024 18:09:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DPmSAMsq";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A52E10E741
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Sep 2024 18:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726769339; x=1758305339;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=dFf6+GnKpCVgcaOhCYC1QtcjYocJKNWYAYGIjF2SSVk=;
 b=DPmSAMsq+F0tre38TjChdOCvG+QsUhmSn/Vcjo1bCmsne0zNztr79mrF
 oKKgxzaRW9Hfdz3qLc9Phr4LGexC3w7lcJuWt+z1C3U7wlW3YlSlYgrdZ
 9oFGd3+ZVrBG04h+IKUKlgatYqOWJ0OneTOCnEM77H4IxSqYAuLnMUpJZ
 tXTviJnCKEGMjfRx7fREAFdzANcD9HnjL21R7ZbZEgtkQTfz1I7gWKXNc
 F+hjF4dR8rKaxDG1/pPy18s03ktiA4xjMn0yU+S53dSgxc5f3YV4Ld9E/
 lEgoDQngzwmrSfrQKrO2dbKEDNjM5onrPeOeAoLe1smsnAr/EmLDdLdwK Q==;
X-CSE-ConnectionGUID: TNUmblnsTwWVbY/WfAZrJw==
X-CSE-MsgGUID: ktiUuZjxTQiI0X1h0jb/0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25939984"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="25939984"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2024 11:08:58 -0700
X-CSE-ConnectionGUID: SKRlP0dXQFqUGs5J1DHEQw==
X-CSE-MsgGUID: vZamcWcPT/CiNSp83P+5xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; d="scan'208";a="69622736"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 19 Sep 2024 11:08:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 19 Sep 2024 11:08:57 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 19 Sep 2024 11:08:57 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.176)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 19 Sep 2024 11:08:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l+X2PTGXBX3Ruoh14u30lp+o+P4zIJ/hwNqdMS4bJBN5vC4W1WeLND5xK0fvBnetCvT6ox3vRqW1xbv5b3pcTcvLDBlRPM/Z4ubmAAWG2VkM1rNo2KMkuGOr897s7Wbz+jQYAZ5Sz31lzeTeZ06gAYY2CXXexdbuXtffMe1vEr9HmUMBTNS4s2LdyyMPXQfPsphIVA8edBEUwZSN0fWOVzpzrww/QEMR1U6+vqYY4z0cpMIHbJIfq2Z+UHFTWBNl2MI7aDRygNbYQD0CEHWBOyoWom3ytxvkWTGxU+fKbAwzyJ9+3YT9H1VFHK7CqJvPzcF5wuc7wr9WP+EnwLUasg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o4qOeuUxlpwmDGIPAGRB8iCa4hzGYfRXVVti6WI+Xwc=;
 b=x7a+JQVO7g/Djc3xMDRkaUb2KGykq8663cSN8fEQ03QVRWznLzMFa2jUZDk6E3JlPfzKbzwJZ2VCmfGcX2bBlOTMCHnBXSgN9eo5/3jeFa4fhWnwsVRL+qBec7U3yGhqe9oifQ9uhFQWnfA0V0KQPwXAF5/y2iNHO+4F9YY+b27hB5oh5kOTjkeje0GEihQ6zgRHf1zg6gpGnA2treQ3mgSwuiFqGsvihFC3MsxE1HfY/5BLPh28wg3LKJTZYgq4rhuJFZMpPr74DOcEt1gIhbYTCpNnDW4IQVgNX4Ua5CzGRRAsQMVIs+Uw5rHuNOR/IlPSFlq6Cbe7X9C0Myo4Dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by IA0PR11MB7356.namprd11.prod.outlook.com (2603:10b6:208:432::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.22; Thu, 19 Sep
 2024 18:08:55 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%6]) with mapi id 15.20.7982.016; Thu, 19 Sep 2024
 18:08:55 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <SJ1PR11MB6204DFF0BA690ABD5819DBE981632@SJ1PR11MB6204.namprd11.prod.outlook.com>
References: <20240918204830.49880-1-gustavo.sousa@intel.com>
 <20240918204830.49880-2-gustavo.sousa@intel.com>
 <SJ1PR11MB6204DFF0BA690ABD5819DBE981632@SJ1PR11MB6204.namprd11.prod.outlook.com>
Subject: RE: [PATCH 1/3] drm/xe/xe2: Extend performance tuning to media GT
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Date: Thu, 19 Sep 2024 15:08:50 -0300
Message-ID: <172676933050.49107.13639232586475494129@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR04CA0102.namprd04.prod.outlook.com
 (2603:10b6:303:83::17) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|IA0PR11MB7356:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cdc1f55-3e05-44f2-7990-08dcd8d61fc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QlZlcHV6TjhMSzVlN0lreS8rRm1xdVVFM0IwckdvTWkzV1pQY3hlTFJDOElO?=
 =?utf-8?B?bFN0SWhHZ29XOWxxMHoySkJncjFHdHR1djlseEY3SlNUNlBYVk80andsZEc3?=
 =?utf-8?B?REZ0dG1KaktuMm9wckliOWdOYndOemJhZHhNNXhyc00rYlNMQzlucnhOU0tP?=
 =?utf-8?B?NER0bFF1cS9rdjNxNXJOMVkwVEhvd2ZsbCtydkJlVWltWXdqN1RTUTZZY2pp?=
 =?utf-8?B?ajFmSThaVUtBbjhNNmRVQXRXbGdhRzNsRlNlZWtuemhGRUNTUVZETHRLTCty?=
 =?utf-8?B?aGdnRHhHYnJ6eWJrTWN5NXBaalJVcGdaVURnK0hid1J6SmNzL2dCTHYxNVZF?=
 =?utf-8?B?a2hkZjhJUFNSV2JEajNMdjhma0NSaFRmUXo1Vnp6YTd4WDJqZTdMYVNJRTJX?=
 =?utf-8?B?Sk1JdWx5TUQwaUt5NWFjNFNUbTlCb3UxdTFBVXdHVm8yemdGVmVoc2xrZ3di?=
 =?utf-8?B?Sm5ZdjJpc2haOHdqbTZ2TG1uK3B1dytZaW9JaVdQcVpvWDV3RzhCTW5Wa1Y1?=
 =?utf-8?B?Q3pJZUh3S1p6ZTNhc2pHSDdBMGlOWDhiQzJ1Si9qN3hqZE9KTHhHdU1tR0Rw?=
 =?utf-8?B?YkdlaHdpb2NhSXR3anIrTlc5THJ5TG9ac3FKSUdUdGtmQUhoMVhsRXFFUUZH?=
 =?utf-8?B?K3VvNDNFNTRmQVFvOEhkWE5uTGQxK3o0NzVobWg0Q1VkQytaQXJEVk5FSGhu?=
 =?utf-8?B?aWxlZnNuRmZ1TUk3TnlUM0dmMnhHZXRycXRPNjdhKzhEZTh6ejVKR2hHcEIw?=
 =?utf-8?B?b1BCNE1qK0tSYUEyUjJnZ29TZDNhLzNscUdzcmRSOWlKdlY0VGVhdWxMQmdk?=
 =?utf-8?B?TjhzL0hFVHNVQkFoMXYzM0lFaHlaa3Zxb2hYY0x4Slhtd2tXZjlrMTdUNkdy?=
 =?utf-8?B?Z3JRdW9wMTBrblFWVG8vTEd0SnNVV3o4a2JJdVNMSjNLNjVmL0FzSHRXb01S?=
 =?utf-8?B?TzczWkQvcWRTR0VqTUFsNVZ6cWlud3lxL2liMnFFa052Ri8wYTNheUVhOE9Q?=
 =?utf-8?B?R1F4R3dEbnpHUEdhMVRON0VicmQzcDhBY0huS2U1TlJuZHl6a3hEVXNiODhJ?=
 =?utf-8?B?aUlsS1pGcXVMNjdrZDJRalQyb3N2U29HTmFUeWFKU0hteURLdnVHSUFoZHRk?=
 =?utf-8?B?R1ZiRDF1Sm5HVWtwUDV0dTZSNGJCU2Nwd3FJYkFQUSsreXI2SFpuTGwxOG8w?=
 =?utf-8?B?MTF5Sk9Ydk14ZUdpNWhyK3dlR0VBc3ZNaE5LNmNZY3lpcEtjMUZZYUZ4UmZi?=
 =?utf-8?B?QkN3cyttb0dwbWFTZW1NKy9XeDZqVlZVa3hoNmVmMzc4NWN0ZmswTVNuTU93?=
 =?utf-8?B?M2tPblJORnE2dmNyS2twRFJjZ1p1cG9zczdvaC9aWEM4MWhJN3VjZm1Cbm5t?=
 =?utf-8?B?eTdyZ2d6OEF3dENtOGhDcUhxRG5FUFBzT3lEdUVyUUZxR1h6V1RaZ0E0cGo4?=
 =?utf-8?B?bElZdDJaeUNnbmY4SnU4bnFBNGU0YnE2K1ZPb0pseGxBL3NrZHZGdVlzQm9X?=
 =?utf-8?B?R2p2aWZYdm9POXRkcTZQWHRVeEFGMHUra2hGS3NQZkhPdm1ub1BwN05QMktq?=
 =?utf-8?B?MTNXTmdpbkNMQTNnV0oyM2hDN1YzZms2OE4xcllxbWMvdzFCZFV5UE42S2Jj?=
 =?utf-8?B?MlZTNnRFem50Y29UNlM0TnBFeWtnOHRCZ293WW0xV0VsNWdZNUl6K0dRa3pn?=
 =?utf-8?B?YnVHWE1sL1lRVzVyY1dRa1F1cmFkWXkrazhBYXBqWU9mSnlMNkZjT3gvUG5U?=
 =?utf-8?B?bzlnaXZNUzdESlN0N0NZQVpMTWZOQmlEOXJtY2MwRmFJVEc5VFV2V0N6SjYx?=
 =?utf-8?B?NG50U3RoQ1RVVzBMMTZVZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S00wUzZ2OHlIdUNodEh2LzZGWFRDdzg5d3hSTUhnWXNHb0wySHhUeVUzYVpq?=
 =?utf-8?B?MlducGk2dUwvN3o4Z2RVVE1iQzJ4TGgvcUkzS3N1SmtMd3prajMzM0xxSEtH?=
 =?utf-8?B?bkgyc2ZhRVhSUmtFUG9kMm1Cdk5VTGEyenlsTFp4UWcvWEVqeWczQWR3dldU?=
 =?utf-8?B?dUJ5aTRuOGI1MEFpQ3pkd1JSeDMyM2ZoNzB0bDRhRzdrVUlraUxqSHI5ckV6?=
 =?utf-8?B?TWtyT1NvUmpzRFlqZG1JTHR5dDJKOExFT2tveDRqd09XZ2RhRElRa3ZZQVBM?=
 =?utf-8?B?d0VMdDRMNnI5cTcvSi96eVd0WUFFdWFoUUFsWm5CQkcvSVZYbUZaeFBhTkhh?=
 =?utf-8?B?NW1YdWswaFZHTWxxaHZ2ZDFZQ011T0RUTGcwcW9tb0dFZ3paODFaby9HamIx?=
 =?utf-8?B?ZlNhREh4YTJsbFRMbjNJR0NpN29MWkRZVjc5Z1V4L0tqbHR2WWpBNFU3WDdU?=
 =?utf-8?B?SjI1UThTWURxWXA2QnV2bThvMkdkamRKaHBLN3lYOVNIWE55SE53RXVOQnJo?=
 =?utf-8?B?UWJWVngvMlpjdVNuN2dubzI0VVEwQURzeTRqL05kSGQwWUs3YXVQL1VNS05S?=
 =?utf-8?B?WEdLUUFva0NnQ3lvcmUrMG5nTmdLZHRjUjFCNVA1czBsdW9IYnFtT0d5NDBP?=
 =?utf-8?B?L21PdXVGbW1vUzVma05senJlNlhuODhVeWVkenFHSUlyK2phOXB0eWpSS0FE?=
 =?utf-8?B?emdDK000cnlMdHBPQisvc2ZVU1JWMjRRK1JSTGZJRkpWRnZVR1REMTZSK0xo?=
 =?utf-8?B?WEp4NDNNT1VQK2NKWVZYcm5UMkFMYno1N1RRVk81NEJpOE5OMlZJMWR5cEVH?=
 =?utf-8?B?WEp5L3laSE9nMzFpdko3eDF5dFErUXdkaldRc0kwZ2tLYnVscldIVlJoak45?=
 =?utf-8?B?dnpybWpoS2N0UDdBalhOZlh5VVYyUVEybm9pUTVIMXphQ2JKYTUrcWY2dk5Q?=
 =?utf-8?B?OWdrdVRicTFYNXRGbk5ZNTgybzFYVnVIZUFzOEU3QTBwb0FBblhhR2xIaFo4?=
 =?utf-8?B?OUord2R4UU1Hc1JwaWhYUExXeFVCNVkxQXFveDd6YVFnTXhoRU4rcjUyVnFB?=
 =?utf-8?B?U0FLODdrUldYZ1NWdFFjU1JPSS9mNmcrWG5WZExMZnBtMDdidC8yMVUrSXJN?=
 =?utf-8?B?L0pYQ0FzamQrV2MwWFlxSzYzN1pCdnhRb1ZpTjBzL2dTR0hNUHl5SE9CRy9i?=
 =?utf-8?B?aFdzOU82bEJCTktMc0N3V2ZwUWYybGttRFhXL1IrTC9ZbG15Z1J5ZFNacFFl?=
 =?utf-8?B?MWVKcVBUNmxxYy9nVGkvWFYyZDROdjArbGNaNDNPZGwxZlJ5UEVCZmhWUGZm?=
 =?utf-8?B?Nks0TExtbSs0b21rRDBvY3hGZ1BYQTcwT01uTHlZcjFMemtDV1dtRE4vdVND?=
 =?utf-8?B?TnZ6NHNXbTNTVTBLcG5HYzJGeTRjcXhoQmRLVDdtNzA2Y1BZeEY4NmVlc0NL?=
 =?utf-8?B?NE1abk5DZEhIMGVUMllrbUxrU1p5QnZKaUcyeHd4dFpBRWpkbkFaa0R1aW1h?=
 =?utf-8?B?Y0lVSUZ4Tk4rdEJtTEZPMEFmeU96QU80VEtuVy9SYm5YUlZ2d1R3TDI2YUFz?=
 =?utf-8?B?MXo1NW5zTHdGNFVKUjBQc2FSQ0I1ZURUMmQwYkNhUUVTMHlXeSt2aFpVVFc4?=
 =?utf-8?B?TzY5b0l6MG82K2pla0c1dXQySFZqbGZGaTlaM1lLM0EzUjBJMEgyR2FTQlBp?=
 =?utf-8?B?OE5temNJQm03bEhFdkw3RCtma3gyVHo1T1lseDZQazh5bmkvR3ZROVNQNnU5?=
 =?utf-8?B?NkR3ME1PbG9WajRkWW16cW9OMGxkMkx3MDcxU0lXSkROZFB0VWpyS0lueUhG?=
 =?utf-8?B?ZlRNdFFsRUgwR1NMSlFDRmYrSEFnRC82Mi9EeDBoZlBSZ0c1eUFBWmJ6ZkFm?=
 =?utf-8?B?UFlEaVVXMmhKMGoyMVNxUmliazZ3bW5mYW9zUnJlRFQvcnpveG04MFVxUlky?=
 =?utf-8?B?anZ5WDN2REVoaGs0c3ptL1RTSnFXRXVEQlBQZFJDdFJEVGFxR05jNDZKZktV?=
 =?utf-8?B?VWdqWEZJWlhCWlZXdU91aWtHL3Ixa080RVZHRVIyVHAxR0FFRDJTZ0xWL1Rx?=
 =?utf-8?B?NUxjZlhoZHVyOEtQNnZ6SHdKdklDam1rdGdJVTA1VkdnSlpSNnYyTTFwVWs0?=
 =?utf-8?B?RVZ4TDUzU3gxZGQ2R3BvblpaTm9rNWlZNUxzcGdnY2tXMk5aY0ppT2xqK2Vk?=
 =?utf-8?B?QlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cdc1f55-3e05-44f2-7990-08dcd8d61fc5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 18:08:54.9749 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: h0TauSRRCkcfGq23vbZpMUp8tAP7h0HpPog1h2Maq0vMH0Xcb87zP3fsfmODaMmj4GChFcm7KfLFsZLWv7lRXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7356
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

Quoting Upadhyay, Tejas (2024-09-19 05:00:22-03:00)
>
>
>> -----Original Message-----
>> From: Intel-xe <intel-xe-bounces@lists.freedesktop.org> On Behalf Of Gus=
tavo
>> Sousa
>> Sent: Thursday, September 19, 2024 2:17 AM
>> To: intel-xe@lists.freedesktop.org
>> Cc: Roper, Matthew D <matthew.d.roper@intel.com>
>> Subject: [PATCH 1/3] drm/xe/xe2: Extend performance tuning to media GT
>>=20
>> With exception of "Tuning: L3 cache - media", we are currently applying
>> recommended performance tuning settings only for the primary GT. Let's a=
lso
>> implement them for the media GT when applicable.
>>=20
>> According to our spec, media GT registers CCCHKNREG1 and L3SQCREG* exist
>> only in Xe2_LPM and their offsets do not match their primary GT
>> counterparts. Furthermore, the range where CCCHKNREG1 belongs is not
>> listed as a multicast range on the media GT. As such, we need to have
>> Xe2_LPM-specific definitions for those registers and apply the setting o=
nly for
>> that specific IP.
>>=20
>> Both Xe2_HPM and Xe2_LPM contain STATELESS_COMPRESSION_CTRL and
>> the offset on the media GT matches the one on the primary one. However,
>> the range that contains that register is not is not listed as a multicas=
t range, so
>> we need two different entries for media.
>>=20
>> v2:
>>   - Fix implementation with respect to multicast vs non-multicast
>>     registers. (Matt)
>>   - Add missing XE2LPM_CCCHKNREG1 on second action of "Tuning:
>>     Compression Overfetch - media".
>>=20
>> Bspec: 72161
>> Cc: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>> ---
>>  drivers/gpu/drm/xe/regs/xe_gt_regs.h |  7 +++++++
>>  drivers/gpu/drm/xe/xe_tuning.c       | 24 ++++++++++++++++++++++++
>>  2 files changed, 31 insertions(+)
>>=20
>> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> index cf21de3adca6..6ec2d2c11d77 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
>> @@ -80,6 +80,7 @@
>>  #define   LE_CACHEABILITY_MASK                        REG_GENMASK(1, 0)
>>  #define   LE_CACHEABILITY(value)
>>         REG_FIELD_PREP(LE_CACHEABILITY_MASK, value)
>>=20
>> +#define XELPMP_STATELESS_COMPRESSION_CTRL        XE_REG(0x4148)
>
>Were trying to say, XE2LPM_ here? Also this seems to be MCR register.

Yeah, you're right on both. I was looking at steering spec for MTL media
instead of BMG's when adding this and then used XELPMP_ thinking that
Xe_LMP+ also had that register.

Thanks for catching this. I'll update this on the next version of this
series.

It looks like we also need to fix the logic around MCR tables in our
driver, since we are selecting Xe_LPM+'s table for Xe2_LPM.

>
>>  #define STATELESS_COMPRESSION_CTRL
>>         XE_REG_MCR(0x4148)
>>  #define   UNIFIED_COMPRESSION_FORMAT                REG_GENMASK(3, 0)
>>=20
>> @@ -169,6 +170,8 @@
>>  #define XEHP_SLICE_COMMON_ECO_CHICKEN1
>>         XE_REG_MCR(0x731c, XE_REG_OPTION_MASKED)
>>  #define   MSC_MSAA_REODER_BUF_BYPASS_DISABLE        REG_BIT(14)
>>=20
>> +#define XE2LPM_CCCHKNREG1                        XE_REG(0x82a8)
>> +
>>  #define VF_PREEMPTION                                XE_REG(0x83a4,
>> XE_REG_OPTION_MASKED)
>>  #define   PREEMPTION_VERTEX_COUNT                REG_GENMASK(15, 0)
>>=20
>> @@ -399,6 +402,10 @@
>>  #define SCRATCH1LPFC                                XE_REG(0xb474)
>>  #define   EN_L3_RW_CCS_CACHE_FLUSH                REG_BIT(0)
>>=20
>> +#define XE2LPM_L3SQCREG2                        XE_REG_MCR(0xb604)
>> +
>> +#define XE2LPM_L3SQCREG3                        XE_REG_MCR(0xb608)
>> +
>
>These are not marked MCR in bspec. Is there something I missed looking.

I just checked Bspec 71186 again and range [0x38B600:0x38B8FF] is marked
as multicast.

--
Gustavo Sousa

>
>>  #define XE2LPM_L3SQCREG5                        XE_REG_MCR(0xb658)
>>=20
>>  #define XE2_TDF_CTRL                                XE_REG(0xb418)
>> diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuni=
ng.c
>> index faa1bf42e50e..7a5b852af8d7 100644
>> --- a/drivers/gpu/drm/xe/xe_tuning.c
>> +++ b/drivers/gpu/drm/xe/xe_tuning.c
>> @@ -42,20 +42,44 @@ static const struct xe_rtp_entry_sr gt_tunings[] =3D=
 {
>>            XE_RTP_ACTIONS(CLR(CCCHKNREG1, ENCOMPPERFFIX),
>>                           SET(CCCHKNREG1, L3CMPCTRL))
>>          },
>> +        { XE_RTP_NAME("Tuning: Compression Overfetch - media"),
>> +          XE_RTP_RULES(MEDIA_VERSION(2000)),
>> +          XE_RTP_ACTIONS(CLR(XE2LPM_CCCHKNREG1, ENCOMPPERFFIX),
>> +                         SET(XE2LPM_CCCHKNREG1, L3CMPCTRL))
>> +        },
>>          { XE_RTP_NAME("Tuning: Enable compressible partial write overfe=
tch
>> in L3"),
>>            XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001,
>> XE_RTP_END_VERSION_UNDEFINED)),
>>            XE_RTP_ACTIONS(SET(L3SQCREG3, COMPPWOVERFETCHEN))
>>          },
>> +        { XE_RTP_NAME("Tuning: Enable compressible partial write overfe=
tch
>> in L3 - media"),
>> +          XE_RTP_RULES(MEDIA_VERSION(2000)),
>> +          XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG3,
>> COMPPWOVERFETCHEN))
>> +        },
>>          { XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only"),
>>            XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001,
>> XE_RTP_END_VERSION_UNDEFINED)),
>>            XE_RTP_ACTIONS(SET(L3SQCREG2,
>>                               COMPMEMRD256BOVRFETCHEN))
>>          },
>> +        { XE_RTP_NAME("Tuning: L2 Overfetch Compressible Only - media")=
,
>> +          XE_RTP_RULES(MEDIA_VERSION(2000)),
>> +          XE_RTP_ACTIONS(SET(XE2LPM_L3SQCREG2,
>> +                             COMPMEMRD256BOVRFETCHEN))
>> +        },
>>          { XE_RTP_NAME("Tuning: Stateless compression control"),
>>            XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001,
>> XE_RTP_END_VERSION_UNDEFINED)),
>>            XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL,
>> UNIFIED_COMPRESSION_FORMAT,
>>=20
>> REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
>>          },
>> +        { XE_RTP_NAME("Tuning: Stateless compression control - media"),
>> +          XE_RTP_RULES(MEDIA_VERSION(2000)),
>> +          XE_RTP_ACTIONS(FIELD_SET(STATELESS_COMPRESSION_CTRL,
>> UNIFIED_COMPRESSION_FORMAT,
>> +
>> REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
>> +        },
>> +        { XE_RTP_NAME("Tuning: Stateless compression control - media
>> (Xe2_HPM)"),
>> +          XE_RTP_RULES(MEDIA_VERSION(1301)),
>> +
>> XE_RTP_ACTIONS(FIELD_SET(XELPMP_STATELESS_COMPRESSION_CTRL,
>> UNIFIED_COMPRESSION_FORMAT,
>> +
>> REG_FIELD_PREP(UNIFIED_COMPRESSION_FORMAT, 0)))
>> +        },
>>          {}
>>  };
>>=20
>> --
>> 2.46.1
>
