Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 032B5CCD1BE
	for <intel-xe@archiver.kernel.org>; Thu, 23 Oct 2025 15:51:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2CE310E91E;
	Thu, 23 Oct 2025 15:51:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cqaI26f2";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC06E10E91E
 for <intel-xe@lists.freedesktop.org>; Thu, 23 Oct 2025 15:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761234692; x=1792770692;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=FFMeWLDHEBxkgGaHuApnHCAFKhrrRvDR+MFxJosVWOk=;
 b=cqaI26f2MfnAT9bJH7J1ZQADeMxUGWT3gRqDk1Q2Ege5IlyGs/a7byTv
 b8MyAfZ5THqrhiDmgxzORBz88dQ675W7sGvaxeo3w08vznZf3Sneavyhm
 PNZrzECXrAjWzlsyBfUepoqJlIU3XPUXTtYzXFf8ujRLxmyMOSUX4smGN
 KshZdpy2D0vuv6plFjh58iaxErmYLBRIJtYNeBnNAoZEsxgft2Gw+Ry+2
 8lSTTuqJ72skaqixo629T6fcfhoB27+J/YJ1WpMWQ35H6kofF66iLXzlz
 8U1AaLCVoCl/D2q86SNQRDA2ezysqm4wdLFkC5r2R3UiwZ99IGXdUVvfa w==;
