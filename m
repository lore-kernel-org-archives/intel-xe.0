Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B41C87FCB
	for <intel-xe@archiver.kernel.org>; Wed, 30 Jul 2025 21:40:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DE810E6E0;
	Wed, 30 Jul 2025 21:40:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VtPCz9XI";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC8C410E387
 for <intel-xe@lists.freedesktop.org>; Wed, 30 Jul 2025 21:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1753911618; x=1785447618;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=UZfLekcsn4ntO1IYuHBs8IhSIFirFkE8q15pgoICQWI=;
 b=VtPCz9XId53WfaQCERBJp5LVm9fUFGNNKs/y1ah2Kcg4g+lbzBdo146x
 U+bSCuIqtp29mKWq1V5lii1LjsLEMd/nSqQZFB4LATOUJeSdX5pvcveWo
 qwTXOzuKZGDuU6g9bGMHHDiFkey3KLTT2l6IPgouDv+gH/0ga4iykQVvZ
 ngmzQblOR+jf8ud+UastLievDsjIigtAMwMWfcZWNUfxhAB9Yvhp3qZvk
 eIGkzMY8ui5II2TL3T9iBn3EP/wMKrKkfk+MPh1FO/u2tziUYpoWdXcZT
 8WEVgi4f5eL+5LIGL1jkBaoGs9Xj0xlSRxv9Eig58S8GblIkM90z/hoQX g==;
X-CSE-ConnectionGUID: ie/TPcHIRr+bO0/PwmFWIQ==
X-CSE-MsgGUID: L7Kht225RyymjRAUBWFB3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11507"; a="56374563"
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="56374563"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 14:40:17 -0700
X-CSE-ConnectionGUID: nGaqnRttRdKAXkes9cCkvQ==
X-CSE-MsgGUID: jU+ai2yVSf+GYvhFHjmo9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,353,1744095600"; d="scan'208";a="163537187"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2025 14:40:17 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 14:40:16 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Wed, 30 Jul 2025 14:40:16 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (40.107.220.47)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Wed, 30 Jul 2025 14:40:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cC4+AW4PFM353uMdyVgJKYu5YHIQ6dfTHTIMO71f8drgn/PDWFRwPH64E9vlAw2JhsUnmFFyaPFWGY9diM70ULzEo6+HoRt8x9lwpcSB8vCbX+ayeuGmB6QUwy4qVNJCvOjmE4oGU51CqSV5kdQIOKS/4RtswOY5FtHh186y7JEPwc1LVk+JP1IGdZlp2ZQ/eqvVjEdNVrYO0Zdmzc6dgtTXgWuBNsT0VftA/GffR+Uy5Y3e2kxBhk1z+bSf+fcX7Ji7qkH+vmVqxjnLvwFILCBIWltuuGPAV3uakyTJypDm4jRlxLm8sXgHou/fiL7Nc+CgDnhT3uEQsYhDG+wijQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZfLekcsn4ntO1IYuHBs8IhSIFirFkE8q15pgoICQWI=;
 b=vfHndi9tt9D+SYTBZcfKnxlnoicEPLhrqgImlXMIbjB5KBXqgnAvhyq5jwG5Xwl6e8AALqFHgdtRy65gPSUzF31SE+4BRetCZYbvg7RZ45ndYu4Z9Tol2Dnjk8SEZDU7pdrRt+9yoduMd0ZQ0iHpys0WrUCDypaBUJpeErfyUs6d0IYpkA7VGhVbR8wSYeU0wPDX765PT4sdrNmSmBeuQ7HsssCLqxmqwMyZKGVVUP72b4yeu6W/L7Ao6nb015E2Hn2ns6VcwpTUaAcHnQ1jwdI5AQDUtFYPjuwi4SvXqtU3UwnbH+FwtsTTIrKwC3rXhFzH2hy+ADAS0m80v8jmvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CH0PR11MB5444.namprd11.prod.outlook.com (2603:10b6:610:d3::13)
 by LV3PR11MB8726.namprd11.prod.outlook.com (2603:10b6:408:21a::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Wed, 30 Jul
 2025 21:40:14 +0000
Received: from CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace]) by CH0PR11MB5444.namprd11.prod.outlook.com
 ([fe80::5f89:ba81:ff70:bace%4]) with mapi id 15.20.8989.010; Wed, 30 Jul 2025
 21:40:14 +0000
