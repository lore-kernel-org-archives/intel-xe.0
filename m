Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A3AE9A03E
	for <intel-xe@archiver.kernel.org>; Tue, 17 Feb 2026 23:51:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C64310E0E4;
	Tue, 17 Feb 2026 23:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="c7OFegjR";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5232410E0E4
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Feb 2026 23:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771372314; x=1802908314;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=QGX3AFzuhzyB0hawb3N/PD3ig/rN1PFq3Auxs4CpzFI=;
 b=c7OFegjRfDMlnWiXlj1dgJQZKaYIDZOdqPm5A6UwGwj4jEPn0AbV0PSl
 uJkfq+WnwLIb+MKBztD0Ps2VupOOWe2/ro+VWUzSChoGuSlfP1woZSLg1
 +6jAfI0qiq/jYbYglzijORNpJ2uAZbzPoVNdfmpxORch8006KyjtyIcMc
 vmolBJztp5gOINC9rvye02Sct/D8UXPYeuGjGoqz/BC06JvQFNfDlqyDT
 Mw+BhcaeSHXPz7Bp8GsA251/I5KzxAIoBJDKhUxIrMV4CZ36jfXjOtvbN
 SyppgvOkjgTXrpl4LbwWPjqjP2gnTIWbVDRF1sbHco7Djub5z8rYz0//g w==;
X-CSE-ConnectionGUID: 0Y5tniM3TROdYMAX+8i4mw==
X-CSE-MsgGUID: g0Wo0N1ATNeplxAb0q5uoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72497166"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="72497166"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 15:51:50 -0800
X-CSE-ConnectionGUID: 0cwIwn8AQpGF6R/EKGQ8XA==
X-CSE-MsgGUID: VbSPMihSQLizV++KE1Pazg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="218560055"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2026 15:51:50 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 15:51:49 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Tue, 17 Feb 2026 15:51:49 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.67) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Tue, 17 Feb 2026 15:51:49 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvmZfvo2rky7EMiWTblwH0u5K0kwLiLC4QyXet/eZebSe+mwf5uzdgBNiLRZ83PAmfocyHZQunXTTFj4WgskYcGU8klQwHNjFDuTmgQ0iJpGR4YcVbABgZPRXgVoYCNzmQBV29vWNWqoQHXbShibAbz6m/6vgfHrphoKhgP9642MZQhPvkb9WUMp8OEWeNIyxVqIOPYMs/84x87Uj0LXQNywh18zYvi6ORTfITrSRvqBnwx53lnZnM0rnP8aM1H5Lisi0ioxu0ELX4AttNbg3iAvpoWcRFRHK7vqF5TXhchDoPeDStyildivnEqiiyMRIBaO+dgA4iKSCYyuzpw8XA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bQpG/1Ar8V9WlUOgpLa/+xwQsn3Egh6qe9d2abgXaVg=;
 b=XR/0zTrdnoQZ2YzSimqZ8OJlz/ECUYoi6fH5t3gTuFGpfouId3lzTSNELYgZMJsF62oAvOhBwoHeq3wRCdnV9m51wUN+ERsjfRPVLRHa1zeBufUCVs+F7pzOT7dnfiSuV4/MyUxwVXhyXm5MQ0l4z/CiQWMm1FsBPm9siFhdPUMcO2Zzo39DCRxAJF6oyCh/urztMSLquj8rSAE22ybIWCVH4cSapqDScOwOjFqpV7EH97CnVPBp+PmXxMmsqs4LvNiTtFZjENtzafy85cprNRLS9oYhcstDDywOvrDZKw/P4KflXPp6sU28+Y0GtJ4T0sTPPAUP8it9FfRyOCUJWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by IA1PR11MB6124.namprd11.prod.outlook.com (2603:10b6:208:3ec::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 23:51:42 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::7b65:81e6:c6c4:449e%7]) with mapi id 15.20.9632.010; Tue, 17 Feb 2026
 23:51:42 +0000