X-CSE-ConnectionGUID: TGFM5baYT2eLyiYp/mOsTQ==
X-CSE-MsgGUID: RwCJp7i7T/S08eWb8SX+UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74012454"
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="74012454"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 08:51:31 -0700
X-CSE-ConnectionGUID: tPPbVOK9Rt2cMuId4B4Ibw==
X-CSE-MsgGUID: xEZB9qbgQmeBZjY1lsq4qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,250,1754982000"; d="scan'208";a="184578649"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 08:51:31 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 08:51:31 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 23 Oct 2025 08:51:31 -0700
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.23) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 23 Oct 2025 08:51:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGe+gwbLW7Sg79C2bXi1vZnnSb460lqsdVSyA1cwYmhEqHtkPaC/sfg69bE+75TKpm1NCZIBayJOxY4GJJA0fcm6NnGTdYy3VXhaicrK+gIZpxwExgsndJ/GaCjZ4IBez0cpVLu9CkvEjq9OBDyuTVTc7kyVTirjYgeiON7syZyr/OH5foGN1b+WTBPVOkhz9WhxFpgFR0TVR6gWPFKj2hOVPewJx7cPDRUM0YXXpM9Ztl3MCINBYUZmTNgChIXGjEKw6CWYF6IJzsVckWhnFgF3/pXLHqzLvNzq4kcPJ/q1qiLVkKgS+ApswrYdcGo4GQ0/D7kTiMYB2ZVCC+ZP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FFMeWLDHEBxkgGaHuApnHCAFKhrrRvDR+MFxJosVWOk=;
 b=Nhz0KMcgfbvoPjxeYbNPA0xPebxPuMiAqh9mSkuG1aaF9qtn9xR8Hil98Ssro8VWb+ieMNR8xoystYiVntsklY4wtqFCCxiHdnxBwuP76bjc1aBnkoQrI/lgJamDFMOph2DlDq0hQm1+JkE7nJdgAg3FuEr3XEynxf42MwIDaule2HGINJHKsHlXuaMhS0YikhhUmnFJWB8NdbSgOVgovLDbYq6OsVy6GWn2jWTCJHkQ5BiSbyCMi9S7xH1Q0PYc7psKC6SVBC3GeYyVl2k8dk+a+7n7NQf8wVus594ppdGgdls9wZxHtUqPuf70RxJeotClQpXSlsHimjpDAy/ArA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH7PR11MB8477.namprd11.prod.outlook.com (2603:10b6:510:30d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 15:51:28 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 15:51:28 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Summers, Stuart" <stuart.summers@intel.com>
Subject: RE: [PATCH] drm/xe: Limit number of jobs per exec queue
Thread-Topic: [PATCH] drm/xe: Limit number of jobs per exec queue
Thread-Index: AQHcQ3+bR1F8WcnqQk6RZLBu04VA4bTOgcoAgAFfqdA=
Date: Thu, 23 Oct 2025 15:51:27 +0000
Message-ID: <DM4PR11MB5456A69535CDE3915CE71A3AEAF0A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251022181036.2868787-2-shuicheng.lin@intel.com>
 <aPkm4utKS39I1W/o@lstrano-desk.jf.intel.com>
In-Reply-To: <aPkm4utKS39I1W/o@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH7PR11MB8477:EE_
x-ms-office365-filtering-correlation-id: 23d3c737-bbe9-44d8-a827-08de124c0733
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?emlBY3hjZ3JoaVZjU3k5MFQ1RFJwSUVwTmVlemRGd0FmMEJjcWRsd3ZzNlNC?=
 =?utf-8?B?ZzducU14S21XWElCWXpMd1lOajdtMXJPNlBUaW01ZUgwbGRTcW1KT0pwQm42?=
 =?utf-8?B?aVhId0c0dW1ya0lUaW9ub3RrOGREK0FrNUsrdk1hV1Y0ZC93d3dRUEFRVk9x?=
 =?utf-8?B?R3ZqUi84bVJ0K1hkRU5RU3ZlVTZVc1FrZ0UvSHdwcm55Ulh5a1hkb0ZudjRl?=
 =?utf-8?B?djZ2Q2tBSGh6NVpWSHRuQ2t2dnZzdWFYdGtFUG5jN0JVejY4cUEyUHpubXFt?=
 =?utf-8?B?VDVMR1Byb1JjWnFIOTRLQzVXYVlUNHQreHZpMkFJT0xsanZiVVY0VTk2Q2xo?=
 =?utf-8?B?ekhGN0JmaXNKaEY2U1o3S3h5cVNGOVZ6R2k2emRoQ3VLcC9OT3lnN1FieXJt?=
 =?utf-8?B?NG50ZUJHUlgvc25ZOGlJakVTV3RwTEtLZjhVdUhXeENCYVZMenRDTFpzTWQy?=
 =?utf-8?B?RTZxUnhDNldOMXNuOXZFaER4bnpUTXpzRzhDcVdhRWZTWDVmME55K0ZQcHR0?=
 =?utf-8?B?K2FPbnpkc1QrMDNPUUt2Y0J0OWZDdGJ4WDdETWxKVTY3Z1RpdVVadkFYZnBL?=
 =?utf-8?B?YVdJeGZWYmFCU2c4VTZnVXdMYVRJZTdVbnpJRk1WZ0tuTnhKWkoxaFl5bjVs?=
 =?utf-8?B?VWVWcG5PQkx1UTlOWnJTc1JIbld0cEhCOEdtbG1IRW13SDh3R2VEYTE5dFVm?=
 =?utf-8?B?OExjUVF3MGdBNFdwdnFrNDA4YWFVeWxsQnpjaGVsQmFqb1FPRDQzTW0zY2pU?=
 =?utf-8?B?dDVoUGVZOWJTZzBsSFNCcmM4NUtwQnZmVzRXTTFWYWZGVkRGdENGUDBrSHRl?=
 =?utf-8?B?Smo2ZDlCQlowcThvaW5YOXRNRkVFaEYxRHJFbjVDc1BFVkN0UUtsSWVLSFlj?=
 =?utf-8?B?ejVmMmpzVkZac0NGdkl2dVZ6cVV2MzM0RmRGRVNoZ1B3WjVVaXBuZ09FVHNo?=
 =?utf-8?B?UmJsUExSTk5sclhZMzdwMEdxZUUrU0pGVkZ0RHVpWC9sWWQyNUNUNncraGcz?=
 =?utf-8?B?b25KU1hoOGdicnF6TFVNOGQ1QjVYUWNHZ0pCZTRBQmhYZXNWTnNVSk1JTUNu?=
 =?utf-8?B?OGIrdDNvY20yanJQZFk1alR0VEFqRVpNcHB6am9sM2hYUGMyRkJ5b09IWFgr?=
 =?utf-8?B?SGxvWERYaHYwbEs3YUVvdUhMQlpZV3owUXEzTVZWYWc5Y3Ird0xBUzllY0R6?=
 =?utf-8?B?d29tRWJUT1lDU1VoOXpOMjRmYkc1TVJYRFd0NFEvbHVwTU1HblFhaFdvSW4y?=
 =?utf-8?B?WUNrV3lPaGhscmg5MWF1cDI3Q2FwbVJGelRnbktDT2NSYVo0OXJSTkgzWHBS?=
 =?utf-8?B?bTFSZFN5STBPMCtqYURvdTR1ZGhrUUxRM0FsWDZDWFB5YnBSZ2w2MUlQZHdz?=
 =?utf-8?B?WjNqemlvTlYyd0I2L1BhalowRHlIamNIWDlTaWY5QWRTU3pTYmdBQ3B3a0c2?=
 =?utf-8?B?V216SjR4QXJzdzdLUlJRZzJ3YTdNenIzR3dxa2pQcE42TGR0K1JTcm15QnZy?=
 =?utf-8?B?TUZoMFpraStLdmJhUHFOVXdkdXhiQm1xTE84YWlodkZKYk1jbWp2K2w3RnJo?=
 =?utf-8?B?bVh3ZTFkZ25vcGRwS2kzRkxmd3RaQXlpSWNKWG1jb2I2WkdZaC9xMkJ4cjIz?=
 =?utf-8?B?SmgxaDJhYXdqMW5EUWtXOVZNOUd4VndjaHlUOVUyTGludUE4eFNVb1MxUXI0?=
 =?utf-8?B?MGZpcGpuUUJtV1VVMUFtbFhYcTZ0blkwQTlxdGdMU2VHODJDOFQwNm11OHBI?=
 =?utf-8?B?eTJqNDNsS1A1WWd0RlVYU3FWQVU0dEJuamM4bjNteDRoUklSYmZ6RnFFNFpY?=
 =?utf-8?B?eXAyRE9NQ1E5TjA3bE80ci9KQXp0NkJrblBQSkdBWDZrNUtMY3oyQUJrcTEr?=
 =?utf-8?B?TjZMRUNWbktRM2ZrTTUyeC9zdHZYaDAvS3N5ZTFRWEtFRzBEMk9xRFQrWEQ0?=
 =?utf-8?B?dlBacjZ6YzBlazFsRm9BM0h2ZFp5ekpaY0d1dEU0Q3JKZC9MaFROYkpyaFFp?=
 =?utf-8?B?UnlNbUx0bnFNVExzMzcvVmhvVXI3bG5pVU1Uc2JrdU93aExiQ3E4VGYwNjEy?=
 =?utf-8?Q?/wDBMc?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUFoL0xzZ1NVUlgwNVFMbkdOMktpNG5PbXRlOGZPSnhLMUx5N3BqVDdTaHMz?=
 =?utf-8?B?aHRGdGFwOU5tQUg3TnFJRjBUTXArRDViS3BuRko5dXBjSm5oV01Qb3R5WmhL?=
 =?utf-8?B?WllKR1c0enNqZitDNURySmRpZ2U5c3dQRjRmSGNUWXFVNmVqYnp1eVBmZVkz?=
 =?utf-8?B?L2dqRWswVTl0czI1RWgvemQ3UjlrL3k2RjNwN2s1NjdxbTdQdldSNEpJbW1m?=
 =?utf-8?B?MlRMc1hLT2Y5SUc4TmRkODZZYjR2Nnk0T0dEam9kNzFuRkw2OVBFOVgzWXVP?=
 =?utf-8?B?R2Yxckt3c3RXelJ6cVlLQVc1bVRUdnNHeW5wYjlCeFVCUEkzSnBlUFdoNFNH?=
 =?utf-8?B?Qk9EZWtkKzBpTUZyUDFQL3BPR25yZkwrNkttY0U0U1pzdVVYZnNmRmJNTFBx?=
 =?utf-8?B?TGJYSHlnc1p4WWxJNzNDRy9Falc4K05DWEdlVm1QcXZtYjRVYjFER25IV2tT?=
 =?utf-8?B?eTJNWWpnQUdFbkhoVi9acmx4SE4ySkhaZXFaeUdZZ0dtbXZaTzhka2dTcnUr?=
 =?utf-8?B?MGpmWmllY2x0OFJTVGk4UE0vK2ZSOElyR0pPcHB3SWp1UU9HQzBlS0IyRE42?=
 =?utf-8?B?UEZCY05pQUtoblJjN2JPWkdxRjVERG5qRWljYmxKVkllc3hLVVFCaUhvd2Q1?=
 =?utf-8?B?aFZrTE83c3RqNjEvd1VsNE9zMzhlT2FFQjNHT0ZKYndja1MzRHQrWUF4NnAr?=
 =?utf-8?B?bEJydWNFa0JFcW9JM0VNRGdoL3pKbU9wVGY5U2w1Yk9BdzFIZ0huVkJKVXFY?=
 =?utf-8?B?WGZFWktheVBqa3RjNzJtdjVodlhVbStTM3RVNndDYk00YnoyOVlRT1llSFJJ?=
 =?utf-8?B?dVlwdUdDOTlSSVkwWmxnNWhqSlFUcFppNkxrZGs4RDBhTlNNNUR3SldsRkdy?=
 =?utf-8?B?aGtsZFlFbE5BcHBDYkhHR3VMSHAxd0p4ajlVNUNQZitVcm9IUkdNU09Dc1Y1?=
 =?utf-8?B?eHFWanZHOGdSRmVkUWpGNUEwM2xSeGg2THRsR0FTNDNGcEpTTXpqMXc3ZThP?=
 =?utf-8?B?ZzY1dTE2cXZVMnBFQlFSQ2E2QmVCVTJ5ekNla0hhWEIrditHWEpYRWNuSFBn?=
 =?utf-8?B?Y1prcXBBLzlvSEpIWjBkS1VDa2VZQTJLc2U4Vk5mN05NTFYyK2tVWE5YRnp1?=
 =?utf-8?B?N1JqUUl1TjdNRkxnWGJ4MEYzSUc0a2ROdWp4RGVOc3pYK0oybXlNOEtTMzJ5?=
 =?utf-8?B?WEJPdCt1ODcxRkFMTGhpQmZiY29rV3FPWGJCaUJuWUhXbDNPUXFvclJJblZU?=
 =?utf-8?B?OWRIQlppdXpQNm1Qc0ZWMDN4NXkvNXJ6aHI2RmFJTDBoY0Q3YWZGbU82aDlz?=
 =?utf-8?B?a2JoVnNOSnNxbVJqZGZOMTdteFdPSU83MWowbEVZNVJ6czBYMnV3b1VmVkhU?=
 =?utf-8?B?aTU2eEd0WE8zOWN0N05uamZnZUg3d2E1d0tCVnlVK2RUVDNSdXhwY2FpOGlB?=
 =?utf-8?B?TzgyMGVSbWlXQnVVakVyZTZKNVVkOUxXdm43Wk9UdlhhMmROR0hjV1Rrcnl6?=
 =?utf-8?B?R3BHTXBJSVFFMFJUaktLUXZLL2YyNFR4NlQxdkllYS9CVnhDbytYSzhTNWRT?=
 =?utf-8?B?SjBKaEZTRlF6UDEzRlA4SjdEL01lemZnMjJ5S2k3SElVdTZCS0hoRlMzUGl2?=
 =?utf-8?B?L0xIeWJSSWZ6UjE4cnc4clgybUJmRjFNU3Bta2JpQmRMakd1a2c1ZjN1SWl6?=
 =?utf-8?B?Tm4waGJxNGdldUtMS3JSOEQ4K0FUNFFXbjRmdGUvUERBc0pNZzFqc09TNTls?=
 =?utf-8?B?QjVPK1NkVnI2WUN0S3hmZ0xxSVVxa3A4VE5iS3IyUDRjeGQzSk5mSUpsVDlO?=
 =?utf-8?B?Vko5c2VNRUFWWHVaV2NXSmdiTVNBb0pySTNGQmJ2R3hBOXRJc2NFRmRON0tB?=
 =?utf-8?B?ejFHbi9aK3RTZWRJUWJnb0psaldNcWJIalVxTU9WWjZqWDhFcklPRGphNVNo?=
 =?utf-8?B?K3lBWmtvSHp4V1c3cElHMW5mZG5RSERyckRUd2xDQXJ0NVZaeDZnM2ZiNk1T?=
 =?utf-8?B?L0VPS2Z0V2s3RUY0amJ0eVZadXRxZTU2eEV6RWhnQ3F0VVBDLzJRWUJ3M0lz?=
 =?utf-8?B?VWhoRHlza2lpUXc5eG9XNTREbWgyMUErYmdsekJWR2pMNVRGTG96ZTZQUGhw?=
 =?utf-8?Q?LfevQdeRznNOGpMYoW29/+ikJ?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23d3c737-bbe9-44d8-a827-08de124c0733
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Oct 2025 15:51:28.0639 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: knHugNQm7DZK5/ZxvMNuyZSGRMP7LP1xjlpO6cQR9n6JM9WRE6Q2Kc/GlYWIrNrc/y45MpMUlQC5obNlBjgl/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8477
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

T24gV2VkLCBPY3QgMjIsIDIwMjUgMTE6NDggQU0gTWF0dGhldyBCcm9zdCB3cm90ZToNCj4gT24g
V2VkLCBPY3QgMjIsIDIwMjUgYXQgMDY6MTA6MzdQTSArMDAwMCwgU2h1aWNoZW5nIExpbiB3cm90
ZToNCj4gPiBBZGQgYSBsaW1pdCB0byB0aGUgbnVtYmVyIG9mIGpvYnMgdGhhdCBjYW4gYmUgcXVl
dWVkIGluIGEgc2luZ2xlIGV4ZWMNCj4gPiBxdWV1ZSB0byBhdm9pZCBwb3RlbnRpYWwgcmVzb3Vy
Y2UgZXhoYXVzdGlvbi4NCj4gPg0KPiA+IEEgbmV3IGZpZWxkIGBqb2JfY250YCBpcyBpbnRyb2R1
Y2VkIGluIGBzdHJ1Y3QgeGVfZXhlY19xdWV1ZWAgdG8gdHJhY2sNCj4gPiB0aGUgbnVtYmVyIG9m
IGFjdGl2ZSBEUk0gam9icywgYWxvbmcgd2l0aCBhIG1heGltdW0gbGltaXQNCj4gPiBgWEVfTUFY
X0pPQl9DT1VOVF9QRVJfRVhFQ19RVUVVRWAgc2V0IHRvIDB4MTAwMC4NCj4gPg0KPiA+IElmIHRo
ZSBqb2IgY291bnQgZXhjZWVkcyB0aGlzIHRocmVzaG9sZCwgYHhlX2V4ZWNfaW9jdGwoKWAgbm93
IHJldHVybnMNCj4gPiBgLUVBR0FJTmAgdG8gc2lnbmFsIHRoYXQgdGhlIGNhbGxlciBzaG91bGQg
cmV0cnkgbGF0ZXIuDQo+ID4NCj4gPiBTdWdnZXN0ZWQtYnk6IE1hdHRoZXcgQnJvc3QgPG1hdHRo
ZXcuYnJvc3RAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNodWljaGVuZyBMaW4gPHNo
dWljaGVuZy5saW5AaW50ZWwuY29tPg0KPiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZXhlYy5jICAgICAgICAgICAgIHwgNSArKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfZXhlY19xdWV1ZV90eXBlcy5oIHwgNSArKysrKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUv
eGVfc2NoZWRfam9iLmMgICAgICAgIHwgMiArKw0KPiA+ICAzIGZpbGVzIGNoYW5nZWQsIDEyIGlu
c2VydGlvbnMoKykNCj4gPg0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
ZXhlYy5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlYy5jIGluZGV4IDBkYzI3NDc2
ODMyYi4uNzIyYTVhYzAyMDBhDQo+IDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94
ZS94ZV9leGVjLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhlYy5jDQo+ID4g
QEAgLTE1NCw2ICsxNTQsMTEgQEAgaW50IHhlX2V4ZWNfaW9jdGwoc3RydWN0IGRybV9kZXZpY2Ug
KmRldiwgdm9pZA0KPiAqZGF0YSwgc3RydWN0IGRybV9maWxlICpmaWxlKQ0KPiA+ICAJCWdvdG8g
ZXJyX2V4ZWNfcXVldWU7DQo+ID4gIAl9DQo+ID4NCj4gPiArCWlmIChxLT5qb2JfY250ID49IFhF
X01BWF9KT0JfQ09VTlRfUEVSX0VYRUNfUVVFVUUpIHsNCj4gPiArCQllcnIgPSAtRUFHQUlOOw0K
PiANCj4gSG93IGFib3V0IGFuIGZ0cmFjZSBwb2ludCBpZiB0aGlzIG9jY3Vycz8gU2hvdWxkIGhl
bHAgdXMgZGV0ZWN0IGlmIHVzZXJzDQo+IHNvbWVob3cgaGl0IHRoaXMgZHVyaW5nIG5vcm1hbCBv
cGVyYXRpb24uDQoNCkhvdyBhYm91dCB1c2UgIiB4ZV9lcnJfb25jZSIgbG9nIHRvIGRldGVjdCBp
dD8gZXJyIGxvZyBpbiBkbWVzZyBpcyBtb3JlIG5vdGljZWFibGUuDQoNCj4gDQo+ID4gKwkJZ290
byBlcnJfZXhlY19xdWV1ZTsNCj4gPiArCX0NCj4gPiArDQo+ID4gIAlpZiAoYXJncy0+bnVtX3N5
bmNzKSB7DQo+ID4gIAkJc3luY3MgPSBrY2FsbG9jKGFyZ3MtPm51bV9zeW5jcywgc2l6ZW9mKCpz
eW5jcyksDQo+IEdGUF9LRVJORUwpOw0KPiA+ICAJCWlmICghc3luY3MpIHsNCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaA0KPiA+IGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2V4ZWNfcXVldWVfdHlwZXMuaA0KPiA+IGluZGV4IDI4MjUwNWZh
MTM3Ny4uNWYzMjE5YWNlYzNjIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94
ZV9leGVjX3F1ZXVlX3R5cGVzLmgNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZXhl
Y19xdWV1ZV90eXBlcy5oDQo+ID4gQEAgLTE2Miw2ICsxNjIsMTEgQEAgc3RydWN0IHhlX2V4ZWNf
cXVldWUgew0KPiA+ICAJY29uc3Qgc3RydWN0IHhlX3Jpbmdfb3BzICpyaW5nX29wczsNCj4gPiAg
CS8qKiBAZW50aXR5OiBEUk0gc2NoZWQgZW50aXR5IGZvciB0aGlzIGV4ZWMgcXVldWUgKDEgdG8g
MSByZWxhdGlvbnNoaXApDQo+ICovDQo+ID4gIAlzdHJ1Y3QgZHJtX3NjaGVkX2VudGl0eSAqZW50
aXR5Ow0KPiA+ICsNCj4gPiArI2RlZmluZSBYRV9NQVhfSk9CX0NPVU5UX1BFUl9FWEVDX1FVRVVF
CTB4MTAwMA0KPiANCj4gSG1tLCBJJ20gdHJ5aW5nIHRvIHRoaW5rIG9mIGEgcmVhc29uYWJsZSBs
aW1pdC4gNEsgc2VlbXMgaGlnaC4gTWF5YmUgd2UNCj4gc2hvdWxkIGNoZWNrIHdpdGggdGhlIFVN
RHMgdG8gdW5kZXJzdGFuZCB0aGUgZGVlcGVzdCByZWFzb25hYmxlIHBpcGVsaW5lIG9mDQo+IGpv
YnMgdGhleSBidWlsZCDigJQgdG8gYXZvaWQgYmxvY2tpbmcgdGhlbSBoZXJlIHdoaWxlIHN0aWxs
IGxpbWl0aW5nIHRoZSBEb1MNCj4gc3VyZmFjZS4gTXkgaW5pdGlhbCB0aG91Z2h0IHRoYXQgNTEy
IG9yIDFrIHNob3VsZCBiZSBhIHJlYXNvbmFibGUgbGltaXQgZm9yIG5vdy4NCj4gQ2FuIGFsd2F5
cyBhZGp1c3QgZ29pbmcgZm9yd2FyZC4NCg0KWWVzLiBMZXQgbWUgY2hhbmdlIGl0IHRvIDFrLiBB
bmQgYWRqdXN0IGl0IGxhdGVyIGlmIG5lZWRlZC4NCg0KPiANCj4gPiArDQo+ID4gKwkvKiogQGpv
Yl9jbnQ6IG51bWJlciBvZiBkcm0gam9icyBpbiB0aGlzIGV4ZWMgcXVldWUgKi8NCj4gPiArCXUz
MiBqb2JfY250Ow0KPiANCj4gVGhpcyBuZWVkcyB0byBiZSBhdG9taWMuIHhlX3NjaGVkX2pvYl9k
ZXN0cm95IGNhbiBydW4gaW4gcGFyYWxsZWwgd2l0aCB0aGUNCj4gZXhlYyBJT0NUTC4NCg0KVGhh
bmtzLiBZZXMsIGl0IHNob3VsZCBiZSBhdG9taWMuDQoNClNodWljaGVuZw0KDQo+IA0KPiBFdmVy
eXRoaW5nIGVsc2UgbG9va3MgY29ycmVjdC4NCj4gDQo+IE1hdHQNCj4gDQo+ID4gIAkvKioNCj4g
PiAgCSAqIEB0bGJfZmx1c2hfc2Vxbm86IFRoZSBzZXFubyBvZiB0aGUgbGFzdCByZWJpbmQgdGxi
IGZsdXNoIHBlcmZvcm1lZA0KPiA+ICAJICogUHJvdGVjdGVkIGJ5IEB2bSdzIHJlc3YuIFVudXNl
ZCBpZiBAdm0gPT0gTlVMTC4NCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3NjaGVkX2pvYi5jDQo+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfc2NoZWRfam9iLmMNCj4g
PiBpbmRleCBkMjFiZjhmMjY5NjQuLjM3ZjU4YmU3Y2JjYyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfc2NoZWRfam9iLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfc2NoZWRfam9iLmMNCj4gPiBAQCAtMTQ2LDYgKzE0Niw3IEBAIHN0cnVjdCB4ZV9zY2hl
ZF9qb2IgKnhlX3NjaGVkX2pvYl9jcmVhdGUoc3RydWN0DQo+IHhlX2V4ZWNfcXVldWUgKnEsDQo+
ID4gIAlmb3IgKGkgPSAwOyBpIDwgd2lkdGg7ICsraSkNCj4gPiAgCQlqb2ItPnB0cnNbaV0uYmF0
Y2hfYWRkciA9IGJhdGNoX2FkZHJbaV07DQo+ID4NCj4gPiArCXEtPmpvYl9jbnQrKzsNCj4gPiAg
CXhlX3BtX3J1bnRpbWVfZ2V0X25vcmVzdW1lKGpvYl90b194ZShqb2IpKTsNCj4gPiAgCXRyYWNl
X3hlX3NjaGVkX2pvYl9jcmVhdGUoam9iKTsNCj4gPiAgCXJldHVybiBqb2I7DQo+ID4gQEAgLTE3
Nyw2ICsxNzgsNyBAQCB2b2lkIHhlX3NjaGVkX2pvYl9kZXN0cm95KHN0cnVjdCBrcmVmICpyZWYp
DQo+ID4gIAlkbWFfZmVuY2VfcHV0KGpvYi0+ZmVuY2UpOw0KPiA+ICAJZHJtX3NjaGVkX2pvYl9j
bGVhbnVwKCZqb2ItPmRybSk7DQo+ID4gIAlqb2JfZnJlZShqb2IpOw0KPiA+ICsJcS0+am9iX2Nu
dC0tOw0KPiA+ICAJeGVfZXhlY19xdWV1ZV9wdXQocSk7DQo+ID4gIAl4ZV9wbV9ydW50aW1lX3B1
dCh4ZSk7DQo+ID4gIH0NCj4gPiAtLQ0KPiA+IDIuNDkuMA0KPiA+DQo=