From: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
To: "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Subject: RE: [PATCH 1/3] drm/xe/pf: Disable PF restart worker on device removal
Thread-Topic: [PATCH 1/3] drm/xe/pf: Disable PF restart worker on device
 removal
Thread-Index: AQHcAXpVrY6yb2di7Uy/3QqHj1LM8bRLARZAgAAvSgCAAAEToA==
Date: Wed, 30 Jul 2025 21:40:14 +0000
Message-ID: <CH0PR11MB54447679A02AE8747853C484E524A@CH0PR11MB5444.namprd11.prod.outlook.com>
References: <20250730174913.178434-1-michal.wajdeczko@intel.com>
 <20250730174913.178434-2-michal.wajdeczko@intel.com>
 <CH0PR11MB5444B1CE4DD9227B04115BDCE524A@CH0PR11MB5444.namprd11.prod.outlook.com>
 <ba302e3a-50e1-430f-b38d-651e588f2787@intel.com>
In-Reply-To: <ba302e3a-50e1-430f-b38d-651e588f2787@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH0PR11MB5444:EE_|LV3PR11MB8726:EE_
x-ms-office365-filtering-correlation-id: 19281554-1cd6-4de6-2a16-08ddcfb1ab1e
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|376014|366016|10070799003|1800799024|38070700018|7053199007; 
x-microsoft-antispam-message-info: =?utf-8?B?VzJaUTN5Y0t1cWlObDdxMGZXY3I4ZkJWeHFtOTNON2dhdWpDTjgrZWxhR2lk?=
 =?utf-8?B?ZXg5TlpqOElzV3JuWkFWZjZGWEJOcmpRNXcwZDc5UmNTaWQ2cDhUY1l3VGh4?=
 =?utf-8?B?YkdpV21Pb3ZjdzdKbmx1bGZma1hkbDNtN2YxUUJIOWM5dmVNUW54YmVrNFhy?=
 =?utf-8?B?M1lxNEZCYlRTVUsyanc3ZUJ4cmgybXZvajVnRXVMK2VBcW51V1NLZGtENXNE?=
 =?utf-8?B?VndMQ2E0eTJqZXBLYzNJY0x5UUN6RHVuQWgySWFXbitEd3p6TVBkdW5tdERi?=
 =?utf-8?B?dEdkK3NqOFJFNmJpVlZRM1NnOEtkVGdsSmhPUzdoV1VMVURkWjNibjZJNW1B?=
 =?utf-8?B?N0ZWaC92aUpoSndBYTdoZjdZR0hkVVJsa25tbWxPU3FZcFpzWVJkZk1jT1Mw?=
 =?utf-8?B?UTRYOW00L0RwTVFiQnZwZS9HL290M1hMbEtLV3hOdUQyMTlMeXFlRU1mUldS?=
 =?utf-8?B?cEtPc1NVVldFWHp5NVJEYzJOZG1BallhZGgybTFwV3JaMVoxSHhnVmhNZllG?=
 =?utf-8?B?SkdHc0ZBUzNHNSsxaStsd09sY2F0Y3IrUjc2bHhkcStJd3BtN3ZZbWovS0NN?=
 =?utf-8?B?cGRQcERDaTJoTnNUemVuTkZUdENGMXZqZlcxYmtSRDhPMGcya3Z5OE80VVJL?=
 =?utf-8?B?b2h3U2NVM2c3SkJSZ1hiazlFYnluMTF2WVpiOHdKdHJUSThjVk5SZ2Jhci85?=
 =?utf-8?B?VW5lUmxoZy95Tm1Hc2Qxb0hOakpMQjZVRS9SL3dYRGN0eFdxbklNNElJMjJQ?=
 =?utf-8?B?ejdEMHhTZjdXbzFNUGdQbzZoUUFWS3FqYWtVeXRVREhrY2pnN2doOXpBMzRo?=
 =?utf-8?B?YlpQL3Z3SG5KNmlIME1DR0JhWU1mS2Y1aDJOR0w1Z1AvMFlMOXd1aE02Um9Z?=
 =?utf-8?B?elMraG1FWnZOVVljbUc2MW1OTzI1WUZuQS9aTHpHcmtLY3graEw1TlVYT0lR?=
 =?utf-8?B?VS9XYjZ2OXVrc1k2TnBuZFljdUMyMDZmS1BZZzlJdjQxSU5xck9iYlY1NHNQ?=
 =?utf-8?B?SHNtRzBnRVVSSmJaRGN0K1lXR1lsMWtwVWZ2cFluaS83emttbHRzRkxUQ2J5?=
 =?utf-8?B?K3Nhb2MvMTYzUHFmWVdhSHRxZmk0WCtsa2Y5bVBFQlhkT3hQR0Fsb3ZFbDgz?=
 =?utf-8?B?cFI2cUp3a0lSMGZYWFZ0N3RsT0VEWlR5MHZCV000N1NVd0h3MnRtQ0tRa2dC?=
 =?utf-8?B?S0N1NDRnTSt6TXFNOGQrK2QvVThXa2ZBemRxSGJ3bW1PUm1OcG9La0xxbXJt?=
 =?utf-8?B?RDFyVVdYVXdjUXlqWjJNKzlIK0pNTzBkMWFYZUh2SkVpSXNQMWVwNTM2R3dX?=
 =?utf-8?B?eTBrLzlZWXkwVWhtQWJHYkNhU2RuZXBhclRKTk1jNnV2NnIzcnQrWTBTR0tN?=
 =?utf-8?B?MWVaNlhuSlNMOHBRUWJtM3ZJMm8yUTJVdUJTaENmbk8yVFpKWTlMZmhyRjYv?=
 =?utf-8?B?S0JvekJaMUhkV21ZS3VkSFN4N2tHYlpKeVhJa2VDTFFmZlJRQVI2Skd6aDYr?=
 =?utf-8?B?K0dBNXViZEdTREV4cm9jek9oUHI5R0lxVFQ3dDQ4TDZiSGhCWCtuakFQenNP?=
 =?utf-8?B?SVlEaVliTjZaQzhicWliaWJ6UjBEZXo4Ti84M0IxcVVNTE5nblE2cm9UQTR3?=
 =?utf-8?B?RFEwTzA2ZlJnSWFEaFpkR3RPRmJBOGFxSzFqQi9QbFZCZ3pranFac3hheDhm?=
 =?utf-8?B?aDcrd25aMG9ENDBLb2pQaWFuc2VQZW93TGRLK2FxNytoUWJkaWlWSEUwM0Ez?=
 =?utf-8?B?b05zK2xSSFJqYTlyemVUc0lCTVBFWUswQUV4MmQrRis0VTFJT20rcnRKeEcy?=
 =?utf-8?B?TDRmK2U5Mm5xSnhSeHN5MUtJTGFIckZCNU5NWWR3RGRFdEVUN214QjdYaCtx?=
 =?utf-8?B?MERqTGc3WEVlNS9VUHlab1FhN2I2Z290TEp6NENrVTVOdlgyQW9kMG1Tem4z?=
 =?utf-8?B?ZGJwVE1LZXJWWlZRZFNFQ1V5cEhObjNudDh1SzI4ckw3RzNPRGhNcndaWnAv?=
 =?utf-8?B?M3ZQQXNidDh3PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR11MB5444.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(10070799003)(1800799024)(38070700018)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWtwK3JiVy9SQW54bWJHLzR0WWx5OFJGMFBwSzBkaDk2bWttSUFMT0JleUVD?=
 =?utf-8?B?cWpiQU1LNGlGQmNFNDRIaTdpQWNiaDJqazV5aDdHUVk5aUJhSjdsaTlVaWsv?=
 =?utf-8?B?OUpoMUFxb2FBcmx1ckZqQVNNeHkxZlpzYjFxTDVJUVJ6Z0lnajNQeXo2ekw5?=
 =?utf-8?B?ZW8rSXVyVFplWk8vUk5UNjJlNGZMalNnSFI4aFhaNmJsSFVRNUcrK0RvTTRF?=
 =?utf-8?B?ZmxORVgrajVQclk3Z2tJczk1Y0lrUU5QeUxyRC9UMjRZTWNVWHFhQTJwZUs5?=
 =?utf-8?B?NTU4K3Y1V053aGxQL2tETW5MMy9TZEhmaXc2RENPdjI5VTgrdk8vQmE1akV6?=
 =?utf-8?B?MEEyN1FNT2FnRDJHbHdRRSs1eXh5cUtPTXpLS2prTFJQNUFnZFNUM3ZCRjFY?=
 =?utf-8?B?cnlPSWRuZkcrSlZrZnRSbXJzaDVtOVVsY2RNY0dXT1pZZmh0TWVIUktlM2VL?=
 =?utf-8?B?OTRCdlo3bFdQMlpodmU5dTE3WXk1TXNyb294d1dQalc3bHd0V3BlQ3hRL0Zx?=
 =?utf-8?B?dmdsUXpmRjFEcG5BNU9rTlpGRzVkWklPL2xudXBSZk5sQVA1Wm53d05ZZk5L?=
 =?utf-8?B?bWJhV1F3UmhxaHBUMVMyZ0hnKy9HME1rU3ptMFdKak9kWFhNWGtIc1k0MXhR?=
 =?utf-8?B?TEJVcDc4ang2bkpZSXBmUWFleHdJWmlGdWlKZlNEMG1zYmlQWE05RVNyaHly?=
 =?utf-8?B?eWhTVDlYc2diT3k3NlNLSWtuQXVOWEYyK3Y4Z1d1ZzY4UjVZdXUwUStvLzVW?=
 =?utf-8?B?WjR1YS9PQ2xzRW9HVmNTUWVFR3p5em5mY1JrN0U1Y2Rod3lWN2tkVjYxQXEy?=
 =?utf-8?B?V2VPenZXMFJsRk0vWlNXNDdQSG1GV3g0MXhsRW9JNzVldkRjdDhzN0hYd2tm?=
 =?utf-8?B?UHM5aXdzakJQbEtER2RwUmUzRzJsZWN2UGJSWmVPVGlHUmpMMGlqRUcramZw?=
 =?utf-8?B?SkZ2RTNGWUtOQ0hHRTExTG8yQWVidkczSDR4bkNwdkdjdnpKSUFscytoNUZu?=
 =?utf-8?B?ZDZyUzdDOFl2Z1NFMnREbHQySkRXcGVqeGdCcGZhSFk5bjVHZGpQQlBGS1BE?=
 =?utf-8?B?ajlIQjRNd2lNdVZXdEtKWUljUDBqT0MzSlcxZ09mYVlEYnVncEwranVjdkE3?=
 =?utf-8?B?cy9mK1NWYng1d1F6MTY5VnFiNVNVaHhueURlbHJMMDJzbTYwTW5hejhURXQz?=
 =?utf-8?B?SDVOU3JVRmRreU9VQ1Q3N2FoZXZHeGpOK2tjRnNnQjlxbzBheU81VmJhSkl6?=
 =?utf-8?B?MUQ1aGZQbHFnUnRMVnAyazliUXJ4SU45OGMyUWtRcUpCTnpBMTN3THFJOFNF?=
 =?utf-8?B?aTBWVTNzQUJ2Z2hUdk1XV0IrK2NVbWNFZ0lQbG9BZjB3bFpDRE8za1VBSFI2?=
 =?utf-8?B?b3NOZ1dZZ3hZUnVDT2pRMHd5NE42SkIyQ3lmK0k0M1hRMWpFeTRxYVEwbHF1?=
 =?utf-8?B?d3F2d1BETEdSR0xsZGpTbVVSN3NXU3hJWkNwVTFYL3RNVHU1anY2ZXhoczlP?=
 =?utf-8?B?K0p6YjdLajh3azdPQXBtNXk2ODFpdDFrTmsvZEVrNzJ3MS90WHI1V0h0aU9m?=
 =?utf-8?B?THdydnFEKzkyRzN5NzV4VTRXaXBJekoxNDlzWmdEbS9XYzhEbnR6R3htWnVH?=
 =?utf-8?B?QjBTemo0OGRzb1E3STl6UEFRYXNGdW5DQ2R5NnYvM3hMV1dEcG9YcVAvTEg2?=
 =?utf-8?B?ckMyY3l1dVRQWDByOFhSUWVhSytqMktWRmVuN1RSem9IWk4wTVVnSnhhZnNF?=
 =?utf-8?B?ZnRCR1FNZ3lBbm1NMzFhK3J0L2VIdXNqUjZmd2MzZTBXV3dvdnRaVDVQVCtn?=
 =?utf-8?B?dmVmSGN2YVhia1k2alA0RW41UkJuYWpSdnVLOHVEQytIb3FaYW1zckZIL2RQ?=
 =?utf-8?B?eGJtTXROWk1ONXdOVUJoOWVWL211cXpmNUo3TEF6dGw2NGxndDdiNjhKWGNx?=
 =?utf-8?B?emJRWXVnaGdseU1zV3N4N29FeEdUaGx3NnlYaTNyTGtOek5pOENqK2wrYmhP?=
 =?utf-8?B?NXRXSG9DTVhEcTV3a09CNEpvcDl3Z2dncEVHTFdNSURES2Z0akpNTUhIQmlr?=
 =?utf-8?B?S1hRVHFBOWxWeHlGN3ZWeS9BVzVQWlcrZkIrUi9xVGc2MEpjSXVmUEtrMEEw?=
 =?utf-8?B?NUg1Z1J0Uk1seW1XSlBFN0UrT3JSaHkyZTVMUk9ndnVuc1IxdTFYKzJoSVd3?=
 =?utf-8?Q?PG6APDy3QBNqQply4osne6tMMcKbbrWsrTosFDxNYHEf?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH0PR11MB5444.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19281554-1cd6-4de6-2a16-08ddcfb1ab1e
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Jul 2025 21:40:14.3012 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VQXhNUQWQy86scznaMTu5c6HvALjM1vKaERoVsfFQOGYa51a3XYQCnxmfiP78ZT+tQf1/sY0DGYz2YH9xkMdlhHGsKSgMtuLQQcLTbYBIuY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR11MB8726
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