Date: Tue, 17 Feb 2026 15:51:40 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [v2] drm/xe: Allow per queue programming of
 COMMON_SLICE_CHICKEN3 bit13
Message-ID: <20260217235140.GT4694@mdroper-desk1.amr.corp.intel.com>
References: <20260217083436.1101287-1-lionel.g.landwerlin@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260217083436.1101287-1-lionel.g.landwerlin@intel.com>
X-ClientProxiedBy: SJ0PR05CA0014.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::19) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|IA1PR11MB6124:EE_
X-MS-Office365-Filtering-Correlation-Id: f8bd9e59-61cf-4e3f-cb6b-08de6e7f8039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SWViaUFsMm5NQ3VyWUJLaUZFeVdjZ2grLzlsSTFFM3pFMWtLcGR4UzQ3OVZS?=
 =?utf-8?B?bmdmbGhTVkswdmVvQll5ZzJyWTR0SVlRa0ZHKzBoVmM4SEJJTC9oam90RFpY?=
 =?utf-8?B?KzgrdURVUnRSRGdMSlhWVld4QTJzRlphSmVWbGszWHZyK2hkQWV5TTVvU01o?=
 =?utf-8?B?K2xsd01JbGd5dnJMQXl4KzBXTi9jckJQQzVJQkxTRWJFa1lZNGVvZXRnZll3?=
 =?utf-8?B?VktDS1JadU1RUk04RzJHUE9uZGRHaldiMGNJUENDcFVlb2xQbkpHYzdvWkZL?=
 =?utf-8?B?SmR2dDd0aWw4YUFuQmVIaGdXa3hIc1hpM3hIeFR5clNGL0dpRndTUlY2OWxp?=
 =?utf-8?B?ODBJandSQ0Q2UDhHVHVtbGpvanI3OFNRNEl6QThRb2MrU0tQMEVVamV3R2VG?=
 =?utf-8?B?L1FKY1J2bThvaHVNU2dDcFpkZUlSL2J5SGovMXZQVnp5a3ZLSEc0Q0wrYnNG?=
 =?utf-8?B?TTJoamdEem5tOE5rai9nNEhCQ05IcWRmbU9WZnMrTG11SkU3TmVyNmpwOEt6?=
 =?utf-8?B?ZE5nQTUwdXZYcHhoc1JCNGJoQURtV3BSR0xxK0x4bXlTdk5SaHlsN1VReDI4?=
 =?utf-8?B?TXM0NlJuVzMzdDZUWkNMTzdNTS94dlJkZ3VyQTIzckJoMXBnZkV5dXBtVzE3?=
 =?utf-8?B?V254OGFWMVpNTDR2T3BFTDVBM1gvODI4SFEwaEdDOFRiOERwZGQvOUt6TU5q?=
 =?utf-8?B?NVpjTElmTnFiMXVvbHJGTWorNzcwS01vWHZ4RzJhZFdBRVVnZWNEc2k2Yjk2?=
 =?utf-8?B?eEx5V0V1T1VvYXRQS216UU1jTEp1VWpkeVVLcFBkc3ZHM1o3MFlwU0JYVlBa?=
 =?utf-8?B?R3dqMWtLckZaQXVMbytwQ0NWTmhscWxNUFczY0wxUnIyNkpBbFJCRVFpN09m?=
 =?utf-8?B?Wk1nWmZ3ZUEvMk9wUTRLVURPN3I0Zzc5MGFrdDc3K1ZQNHp2cjk1TjU3M1Z3?=
 =?utf-8?B?VXBpc2JWK2cvbVhlZzBKeloya0JLbmlqRnhJVlYybXliK2dHRUREblBZYUt5?=
 =?utf-8?B?V2xyUitRSmtMWGtlYktTcWlVRnlJMkMyNktFM2JBQzlKWmR2U3EvUWV4Y1lV?=
 =?utf-8?B?TC8rMzFycFM4bXBvMGRVTCtvb3hKczRzemxrT24xM1FEZEN3L1pJb1VjcVoz?=
 =?utf-8?B?a1NORVhxK3JsRVlmdlpMM3RhUUV2NHZ1MXREQmdRZDU2M0UwU0wvaGl6V1FU?=
 =?utf-8?B?WTRGYXlqVC9PVWN0WThlLzNjOFZZS2hGUWR3dld0T3E4T0ZtNGhGNVdPRHVX?=
 =?utf-8?B?TFpBdUFDWkpMeGxhc1Vpd1F5QkJncjl3MUhtOW1mK2pMbWlqYlpsMWhTYkgy?=
 =?utf-8?B?UXhmNGMyMjFSVDltVlhURjd2WVhUdEp1M1l4MkVxMW5CWmMvUE9kOHRKT0pl?=
 =?utf-8?B?SkZWZERkMjRUT1NjYStYZlVxWUY2dVJtY0huSFhhODJIdFREdERGa1NCQXdx?=
 =?utf-8?B?V0Z2cXVhdmF0eXFXNXJJbEMwb3BiaGEweElEQXlnM04zS05yS3lEdEtZUFBt?=
 =?utf-8?B?N1RnL0Q0UjEwNG4zTWdKYnNqQUNmVWo2SXVxWTFkbTlUS0IwaGV4WHI0cHFT?=
 =?utf-8?B?VHUvTmNacUMzZWo3aHZKdUlFSWRUU3c4RkZ6cGorSWErdThRalNKRUJ1Z2pQ?=
 =?utf-8?B?aWVGUkkvdWdQMFFVVFhkTFpXeXFBQ3lTTEs3c3IyaUJxem0yd1h2TUZYbU1W?=
 =?utf-8?B?bUZFeUx1c0hxQkUvUklqVUlvNmtobVZ5enpCVmNyTFFjQzVYUUJMZEZvM2tM?=
 =?utf-8?B?TVpmTENNZ09pTDhtbm5KWXRDd0ZQMGdOQ0wvbkwvcmN3NHo1SWo0WEFZQTZE?=
 =?utf-8?B?aTJ5b0o4T21hdUtiUEVLcWdKUk1QSTA0RDErdDdpbUxOV2ZUdUVFaWdMZXA3?=
 =?utf-8?B?VFBLbXhGeUV4eWFFMWdscWp4V2hZcW54OUZZVDZTM2I1cWZMNFM1bTZyVWd4?=
 =?utf-8?B?YXhvUTgzblc0Y1BXaXh4bTVONUhubDQrK2RSd0w0ZTJzMHdoaFFHalkxYS91?=
 =?utf-8?B?L2pjTHpGOWVweFdyWXlxdENZeVUwM2p5UFdiQ2ZBSER5Z0lzT3RvTmp4TEJI?=
 =?utf-8?B?NVV1SlUvQnJ5WEQxUWl1WkFHRm8xZ0hZLzUvYUtxSE9TOElPVisxMml3UVo4?=
 =?utf-8?Q?gDyM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YnJIL1dpY0lTczZ6TlB4c2lUVE1vL0hBcUtxNTI0Z3JjQXNuUUhLMXdhNUts?=
 =?utf-8?B?V0Y4OTVwd0dObkdwNHJVK1M3dWhDZ2Z4NzhZVkIvUTBSL0FwbTZOZmdML3FL?=
 =?utf-8?B?dXJMYUhGMlorSTJQTkF2QU9OdVhJRlJzUEdBblZzTHhsYlJPdCtna2g0S3U4?=
 =?utf-8?B?NGx6MXZQVElPNDV4RVhaNHlHS1lJQ05GUkM3RHFTL0JTTXlneXorTDdIZzVF?=
 =?utf-8?B?MEZRY0s5ckoxQ2J1VGl2Q1dtclZOTmQ0Yi9yWFZUa3RBUTNMZFdUbWkzYlNh?=
 =?utf-8?B?eXl1dkVxbnhTUTI3RDJMdWJxOXVwVlk1dDlXcUhqZHpNUm1YZEdsby80UFhN?=
 =?utf-8?B?R09XWTFGVmxKdmJFSEkyVTBpbWNEeVRCb0w5YWtMK2hjVzRKaFpNRm10Qk1n?=
 =?utf-8?B?SWlzRy9IZ1IvTlFwc25qWUs2c01FSDNZNDF4cDVDODdrZDRDbHgyZmtiQmNr?=
 =?utf-8?B?UGlXYmhHK0pNckM2K29Ta2JnU2I4SmRHUlpleWljTDJ2disrWWdNMXBkTVRK?=
 =?utf-8?B?K0JBd0loVnE0ckVFeEZrektiTFZwMVFiSUJkY25rVW9KT2J1MWg4TTlUOWRw?=
 =?utf-8?B?bUoxZjF4UFpCcUI5MEpLMys4TG82WTFYUXU5alZ6SlZJNTlHYWlwL09YeHg1?=
 =?utf-8?B?aHJ2VGNWaDA5WlJ6Nk0rWnkrc3dHc0gwaDVNU3dNVlVPQW5tRGt5K2prUmd3?=
 =?utf-8?B?UG1VeUFDZjJkb3lTakVWaXJNNE0yTDQ1T0NMZ0oyL1JzYUlhL2M5WW5Xb3Bj?=
 =?utf-8?B?aDBidVBuZG5qT2pTcFVLaW5aaEltMVdsb2xRRDRRMjZHSU4yUU5EWW5HUnJ5?=
 =?utf-8?B?ZTM5VGRBa3dWaG11cUkxNHA0dlFZWTMrMGFkWnlFb0hFTmVUbThrb1BEMldS?=
 =?utf-8?B?UGdMemRVZXZYeXpSQmVUYlZXWmVLSnJuTGxSM09IajNPRFVIdi9uZTZxOWN2?=
 =?utf-8?B?cVNzdTRNbk02YTk0eVErdGtxK2R3Qzl6eUR5N3RNZEF3Ymx2UktaQm9YOGUx?=
 =?utf-8?B?NHAzMi9iRDVHdlpJQTY4bElrWnJFZjdETzBSbXhPSEVrZmN0a3RIZVY0b0NE?=
 =?utf-8?B?U09pNEo4OU5nV0ZWdGtTOUNRV1ppQmVJaW1tNVp5cXJJbVU5dEFmTld0aEly?=
 =?utf-8?B?UFBMWk5kRk1rME9lbE1rdHAzSTVFNzdoNWJ0UE9ucnZkVXQvWW42bW1vNEU4?=
 =?utf-8?B?ZjNNVEIrYWNUaGN3Z2pMR21XQkhML3k4QmEvQVdXaGZUZGZFSk45R0Q5OE4y?=
 =?utf-8?B?YUpGS2Y0aXR1SmpkQTIxeFhOdktGNitocDM5V2FkeFdjbTN5Vm8vNWNMcWpJ?=
 =?utf-8?B?ZWNDc0tDbXZTcjJ6Q09oZ2ZBZmJ3S3o1N2ZsdldVaXZEd2JFS2VmeUphMHpB?=
 =?utf-8?B?bGV0VEhna2N6dTAxT2ZUdU1aK0I3NDQrMVlzRHNUOFlmVkpTb2FuWEZuUU1M?=
 =?utf-8?B?ZG90S3VUVno1Q2wwcUQ4OUFjUnQxSjBmc1YrTkwvVjhnN1dFaUttKzQwR0Mx?=
 =?utf-8?B?anZXVzVDd0g0cDJySzJxSWVobTFRMTVwamZOOWRIUUtMTHZRYWduS29aU0FX?=
 =?utf-8?B?SjVsQWZiQ290aFB1b1d5VlV1WEhHVHl0TFU1UVdjdXRpcVV3TVVXUWo1VGtE?=
 =?utf-8?B?NVczeWVsU2k5ZDN5OXR6VEhEMjd6U1Nud25yZzR5TUpGOTA0enZDejIzRWRM?=
 =?utf-8?B?VllIMExnaXMxcGZWRlJNd2IyVWRmcVh0djhHSGJ3cVNGUkRQREtlMVQ0VzRV?=
 =?utf-8?B?cTQ1eGxkRjNFSnpUM2d0cFlpM0F6UFZ1dTNLR3M2MTZyK1YvVFRueWFMQ3lr?=
 =?utf-8?B?anFPS1AycUpVMHExQTBCdzdMa01mNUY4TG5BTURUV1NIZjJacXhUdkRnMzVs?=
 =?utf-8?B?MDQ3bHVBWU1TYWZ5S3dpTDFVVGF0S1JzV1kvQlN0NUNmQ0pNY3NDYWhDMlU4?=
 =?utf-8?B?SlRxdks3cGhGSG1ZZnl0Z2FkSEQrRitMcTdXdEwvdmtkKzlEcDlJd1ZDR09W?=
 =?utf-8?B?QmZ6VTZWaTk4M25INUtSY0pXa3FBcWtNc0pKeUxSdEJ6M251ZzkrOEcvL1Fo?=
 =?utf-8?B?RlloRWswbmJ1SEllWmZWdGZNaXZ0ZlYrSTRWYXBHNTk4OGUrejVUT1JKSnpM?=
 =?utf-8?B?ZDUva3ZjcWpuNlhaNFpOdERsZnpOaU03VFI4QVpZMkpvMGNOWURHS0JjRnZV?=
 =?utf-8?B?NlJKK2tuYW51Yndjd0JKK0x6cFpwcDJGU1FzZmIvendZckE4QjkxZUhPZmFr?=
 =?utf-8?B?Tnc0eWZMVXJlWnhsaWVxTDBDNXpQRUl5eC9lME5TTDB4RGNMejJORmlxZVBW?=
 =?utf-8?B?V2RPbzYzWTJhaUdITkIyT05WUHhLQWtiY0xYZG03dXFtZHgvY0MvV1ZaMU1j?=
 =?utf-8?Q?NV8L/VOqKwVsMWwE=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f8bd9e59-61cf-4e3f-cb6b-08de6e7f8039
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 23:51:42.6403 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/4YRtAnEwD+0dqp3Lx7/ZvRQQ1KAfnwQra2OJCNiSm1mGdCbmvgXdIzC6Z8w3naWJRR03jPLLj0KbptU50Jo03gjFx2vZboe11TaOFwkjU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6124
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

On Tue, Feb 17, 2026 at 10:34:28AM +0200, Lionel Landwerlin wrote:
> Similar to i915's commit cebc13de7e704b1355bea208a9f9cdb042c74588
> ("drm/i915: Whitelist COMMON_SLICE_CHICKEN3 for UMD access"), except
> people have decided to not rely on putting the register on the
> allowlist for UMD to program and instead have context/queue creation
> flag.
> 
> This is a recommended tuning setting for both gen12 and Xe_HP
> platforms.
> 
> If a render queue is created with
> DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX, COMMON_SLICE_CHICKEN3 will
> be programmed at initialization to enable the render color cache to
> key with BTP+BTI (binding table pool + binding table entry) instead of
> just BTI (binding table entry). This enables the UMD to avoid emitting
> render-target-cache-flush + stall-at-pixel-scoreboard every time a
> binding table entry pointing to a render target is changed.
> 
> Bspec: 73993, 73994, 72161, 31870, 68331
> Signed-off-by: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
> ---
>  drivers/gpu/drm/xe/regs/xe_gt_regs.h     |  1 +
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 18 +++++++++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  2 ++
>  drivers/gpu/drm/xe/xe_lrc.c              |  9 +++++++++
>  drivers/gpu/drm/xe/xe_lrc.h              |  1 +
>  drivers/gpu/drm/xe/xe_query.c            |  2 ++
>  include/uapi/drm/xe_drm.h                |  8 ++++++++
>  7 files changed, 40 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index a375ffd666ba2..80a438e51419f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -178,6 +178,7 @@
>  
>  #define COMMON_SLICE_CHICKEN3				XE_REG(0x7304, XE_REG_OPTION_MASKED)
>  #define XEHP_COMMON_SLICE_CHICKEN3			XE_REG_MCR(0x7304, XE_REG_OPTION_MASKED)
> +#define   STATE_CACHE_PERF_FIX_DISABLED			REG_BIT(13)
>  #define   DG1_FLOAT_POINT_BLEND_OPT_STRICT_MODE_EN	REG_BIT(12)
>  #define   XEHP_DUAL_SIMD8_SEQ_MERGE_DISABLE		REG_BIT(12)
>  #define   BLEND_EMB_FIX_DISABLE_IN_RCC			REG_BIT(11)
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 66d0e10ee2c4a..d3168353fcaaf 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -292,6 +292,9 @@ static int __xe_exec_queue_init(struct xe_exec_queue *q, u32 exec_queue_flags)
>  	if (!(exec_queue_flags & EXEC_QUEUE_FLAG_KERNEL))
>  		flags |= XE_LRC_CREATE_USER_CTX;
>  
> +	if (q->flags & EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX)
> +		flags |= XE_LRC_STATE_CACHE_PERF_FIX;
> +
>  	err = q->ops->init(q);
>  	if (err)
>  		return err;
> @@ -850,6 +853,17 @@ static int exec_queue_set_multi_queue_priority(struct xe_device *xe, struct xe_e
>  	return q->ops->set_multi_queue_priority(q, value);
>  }
>  
> +static int exec_queue_set_state_cache_perf_fix(struct xe_device *xe, struct xe_exec_queue *q,
> +					       u64 value)
> +{
> +	if (XE_IOCTL_DBG(xe, q->class != XE_ENGINE_CLASS_RENDER))
> +		return -EOPNOTSUPP;
> +
> +	q->flags |= value != 0 ? EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX : 0;
> +
> +	return 0;
> +}
> +
>  typedef int (*xe_exec_queue_set_property_fn)(struct xe_device *xe,
>  					     struct xe_exec_queue *q,
>  					     u64 value);
> @@ -862,6 +876,7 @@ static const xe_exec_queue_set_property_fn exec_queue_set_property_funcs[] = {
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP] = exec_queue_set_multi_group,
>  	[DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY] =
>  							exec_queue_set_multi_queue_priority,
> +	[DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX] = exec_queue_set_state_cache_perf_fix,
>  };
>  
>  int xe_exec_queue_set_property_ioctl(struct drm_device *dev, void *data,
> @@ -946,7 +961,8 @@ static int exec_queue_user_ext_set_property(struct xe_device *xe,
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_PXP_TYPE &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_HANG_REPLAY_STATE &&
>  			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP &&
> -			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY))
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY &&
> +			 ext.property != DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX))
>  		return -EINVAL;
>  
>  	idx = array_index_nospec(ext.property, ARRAY_SIZE(exec_queue_set_property_funcs));
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue_types.h b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> index 3791fed34ffa5..f4f72d01eb8c8 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue_types.h
> +++ b/drivers/gpu/drm/xe/xe_exec_queue_types.h
> @@ -134,6 +134,8 @@ struct xe_exec_queue {
>  #define EXEC_QUEUE_FLAG_LOW_LATENCY		BIT(5)
>  /* for migration (kernel copy, clear, bind) jobs */
>  #define EXEC_QUEUE_FLAG_MIGRATE			BIT(6)
> +/* for programming COMMON_SLICE_CHICKEN2 on first submission */
> +#define EXEC_QUEUE_FLAG_STATE_CACHE_PERF_FIX	BIT(7)
>  
>  	/**
>  	 * @flags: flags for this exec queue, should statically setup aside from ban
> diff --git a/drivers/gpu/drm/xe/xe_lrc.c b/drivers/gpu/drm/xe/xe_lrc.c
> index 38f648b98868d..a962ac2bb7ca2 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.c
> +++ b/drivers/gpu/drm/xe/xe_lrc.c
> @@ -14,6 +14,7 @@
>  #include "instructions/xe_gfxpipe_commands.h"
>  #include "instructions/xe_gfx_state_commands.h"
>  #include "regs/xe_engine_regs.h"
> +#include "regs/xe_gt_regs.h"
>  #include "regs/xe_lrc_layout.h"
>  #include "xe_bb.h"
>  #include "xe_bo.h"
> @@ -1447,6 +1448,7 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	struct xe_device *xe = gt_to_xe(gt);
>  	struct iosys_map map;
>  	u32 arb_enable;
> +	u32 state_cache_perf_fix[3];
>  	u32 bo_flags;
>  	int err;
>  
> @@ -1579,6 +1581,13 @@ static int xe_lrc_init(struct xe_lrc *lrc, struct xe_hw_engine *hwe,
>  	arb_enable = MI_ARB_ON_OFF | MI_ARB_ENABLE;
>  	xe_lrc_write_ring(lrc, &arb_enable, sizeof(arb_enable));
>  
> +	if (init_flags & XE_LRC_STATE_CACHE_PERF_FIX) {
> +		state_cache_perf_fix[0] = MI_LOAD_REGISTER_IMM | MI_LRI_NUM_REGS(1);
> +		state_cache_perf_fix[1] = COMMON_SLICE_CHICKEN3.addr;
> +		state_cache_perf_fix[2] = _MASKED_BIT_ENABLE(STATE_CACHE_PERF_FIX_DISABLED);
> +		xe_lrc_write_ring(lrc, state_cache_perf_fix, sizeof(state_cache_perf_fix));
> +	}

This will put instructions in the LRC's ring to update the register.  So
when this context starts running, the context switch will load the
default value of COMMON_SLICE_CHICKEN3 from the LRC's main MI_LRI
instruction, then these commands will run to update the value, and
eventually when we context switch away, the modified value will be
written out to the LRC's main MI_LRI instruction so.

That should work, but wouldn't it be more straightforward (and more
consistent with our other LRC initialization) to use
xe_lrc_write_ctx_reg() to put the value we want into the LRC even before
it runs for the first time?  That's how we poke several other register
values into the in-memory LRC during init.  There's a
xe_lrc_read_ctx_reg() you can use to get the current value for
read-modify-write purposes (see the handling of the RUNALONE flag for an
example).

The only quirk of using xe_lrc_read_ctx_reg() instead of
xe_lrc_write_ring() is that we'll need to add a #define for the dword
offset of COMMON_SLICE_CHICKEN3 within the LRC since we don't have that
defined yet.

> +
>  	map = __xe_lrc_seqno_map(lrc);
>  	xe_map_write32(lrc_to_xe(lrc), &map, lrc->fence_ctx.next_seqno - 1);
>  
> diff --git a/drivers/gpu/drm/xe/xe_lrc.h b/drivers/gpu/drm/xe/xe_lrc.h
> index c307a3fd9ea28..083a2167aeef8 100644
> --- a/drivers/gpu/drm/xe/xe_lrc.h
> +++ b/drivers/gpu/drm/xe/xe_lrc.h
> @@ -49,6 +49,7 @@ struct xe_lrc_snapshot {
>  #define XE_LRC_CREATE_RUNALONE		BIT(0)
>  #define XE_LRC_CREATE_PXP		BIT(1)
>  #define XE_LRC_CREATE_USER_CTX		BIT(2)
> +#define XE_LRC_STATE_CACHE_PERF_FIX	BIT(3)
>  
>  struct xe_lrc *xe_lrc_create(struct xe_hw_engine *hwe, struct xe_vm *vm,
>  			     void *replay_state, u32 ring_size, u16 msix_vec, u32 flags);
> diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
> index 34db266b723fa..5927eaf792efe 100644
> --- a/drivers/gpu/drm/xe/xe_query.c
> +++ b/drivers/gpu/drm/xe/xe_query.c
> @@ -340,6 +340,8 @@ static int query_config(struct xe_device *xe, struct drm_xe_device_query *query)
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT;
>  	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
>  			DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY;
> +	config->info[DRM_XE_QUERY_CONFIG_FLAGS] |=
> +		DRM_XE_QUERY_CONFIG_FLAG_HAS_STATE_CACHE_PERF_FIX;
>  	config->info[DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT] =
>  		xe->info.vram_flags & XE_VRAM_FLAGS_NEED64K ? SZ_64K : SZ_4K;
>  	config->info[DRM_XE_QUERY_CONFIG_VA_BITS] = xe->info.va_bits;
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index c9e70f78e7238..856838fcadd89 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -406,6 +406,9 @@ struct drm_xe_query_mem_regions {
>   *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT - Flag is set if the
>   *      device supports the userspace hint %DRM_XE_GEM_CREATE_FLAG_NO_COMPRESSION.
>   *      This is exposed only on Xe2+.
> + *    - %DRM_XE_QUERY_CONFIG_FLAG_HAS_STATE_CACHE_PERF_FIX - Flag is set
> + *      if a queue can be creaed with
> + *      %DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX
>   *  - %DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT - Minimal memory alignment
>   *    required by this device, typically SZ_4K or SZ_64K
>   *  - %DRM_XE_QUERY_CONFIG_VA_BITS - Maximum bits of a virtual address
> @@ -425,6 +428,7 @@ struct drm_xe_query_config {
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_LOW_LATENCY	(1 << 1)
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_CPU_ADDR_MIRROR	(1 << 2)
>  	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_NO_COMPRESSION_HINT (1 << 3)
> +	#define DRM_XE_QUERY_CONFIG_FLAG_HAS_STATE_CACHE_PERF_FIX	(1 << 4)
>  #define DRM_XE_QUERY_CONFIG_MIN_ALIGNMENT		2
>  #define DRM_XE_QUERY_CONFIG_VA_BITS			3
>  #define DRM_XE_QUERY_CONFIG_MAX_EXEC_QUEUE_PRIORITY	4
> @@ -1279,6 +1283,9 @@ struct drm_xe_vm_bind {
>   *  - %DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY - Set the queue
>   *    priority within the multi-queue group. Current valid priority values are 0–2
>   *    (default is 1), with higher values indicating higher priority.
> + *  - %DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX - Set the queue to
> + *    enable render color cache keying on BTP+BTI instead of just BTI
> + *    (only valid for render queues).

I'm not sure if this is the best name.  The bspec indicates that
0x7304[13] effectively *disables* "state cache perf fix" which was only
intended for DX11 scenarios and shouldn't be used elsewhere.  So it
seems like the name here should either mention "disable" or should be a
more descriptive explanation of what actually happens when we set this
flag (e.g., "xxx_USE_BTP_AND_BTI" rather than using the vague "PERF_FIX"
terminology).  The maintainers may have thoughts on what they want to
see.


Matt

>   *
>   * The example below shows how to use @drm_xe_exec_queue_create to create
>   * a simple exec_queue (no parallel submission) of class
> @@ -1323,6 +1330,7 @@ struct drm_xe_exec_queue_create {
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_GROUP		4
>  #define     DRM_XE_MULTI_GROUP_CREATE				(1ull << 63)
>  #define   DRM_XE_EXEC_QUEUE_SET_PROPERTY_MULTI_QUEUE_PRIORITY	5
> +#define   DRM_XE_EXEC_QUEUE_SET_STATE_CACHE_PERF_FIX		6
>  	/** @extensions: Pointer to the first extension struct, if any */
>  	__u64 extensions;
>  
> -- 
> 2.43.0
> 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