LS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCkZyb206IFdhamRlY3prbywgTWljaGFsIDxNaWNo
YWwuV2FqZGVjemtvQGludGVsLmNvbT4gDQpTZW50OiBXZWRuZXNkYXksIEp1bHkgMzAsIDIwMjUg
MjozNCBQTQ0KVG86IENhdml0dCwgSm9uYXRoYW4gPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5jb20+
OyBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNClN1YmplY3Q6IFJlOiBbUEFUQ0ggMS8z
XSBkcm0veGUvcGY6IERpc2FibGUgUEYgcmVzdGFydCB3b3JrZXIgb24gZGV2aWNlIHJlbW92YWwN
Cj4gDQo+IE9uIDcvMzAvMjAyNSAxMTowOCBQTSwgQ2F2aXR0LCBKb25hdGhhbiB3cm90ZToNCj4g
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiA+IEZyb206IEludGVsLXhlIDxpbnRlbC14
ZS1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIE1pY2hhbCBXYWpk
ZWN6a28NCj4gPiBTZW50OiBXZWRuZXNkYXksIEp1bHkgMzAsIDIwMjUgMTA6NDkgQU0NCj4gPiBU
bzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+ID4gQ2M6IFdhamRlY3prbywgTWlj
aGFsIDxNaWNoYWwuV2FqZGVjemtvQGludGVsLmNvbT4NCj4gPiBTdWJqZWN0OiBbUEFUQ0ggMS8z
XSBkcm0veGUvcGY6IERpc2FibGUgUEYgcmVzdGFydCB3b3JrZXIgb24gZGV2aWNlIHJlbW92YWwN
Cj4gPj4NCj4gPj4gV2UgY2FuJ3QgbGV0IHJlc3RhcnQgd29ya2VyIHJ1biBvbmNlIGRldmljZSBp
cyByZW1vdmVkLCBzaW5jZSBvdGhlcg0KPiA+PiBkYXRhIHRoYXQgaXQgbWlnaHQgd2FudCB0byBh
Y2Nlc3MgY291bGQgYmUgYWxyZWFkeSByZWxlYXNlZC4NCj4gPj4gRXhwbGljaXRseSBkaXNhYmxl
IHdvcmtlciBhcyBwYXJ0IG9mIGRldmljZSBjbGVhbnVwIGFjdGlvbi4NCj4gPj4NCj4gPj4gRml4
ZXM6IGE0ZDFjNWQwYjk5YiAoImRybS94ZS9wZjogTW92ZSBWRnMgcmVwcm92aXNpb25pbmcgdG8g
d29ya2VyIikNCj4gPj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdhamRlY3prbyA8bWljaGFsLndh
amRlY3prb0BpbnRlbC5jb20+DQo+ID4+IC0tLQ0KPiA+PiAgZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2d0X3NyaW92X3BmLmMgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKysrKysrLQ0KPiA+PiAg
MSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkNCj4gPj4NCj4g
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zcmlvdl9wZi5jIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2d0X3NyaW92X3BmLmMNCj4gPj4gaW5kZXggMzU0ODlmYTgxODI1
Li4yNzYxMzE5ZmRjMjYgMTAwNjQ0DQo+ID4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9n
dF9zcmlvdl9wZi5jDQo+ID4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9ndF9zcmlvdl9w
Zi5jDQo+ID4+IEBAIC01MCw2ICs1MCwxMSBAQCBzdGF0aWMgdm9pZCBwZl9pbml0X3dvcmtlcnMo
c3RydWN0IHhlX2d0ICpndCkNCj4gPj4gIAlJTklUX1dPUksoJmd0LT5zcmlvdi5wZi53b3JrZXJz
LnJlc3RhcnQsIHBmX3dvcmtlcl9yZXN0YXJ0X2Z1bmMpOw0KPiA+PiAgfQ0KPiA+PiAgDQo+ID4+
ICtzdGF0aWMgdm9pZCBwZl9maW5pX3dvcmtlcnMoc3RydWN0IHhlX2d0ICpndCkNCj4gPj4gK3sN
Cj4gPj4gKwlkaXNhYmxlX3dvcmtfc3luYygmZ3QtPnNyaW92LnBmLndvcmtlcnMucmVzdGFydCk7
DQo+ID4+ICt9DQo+ID4+ICsNCj4gPj4gIC8qKg0KPiA+PiAgICogeGVfZ3Rfc3Jpb3ZfcGZfaW5p
dF9lYXJseSAtIFByZXBhcmUgU1ItSU9WIFBGIGRhdGEgc3RydWN0dXJlcyBvbiBQRi4NCj4gPj4g
ICAqIEBndDogdGhlICZ4ZV9ndCB0byBpbml0aWFsaXplDQo+ID4+IEBAIC03OSw2ICs4NCwyMSBA
QCBpbnQgeGVfZ3Rfc3Jpb3ZfcGZfaW5pdF9lYXJseShzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiA+PiAg
CXJldHVybiAwOw0KPiA+PiAgfQ0KPiA+PiAgDQo+ID4+ICtzdGF0aWMgdm9pZCBwZl9maW5pX2Fj
dGlvbih2b2lkICphcmcpDQo+ID4+ICt7DQo+ID4+ICsJc3RydWN0IHhlX2d0ICpndCA9IGFyZzsN
Cj4gPj4gKw0KPiA+PiArCXBmX2Zpbmlfd29ya2VycyhndCk7DQo+ID4+ICt9DQo+ID4+ICsNCj4g
Pj4gK3N0YXRpYyBpbnQgcGZfaW5pdF9sYXRlKHN0cnVjdCB4ZV9ndCAqZ3QpDQo+ID4+ICt7DQo+
ID4+ICsJc3RydWN0IHhlX2RldmljZSAqeGUgPSBndF90b194ZShndCk7DQo+ID4+ICsNCj4gPj4g
Kwl4ZV9ndF9hc3NlcnQoZ3QsIElTX1NSSU9WX1BGKHhlKSk7DQo+ID4+ICsJcmV0dXJuIGRldm1f
YWRkX2FjdGlvbl9vcl9yZXNldCh4ZS0+ZHJtLmRldiwgcGZfZmluaV9hY3Rpb24sIGd0KTsNCj4g
Pj4gK30NCj4gPj4gKw0KPiA+PiAgLyoqDQo+ID4+ICAgKiB4ZV9ndF9zcmlvdl9wZl9pbml0IC0g
UHJlcGFyZSBTUi1JT1YgUEYgZGF0YSBzdHJ1Y3R1cmVzIG9uIFBGLg0KPiA+PiAgICogQGd0OiB0
aGUgJnhlX2d0IHRvIGluaXRpYWxpemUNCj4gPj4gQEAgLTk1LDcgKzExNSwxNSBAQCBpbnQgeGVf
Z3Rfc3Jpb3ZfcGZfaW5pdChzdHJ1Y3QgeGVfZ3QgKmd0KQ0KPiA+PiAgCWlmIChlcnIpDQo+ID4+
ICAJCXJldHVybiBlcnI7DQo+ID4+ICANCj4gDQo+IFsxXQ0KPiANCj4gPj4gLQlyZXR1cm4geGVf
Z3Rfc3Jpb3ZfcGZfbWlncmF0aW9uX2luaXQoZ3QpOw0KPiA+PiArCWVyciA9IHhlX2d0X3NyaW92
X3BmX21pZ3JhdGlvbl9pbml0KGd0KTsNCj4gPj4gKwlpZiAoZXJyKQ0KPiA+PiArCQlyZXR1cm4g
ZXJyOw0KPiANCj4gWzJdDQo+IA0KPiA+PiArDQo+ID4+ICsJZXJyID0gcGZfaW5pdF9sYXRlKGd0
KTsNCj4gPj4gKwlpZiAoZXJyKQ0KPiA+PiArCQlyZXR1cm4gZXJyOw0KPiA+IA0KPiA+IEV2ZXJ5
dGhpbmcgZWxzZSBsb29rcyBva2F5LCBidXQgSSBkb24ndCB0aGluayB0aGlzIGNvbmRpdGlvbmFs
IGJyYW5jaCBpcyBuZWNlc3NhcnkuDQo+ID4gSSB0aGluayB3ZSBjYW4ganVzdCByZXR1cm4gZXJy
IGhlcmUgdW5jb25kaXRpb25hbGx5LCBhcyBpZiB3ZSBmYWlsIHRoaXMgYnJhbmNoLCBlcnINCj4g
PiB3b3VsZCBlcXVhbCB6ZXJvIGFueXdheSwgd2hpY2ggaXMgd2hhdCB3ZSdkIHdhbnQgdG8gcmV0
dXJuLg0KPiANCj4gdGhpcyB3YXMgZG9uZSBvbiBwdXJwb3NlDQo+IA0KPiBJJ20gcHJldHR5IHN1
cmUgbW9kZXJuIGNvbXBpbGVycyBjYW4gb3B0aW1pemUgdGhhdCBhbmQNCj4gSU1PIGl0IGlzIGNs
ZWFyZXIgdG8gbGVhdmUgc3VjY2VzcyBwYXRoIGZ1bGx5IHZpc2libGUNCj4gDQo+IGVzcGVjaWFs
bHkgdGhhdCBpbiB0aGUgZnV0dXJlIHdlIG1pZ2h0IHdhbnQgdG8gYWRkIG1vcmUgc3RlcHMNCj4g
dG8gdGhpcyBpbml0KCkgZnVuY3Rpb24sIHNvIHdlIGNvdWxkIGhhdmUgc21hbGxlciBkaWZmIGFu
ZA0KPiBhdm9pZCBkaWZmcyBsaWtlIFsxLTJdIGFib3ZlDQoNCipzaHJ1Z3MqDQoNCkkgZG9uJ3Qg
ZW50aXJlbHkgYWdyZWUsIGJ1dCBJJ20gbm90IGdvaW5nIHRvIGNhdXNlIGEgcHJvYmxlbSBhYm91
dCBpdCwNCnNvIHlvdSBjYW4gdGFrZSB0aGUgUmV2aWV3ZWQtYnkgd2l0aG91dCBhbnkgY2hhbmdl
cy4NCg0KLUpvbmF0aGFuIENhdml0dA0KPiANCj4gPiANCj4gPiBXaXRoIHRoYXQgY2hhbmdlOg0K
PiA+IFJldmlld2VkLWJ5OiBKb25hdGhhbiBDYXZpdHQgPGpvbmF0aGFuLmNhdml0dEBpbnRlbC5j
b20+DQo+ID4gLUpvbmF0aGFuIENhdml0dA0KPiA+IA0KPiA+PiArDQo+ID4+ICsJcmV0dXJuIDA7
DQo+ID4+ICB9DQo+ID4+ICANCj4gPj4gIHN0YXRpYyBib29sIHBmX25lZWRzX2VuYWJsZV9nZ3R0
X2d1ZXN0X3VwZGF0ZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4gPj4gLS0gDQo+ID4+IDIuNDcu
MQ0KPiA+Pg0KPiA+Pg0KPiANCj4gDQo=
