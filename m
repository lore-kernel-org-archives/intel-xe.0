Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF92C56204
	for <intel-xe@archiver.kernel.org>; Fri, 20 Feb 2026 14:52:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78F2510E361;
	Fri, 20 Feb 2026 14:52:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eBG9Qgbi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C80910E361
 for <intel-xe@lists.freedesktop.org>; Fri, 20 Feb 2026 14:52:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771599169; x=1803135169;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=avd2vvV4nPixI4XaOprrsPBXYpzex8QxLzNaBdLYpno=;
 b=eBG9QgbigHxW1ok0zOZLnPd60lzhOFkgSeCubYJ/4QLj4rbNyy8yZr0Y
 peZd5KHpLdKfi0P9JgEJlBSGCAJfzYgSzuwOvcATdZiHVHX7z4UyIGs6o
 BJkSO9vHALha/Ni3CPRlp3IDoBn0UHJoHTonWwve+cJxByPKQAVw24mRp
 QoaR1uoLkC1oB8ydJOqDb7BNlfw6Ad2ygCoWi9CpvHOwuigxLcgkgYPiB
 jyVAXKw8wbDkupvwRJ4jWmYCzeuj/NWayk/l4byfeq+rEmmLjhJ/7UJPz
 BId+F3uxVqMMdWu4wVUlMXgVtwKHOWj7YMBODF4pLIX6fbNkkw/ervpAu w==;
X-CSE-ConnectionGUID: Mcbm3diJRHC1n4SygWDvJw==
X-CSE-MsgGUID: B7vJZW08S+uGdH7rYZXoww==
X-IronPort-AV: E=McAfee;i="6800,10657,11707"; a="60265830"
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="60265830"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:52:48 -0800
X-CSE-ConnectionGUID: HxzaBVfJTYKTW2fRymiZ4g==
X-CSE-MsgGUID: z+ofmRiERxGmyatop90Tjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,302,1763452800"; d="scan'208";a="252555252"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2026 06:52:48 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 06:52:47 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 20 Feb 2026 06:52:47 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 20 Feb 2026 06:52:47 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWiCUDdVziHwikakvBRsvFDPTC7ci16YNo20UNVOTmJcCvVaOyp2T9y/IeOX5LFcbaqIDYVYqvBtRrVO4grycbP0WRtbsgO609x04aeRRWO2t6DfUmfNbpJQ5aX33BuFwrJly27UbrwTtswQClXk56BkodntclbGoVtrlxGFpTV/r1djBO3HH69E+B5MxiWhoWlfFmRO3BZui0yauPA79BDuS10GE03C/cHp2ZqA18/xY1xRvOk0PdUxaiKlIT6TMoWT/ZQJdYnpwYsW+6902tr9gHN2J3X1PzVcJmPLPdAeSaenE7K9a8sB/kP+oVm2+BgsnEHhUkqFFRb4AmNaxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=avd2vvV4nPixI4XaOprrsPBXYpzex8QxLzNaBdLYpno=;
 b=EEFU3wFBwNXR6QLc22EKMwVz6QPjrfAkdZ4LlKrGCrGfESuBM3oOtAMS71G4Jwiihu16ybHdXJO+k03fBd7pAS1FYQNfWWBJNqXYOV1yNlOHSEvgENW4hSMork4ZIgnUPRtCAwOFnm7I5uvIUexxvf0IpwFcn8LwLg89Ht92Jufc26PgRD6KXSbBF6Guzd4QFJoUKViOgawPPIv8VLybsQ/Ofma/K6dKugQh9kkCCtXDIV4mqr3PF0hikPlb39pFomtFF+IfoUgMGnS5uRaiqJ1DUBtU9r+WcvcE0J9g0flEtydMs419F8aTezpeLyQkUPYmFSblTK889ZmSLofW6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SJ5PPF867D7FF5E.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::83d) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.17; Fri, 20 Feb
 2026 14:52:44 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::1d86:a34:519a:3b0d%5]) with mapi id 15.20.9632.010; Fri, 20 Feb 2026
 14:52:44 +0000
From: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Tauro, Riana"
 <riana.tauro@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Jadav, Raag" <raag.jadav@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Brost, 
 Matthew" <matthew.brost@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Auld, Matthew" <matthew.auld@intel.com>
Subject: Re: [RFC PATCH 6/6] [DO NOT REVIEW]]drm/xe/cri: Add sysfs interface
 for bad gpu vram pages
Thread-Topic: [RFC PATCH 6/6] [DO NOT REVIEW]]drm/xe/cri: Add sysfs interface
 for bad gpu vram pages
Thread-Index: AQHcoG7HjJlJeeppAkGBmEbQ3qEU7bWLdFwAgAA75wA=
Date: Fri, 20 Feb 2026 14:52:44 +0000
Message-ID: <943a10ec67eb0de1d050bb90eda30f0826587b1b.camel@intel.com>
References: <20260213092552.1527799-8-tejas.upadhyay@intel.com>
 <20260213092552.1527799-14-tejas.upadhyay@intel.com>
 <aZUJy5baVacPxGM9@intel.com>
 <0ba5c665-e37b-41b5-9692-9f02f30682de@linux.intel.com>
In-Reply-To: <0ba5c665-e37b-41b5-9692-9f02f30682de@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CYYPR11MB8430:EE_|SJ5PPF867D7FF5E:EE_
x-ms-office365-filtering-correlation-id: ee6d3513-03f2-463f-20cf-08de708fb463
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?bnJuUVNpWmRrdnluVVY4ak9QR2w2ck13L3p4V05nK2NHY0R3VFJuTVBsV2Fq?=
 =?utf-8?B?TU8wYWQ2V1VvK1llMzlSd0hHcFU3cFRVWi9LMUNaejZIb1dReXlVd2FySzdl?=
 =?utf-8?B?ZGREOXF2eGorMDMwaVRoY1I5M21oZ1dHQzJBY00vMDc1eVRNYjB2eWt3Mk81?=
 =?utf-8?B?V2VkTm45WjJiUDNCT3NONkVEUXg5UDRPcDA0NGdMeFl3RmU4N3hRNXY5Zk0z?=
 =?utf-8?B?S21vMmlLOXdjQzRyaG0rS0t1N3JHa0Z1cDdPemowWFhsWlhSd1VXbkk4bFJm?=
 =?utf-8?B?NVlSY3l4eFBqTkFVY0FHNjJVeTRKQzhFNTFqOEJLcHdYaHZBVGZzUmJLQXE1?=
 =?utf-8?B?NFJLWDRjZTRKbkZzb3BtUmZhcjkvVTh4cEMvYzdxUjQraHhLdGpGVUNmbmtM?=
 =?utf-8?B?elNqOHZEMVZuYlJuS25GZFVzZGxuRkdDRW1mUkptQ3ZHSWcxUUovYlNaNTBn?=
 =?utf-8?B?MEFQejFFVlhaN29lQW54d25pNHlvRkluNUJ1dm9RL21oWGVXRVZ4NjlXUUFh?=
 =?utf-8?B?bFJrRWFqbHZTb0M3andqazEzbjhISUJQajNFTS90bk5OMTFTOXpPZnE5cDZ1?=
 =?utf-8?B?bnJlV3l6NHdDRmZLbktJVk9kWlZObi9mTGVGZlBCeXJwSkhROFZZTS8zT2s0?=
 =?utf-8?B?SWFOUUJsMUljVnNXYzhoYU1YYzF4aTY1bTcrOW5HMGJ5L2o5LzJ1TXZHTS9r?=
 =?utf-8?B?ZkNMUWVyUml2ZmFQVEJ5Nm1TRDhxdjdyTm5uM0hjeFQ3cmtITWRQVFM4a285?=
 =?utf-8?B?dkVxcGNVR0dCOS82dGxKVzdwK1BlSnpxNlNWRjV5SUd4VlU5M2V3WVoyamhq?=
 =?utf-8?B?QUIyTjg3MEtaMFVTVlZ4R0w5SHZWVHo4YUtsRmZnbkR0RlpvaFoyZkVwSUJB?=
 =?utf-8?B?RHNLSWV4L1QvRTFBMXErZmhkaktiV0JCN1VacUxDdmR2bVB3ZHh0QlUvenFm?=
 =?utf-8?B?SUpJMlJueHJHcFo2dEtRWXh6SzFKK1BlTjQzL2oza3g2OWVyNUZOOWdSTjIr?=
 =?utf-8?B?azBQMmhjb2xJd3JhNVpDU2MrQmFSK3ZLVHhyNEo0aFQvK2h6RGhLRWpaMUZk?=
 =?utf-8?B?WHRXSkVVR2Z3WTJqWmpjVVJpbElSV3VYT2lWN3dmZXM4T2M1V1dpT1Rqc3ZG?=
 =?utf-8?B?T2prQ0lzZkFEL0E4Qld3YjFUTWdyNTlCRkw0Y0g4dDVEaWw5UkJrckJMaUlw?=
 =?utf-8?B?OTl5NFNSelA2YjIzb0pJKzFNY2c0WDZOSGFmYUhFcHM2Nms3eXZ0bEFRUFNU?=
 =?utf-8?B?b2xxZ0N0U0JtayszdGl0QmhyaU1DQnY4UWdVdVNpNTJoeUNyY2FtRnorU1J0?=
 =?utf-8?B?ZVFITm9TbXd4Z0N5d09OTGdaWERCdkN1VkRzWVRBNEI0dkl4TG1oSFhUVVBL?=
 =?utf-8?B?MGJoLzZaL1VNMlRwOEFBa1pSeENxbUdyVmx3V0ZnTlp6Q2dFUytkZzlzdXFh?=
 =?utf-8?B?bG54bzBEd2Y2QWltZi9wc1drbGJSeWRxa3dUM3Bpc0N6VmdMSWNma0tUb3M3?=
 =?utf-8?B?Mm9WbkJqc0dCYVIwdk8rQUJpbjFwaDVLVE1QM2pUQ1hmSzRERSszZ2ptQy9v?=
 =?utf-8?B?cDl1ajhLbys1V0p0ZWxhUDcrNHhHR3JuMTFLdHk2M1IxeDd0WVVYcHcwbzFK?=
 =?utf-8?B?RjdrUGFQWXB2bDlJaCtRNUZLS1M1c0VaOHpKd3hNMndWRVdTKzYrV0dKQnVT?=
 =?utf-8?B?SCtRUnk3OXpTbSszS2RYaHhrZmNuTWt1c2s3amNMdENUNWJkNVpUZ1BsV2Nk?=
 =?utf-8?B?SFVHc1JaWXpsRVpzR1ZYcjVuNmcxTmxxdFZjWWpCY2hkSG1ObFRzSGo1L2Vm?=
 =?utf-8?B?Q0RMV1IwNUFuWlM3WlIwRXpQK0Zzckd2QjBkcEp6T3dGTkpjYURsTnF5aWdr?=
 =?utf-8?B?WklNWGVBcUhOZzF5bEpzcGNtcDhaRWdDS0R5YXhTR0RBUjQxUmRaRW5LSkFq?=
 =?utf-8?B?QVE0WUl1MXdvK2R3bFdDZHBnZTJ4ajU0Z0l1WFBWYTc2aG5YZXl2aUlhVkhZ?=
 =?utf-8?B?eEFYZ0lPN01UZGVLUEdEVGtkWEltbUp2bXFPcDFtNzgvMG9TWnZZK2NHZ29Z?=
 =?utf-8?B?VnNrcXEzQ3VIZnZLMFFKSWdYU2R1MUlpeE4rS3UraG9LN3FJOEFKU25CSGhy?=
 =?utf-8?B?YVV6THNzbGRLZnVEeXd1dDUxM0hjOWk2NzNJd1JWekdmSHcvb0c1ZHl0UlZP?=
 =?utf-8?Q?rC1pi1SzYjFkaqxDMDHRop4=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dXFHL0xweFgwYVFITmIrMkEyaytFWThnSUhqNjk0Sm50b0ViNGVQSVcrYW9J?=
 =?utf-8?B?Q0ZMa3N4aTVDekJPWkZxVDBzM0NFZWs0bnRtbHpUK2ZUZ09pV00wYzVzRmph?=
 =?utf-8?B?aGVBQ2V3NG9tVVF5NURmVGMvVnNTb0VSZ0cwU1c0UkZVUnJkbk9LUXdyVzd2?=
 =?utf-8?B?RWNyaGpTOU0yQzN0SnJIZnY3bUd4M1MzSklZRVN0ZERYdTNrZFpvT2kzamJ4?=
 =?utf-8?B?YlRIMmc4NmhWQ2x1TnFoMDArbnd6d2RlNkFWbzV4dk9KellzZ0w3MXJycm1q?=
 =?utf-8?B?UmxhbUV6c3RNWHNHWndPeFNoTHRxa0QzNmh1THBrVnRxcFo4eUFkenZEOGRB?=
 =?utf-8?B?TE1tTWRtZFlaYisrR01pazN5OWoxWmNNQURQR2QyU1NSQjdUbGF0YzBVajZu?=
 =?utf-8?B?NjlHTkIvSm5FaHhuek5rdm1UOGFxYnErWW00eEdOQitreUlGdllGMFQrT3c2?=
 =?utf-8?B?aXZ6c0RQSHF6Tm9IeTVmOWtuQ2dicVNVVU1JUmpqVW5ueis2S2VUSCs2cnZF?=
 =?utf-8?B?SUFOK05vU0xzK1NXKzNyYUNXYklTS0xHYWVRaEdWYnMwRWhTTC9WTGxNbkFx?=
 =?utf-8?B?NC9TVnVyRHRybStwTnhpYUd6WnMwNFM4b0dMeDRpL1ZjTFVDK1IvV2JZMXhY?=
 =?utf-8?B?dyt4OWM3cDh1K3h6cGhlNWdJV1BEdUxCYlhwTHFyVnhlQXJsZGFkeHpCWVRL?=
 =?utf-8?B?WFdoWWZQanJHZGE4ZnB4VkQ5L2lQN2l6bllZQ29NTzdlcGVoSzBYUmc4WnFF?=
 =?utf-8?B?NzZqVElvSCtxK1lMbG1XVU5BUWtiYTJ5NDJWdzViU0xtc1FzbzdQSVd2ZWov?=
 =?utf-8?B?TzdwUWtqTk5kc294TXBLWWZXT09WTWM0NmN6aVFpYko1MWt4bGVGMmlzbkFZ?=
 =?utf-8?B?K3l2dG5IUjVwRi9TNXR5TEZXamFNMjdIWkpMbXprZnprZkd1OEZSbWJkb2NJ?=
 =?utf-8?B?c2EzeHBHZG5rWWVYWHFZWjlyRVRnSmR3ci9heUorajVMTVhTcVNuQ2VnUlQ3?=
 =?utf-8?B?YzNvdlpOaWluK0hhN3dzNk9EUFpZaGR4OFJ2UlYrbENFR29ENnY2THVQakpn?=
 =?utf-8?B?cThUNmxYSThjSWJXUVNVVDBIdkpiblI5S2QxYUs0YjZKMTBLU09BNGVPZWx6?=
 =?utf-8?B?U3pUSWtUa1IxZHF5VXJTdk9iWHBJV0l2bWJwbmwwZzF0WXdYbk9DRWQwd0Fw?=
 =?utf-8?B?L0JDc3U0KzhiWVNaZmo5REpXWUNobWQrcVo2V1l2Y1hiYWxPbE1Sb20rQVYx?=
 =?utf-8?B?NjdncTRmMjFjWG9NMXlpNnJXZS82YVhEQWNlNnAzTzR6K3M5MFJoYWdHUG53?=
 =?utf-8?B?N0FmRTZ3aHlRbVRzbWxDSXhrT3lBa2drOWNyVVB5Q1pFNXBrM204NGlJUGJ3?=
 =?utf-8?B?UWdCZi96MjFsNXhjSTRjcUJoa0N5QnIzTDVsbzBPRmF1bHRmZmZGOE0rdjJZ?=
 =?utf-8?B?cDhxSldMd0V1VElpSmM2M3IzNXBPNUxhZVhXdXVvNThpYWxiTmVkNzN1eXF6?=
 =?utf-8?B?QmxlQ2g4WmppWlgvN3k3di9nWjErYzFTVzQzVDJCY1ZiZVd5bW1zM2Y0OS84?=
 =?utf-8?B?U3hQd0hUanRubVVFcUpGVEFXQXZ5WXIxeWdWVVcwVUZTM2dMSzA2K3BwbUxO?=
 =?utf-8?B?QncwR3JBT0pmVEhYNkRjK1ppNEh5SHQyLzloSWR0NTlHVFNnN01DOWtTajQ0?=
 =?utf-8?B?SXBTWTRSY3JPaEpWUjlwcWJwUTJ6TEhQcFpCTmFPUHVPYm9xbU80NmhIbmVq?=
 =?utf-8?B?T1J0RWZnMjYwL2FUejY0LzYwUzY3WWgwdGt0UzU0cnI1SUlvVWhVNlZaZE9L?=
 =?utf-8?B?REIzQXlKZWthY01EWW9HRXNrZU9KUlJuOG9meXBaemZQa1ZTVkFtak1aYXpO?=
 =?utf-8?B?R1UwdDFVWEs5eTBDUEJlZWErZ1cza2JaOFVWa1lEZ1NtVTYvNjlDREFNSTQ4?=
 =?utf-8?B?SW0yUnpqRnlGVUNVdjFOM2VkY0wrYURpd3RPQlpORy92N0ZJdit0RDgyVnNY?=
 =?utf-8?B?ankwUlBINjJtL2UwcUxxNkpFUmVrS3lNWThZaU5uMDg0R2NyTkZTWlN6Qko3?=
 =?utf-8?B?VFZibFQ4MW1uQnRZWTIyOGtGaE1tN2RrUkpYVHo3V0grS1dNcytueU56Z09k?=
 =?utf-8?B?eHg3dGd4RDJDdG5JWFhFTkdaZVlnTDlZUlRYM0JRWUl2VFNkazA0d3duQUFy?=
 =?utf-8?B?S1dNY2huT1pnMnJoYlZNcTVRUzFEM0w2K2pCU0M2RG1uY0tnUU1FZ1o3U284?=
 =?utf-8?B?VFNNVHRKVE0xb2R5M1NzSHJxZkg5RndzbjZpRmpWMTNUQzZiaEtxZUlsRWJm?=
 =?utf-8?B?L3k4cHB6enNaUVhPUWM0QmVYdTZ1UWxOaXRxd0JTU0ZWSDFhVzdYZz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FAC7A1E7B23EA9418E618E03BFB0EC72@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee6d3513-03f2-463f-20cf-08de708fb463
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2026 14:52:44.1789 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CQdUTY4b7l0yyu8sfC2GnFgeHrBZDVt/PK+llDj/Kj6V2vPTKvFdMZh8RGR5DB27B7NNxUYIO+KMNMBUWwNfGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF867D7FF5E
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

T24gRnJpLCAyMDI2LTAyLTIwIGF0IDE2OjQ4ICswNTMwLCBBcmF2aW5kIElkZGFtc2V0dHkgd3Jv
dGU6DQo+IA0KPiBPbiAxOC0wMi0yMDI2IDA2OjA3LCBSb2RyaWdvIFZpdmkgd3JvdGU6DQo+ID4g
T24gRnJpLCBGZWIgMTMsIDIwMjYgYXQgMDI6NTU6NTlQTSArMDUzMCwgVGVqYXMgVXBhZGh5YXkg
d3JvdGU6DQo+ID4gPiBTdGFydGluZyBDUkksIEluY2x1ZGUgYSBzeXNmcyBpbnRlcmZhY2UgZGVz
aWduZWQgdG8gZXhwb3NlDQo+ID4gPiBpbmZvcm1hdGlvbg0KPiA+ID4gYWJvdXQgYmFkIFZSQU0g
cGFnZXPigJR0aG9zZSBpZGVudGlmaWVkIGFzIGhhdmluZyBoYXJkd2FyZSBmYXVsdHMNCj4gPiA+
IChlLmcuLCBFQ0MgZXJyb3JzKS4gVGhpcyBpbnRlcmZhY2UgYWxsb3dzIHVzZXJzcGFjZSB0b29s
cyBhbmQNCj4gPiA+IGFkbWluaXN0cmF0b3JzIHRvIG1vbml0b3IgdGhlIGhlYWx0aCBvZiB0aGUg
R1BVJ3MgbG9jYWwgbWVtb3J5DQo+ID4gPiBhbmQNCj4gPiA+IHRyYWNrIHRoZSBzdGF0dXMgb2Yg
cGFnZSByZXRpcmVtZW50LlRvIGdldCBkZXRhaWxzIG9uIGJhZCBncHUNCj4gPiA+IHZyYW0NCj4g
PiA+IHBhZ2VzIGNhbiBiZSBmb3VuZCB1bmRlciAvc3lzL2J1cy9wY2kvZGV2aWNlcy9iZGYvdnJh
bV9iYWRfcGFnZXMuDQo+ID4gPiANCj4gPiA+IFdoZXJlIFRoZSBmb3JtYXQgaXMsIHBmbiA6IGdw
dSBwYWdlIHNpemUgOiBmbGFncw0KPiA+ID4gDQo+ID4gPiBmbGFnczoNCj4gPiA+IFI6IHJlc2Vy
dmVkLCB0aGlzIGdwdSBwYWdlIGlzIHJlc2VydmVkLg0KPiA+ID4gUDogcGVuZGluZyBmb3IgcmVz
ZXJ2ZSwgdGhpcyBncHUgcGFnZSBpcyBtYXJrZWQgYXMgYmFkLCB3aWxsIGJlDQo+ID4gPiByZXNl
cnZlZCBpbiBuZXh0IHdpbmRvdyBvZiBwYWdlX3Jlc2VydmUuDQo+ID4gPiBGOiB1bmFibGUgdG8g
cmVzZXJ2ZS4gdGhpcyBncHUgcGFnZSBjYW7igJl0IGJlIHJlc2VydmVkIGR1ZSB0byBzb21lDQo+
ID4gPiByZWFzb25zLg0KPiA+ID4gDQo+ID4gPiBGb3IgZXhhbXBsZSBpZiB5b3UgcmVhZCB1c2lu
ZyBjYXQNCj4gPiA+IC9zeXMvYnVzL3BjaS9kZXZpY2VzL2JkZi92cmFtX2JhZF9wYWdlcywNCj4g
PiA+IDB4MDAwMDAwMDAgOiAweDAwMDAxMDAwIDogUg0KPiA+ID4gMHgwMDAwMTIzNCA6IDB4MDAw
MDEwMDAgOiBQDQo+ID4gUmlhbmEsIFJhYWcsIEFyYXZpbmQsIGEgZ29vZCBuZXcgdXNlIGNhc2Ug
Zm9yIHRoZSBkcm0tcmFzIG5vPyENCj4gPiBUaG91Z2h0cz8NCj4gDQo+IEluIGdlbmVyYWwgdGhl
IGZlYXR1cmUgY2FuIGJlIHN1cHBvcnRlZCB2aWEgZHJtLXJhcyBmcmFtZXdvcmssIGJ1dCBpcw0K
PiB0aGUgbW90aXZhdGlvbiB0byBtb3ZlIGFsbCBlcnJvciByZWxhdGVkIGluZm8gdG8gZHJtLXJh
cywgYWxzbyBhbnkNCj4gZ3B1DQo+IGhhbmcgZGF0YSwgaGVhbHRoIGV0Yy4uLA0KDQpObywgdGhl
IG1vdGl2YXRpb24gaXMgbm90IHRvIG1vdmUgZXZlcnl0aGluZyB0aGVyZS4NCkkgd2FzIHRoaW5r
aW5nIG9uIHRoZSBsaW5lcyBvZiBhdm9pZGluZyBzeXNmcy4gQnV0IHdlbGwsIGl0IGlzIG9ubHkN
Cm9uZSBzeXNmcyBhbmQgSSBkb24ndCBiZWxpZXZlIHdlIHdvdWxkIG5lZWQgYW55IG5vdGlmaWNh
dGlvbiB1cG9uDQpuZXcgcGFnZXMgbWFya2VkIGFzIGJhZCwgb3IgZG8gd2U/DQoNCklmIHdlIG5l
ZWQgbm90aWZpY2F0aW9ucyB0aGVuIHN5c2ZzIGlzIGJhZCBjaG9pY2UgYW5kIG5ldGxpbmsgY291
bGQNCnByb3ZpZGUgaW5mbyBhbmQgbm90aWZpY2F0aW9uIGluIGEgc2luZ2xlIHBsYWNlLg0KDQo+
IA0KPiBUaGFua3MsDQo+IEFyYXZpbmQuDQo+ID4gDQo+ID4gPiBTaWduZWQtb2ZmLWJ5OiBUZWph
cyBVcGFkaHlheSA8dGVqYXMudXBhZGh5YXlAaW50ZWwuY29tPg0KPiA+ID4gLS0tDQo+ID4gPiDC
oGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Vfc3lzZnMuYyB8wqAgMiArDQo+ID4gPiDCoGRy
aXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fdnJhbV9tZ3IuYyB8IDc4DQo+ID4gPiArKysrKysrKysr
KysrKysrKysrKysrKysrKysrDQo+ID4gPiDCoGRyaXZlcnMvZ3B1L2RybS94ZS94ZV90dG1fdnJh
bV9tZ3IuaCB8wqAgMSArDQo+ID4gPiDCoDMgZmlsZXMgY2hhbmdlZCwgODEgaW5zZXJ0aW9ucygr
KQ0KPiA+ID4gDQo+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rldmlj
ZV9zeXNmcy5jDQo+ID4gPiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Vfc3lzZnMuYw0K
PiA+ID4gaW5kZXggYTczZTBlOTU3Y2IwLi5lNmEwMTc2MDE0MjggMTAwNjQ0DQo+ID4gPiAtLS0g
YS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3N5c2ZzLmMNCj4gPiA+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV9kZXZpY2Vfc3lzZnMuYw0KPiA+ID4gQEAgLTE0LDYgKzE0LDcgQEAN
Cj4gPiA+IMKgI2luY2x1ZGUgInhlX3Bjb2RlX2FwaS5oIg0KPiA+ID4gwqAjaW5jbHVkZSAieGVf
cGNvZGUuaCINCj4gPiA+IMKgI2luY2x1ZGUgInhlX3BtLmgiDQo+ID4gPiArI2luY2x1ZGUgInhl
X3R0bV92cmFtX21nci5oIg0KPiA+ID4gwqANCj4gPiA+IMKgLyoqDQo+ID4gPiDCoCAqIERPQzog
WGUgZGV2aWNlIHN5c2ZzDQo+ID4gPiBAQCAtMjg0LDYgKzI4NSw3IEBAIGludCB4ZV9kZXZpY2Vf
c3lzZnNfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlDQo+ID4gPiAqeGUpDQo+ID4gPiDCoAkJaWYgKHJl
dCkNCj4gPiA+IMKgCQkJcmV0dXJuIHJldDsNCj4gPiA+IMKgCX0NCj4gPiA+ICsJeGVfdHRtX3Zy
YW1fc3lzZnNfaW5pdCh4ZSk7DQo+ID4gPiDCoA0KPiA+ID4gwqAJcmV0dXJuIDA7DQo+ID4gPiDC
oH0NCj4gPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3ZyYW1fbWdy
LmMNCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV92cmFtX21nci5jDQo+ID4gPiBp
bmRleCBjYjMzOTQwMDBlODMuLmM2YTgxY2NhYTlkMiAxMDA2NDQNCj4gPiA+IC0tLSBhL2RyaXZl
cnMvZ3B1L2RybS94ZS94ZV90dG1fdnJhbV9tZ3IuYw0KPiA+ID4gKysrIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX3R0bV92cmFtX21nci5jDQo+ID4gPiBAQCAtNzQ0LDMgKzc0NCw4MSBAQCBpbnQg
eGVfdHRtX3Rib19oYW5kbGVfYWRkcl9mYXVsdChzdHJ1Y3QNCj4gPiA+IHhlX3RpbGUgKnRpbGUs
IHVuc2lnbmVkIGxvbmcgYWRkcikNCj4gPiA+IMKgCXJldHVybiByZXQ7DQo+ID4gPiDCoH0NCj4g
PiA+IMKgRVhQT1JUX1NZTUJPTCh4ZV90dG1fdGJvX2hhbmRsZV9hZGRyX2ZhdWx0KTsNCj4gPiA+
ICsNCj4gPiA+ICtzdGF0aWMgdm9pZCB4ZV90dG1fdnJhbV9kdW1wX2JhZF9wYWdlc19pbmZvKGNo
YXIgKmJ1Ziwgc3RydWN0DQo+ID4gPiB4ZV90dG1fdnJhbV9tZ3IgKm1ncikNCj4gPiA+ICt7DQo+
ID4gPiArCWNvbnN0IHVuc2lnbmVkIGludCBlbGVtZW50X3NpemUgPSBzaXplb2YoIjB4YWJjZGFi
Y2QgOg0KPiA+ID4gMHgxMjM0NTY3OCA6IFJcbiIpIC0gMTsNCj4gPiA+ICsJc3RydWN0IHhlX3R0
bV9vZmZsaW5lX3Jlc291cmNlICpwb3MsICpuOw0KPiA+ID4gKwlzdHJ1Y3QgZHJtX2J1ZGR5X2Js
b2NrICpibG9jazsNCj4gPiA+ICsJc3NpemVfdCBzID0gMDsNCj4gPiA+ICsNCj4gPiA+ICsJbXV0
ZXhfbG9jaygmbWdyLT5sb2NrKTsNCj4gPiA+ICsJbGlzdF9mb3JfZWFjaF9lbnRyeV9zYWZlKHBv
cywgbiwgJm1nci0+b2ZmbGluZWRfcGFnZXMsDQo+ID4gPiBvZmZsaW5lZF9saW5rKSB7DQo+ID4g
PiArCQlibG9jayA9IGxpc3RfZmlyc3RfZW50cnkoJnBvcy0+YmxvY2tzLA0KPiA+ID4gKwkJCQkJ
IHN0cnVjdCBkcm1fYnVkZHlfYmxvY2ssDQo+ID4gPiArCQkJCQkgbGluayk7DQo+ID4gPiArCQlz
ICs9IHNjbnByaW50ZigmYnVmW3NdLCBlbGVtZW50X3NpemUgKyAxLA0KPiA+ID4gKwkJCcKgwqDC
oMKgwqDCoCAiMHglMDhsbHggOiAweCUwOGxseCA6ICUxc1xuIiwNCj4gPiA+ICsJCQnCoMKgwqDC
oMKgwqAgZHJtX2J1ZGR5X2Jsb2NrX29mZnNldChibG9jaykgPj4NCj4gPiA+IFBBR0VfU0hJRlQs
DQo+ID4gPiArCQkJwqDCoMKgwqDCoMKgIGRybV9idWRkeV9ibG9ja19zaXplKCZtZ3ItPm1tLA0K
PiA+ID4gYmxvY2spLA0KPiA+ID4gKwkJCcKgwqDCoMKgwqDCoCAiUiIpOw0KPiA+ID4gKwl9DQo+
ID4gPiArCWxpc3RfZm9yX2VhY2hfZW50cnlfc2FmZShwb3MsIG4sICZtZ3ItPnF1ZXVlZF9wYWdl
cywNCj4gPiA+IHF1ZXVlZF9saW5rKSB7DQo+ID4gPiArCQlibG9jayA9IGxpc3RfZmlyc3RfZW50
cnkoJnBvcy0+YmxvY2tzLA0KPiA+ID4gKwkJCQkJIHN0cnVjdCBkcm1fYnVkZHlfYmxvY2ssDQo+
ID4gPiArCQkJCQkgbGluayk7DQo+ID4gPiArCQlzICs9IHNjbnByaW50ZigmYnVmW3NdLCBlbGVt
ZW50X3NpemUgKyAxLA0KPiA+ID4gKwkJCcKgwqDCoMKgwqDCoCAiMHglMDhsbHggOiAweCUwOGxs
eCA6ICUxc1xuIiwNCj4gPiA+ICsJCQnCoMKgwqDCoMKgwqAgZHJtX2J1ZGR5X2Jsb2NrX29mZnNl
dChibG9jaykgPj4NCj4gPiA+IFBBR0VfU0hJRlQsDQo+ID4gPiArCQkJwqDCoMKgwqDCoMKgIGRy
bV9idWRkeV9ibG9ja19zaXplKCZtZ3ItPm1tLA0KPiA+ID4gYmxvY2spLA0KPiA+ID4gKwkJCcKg
wqDCoMKgwqDCoCAiUCIpOw0KPiA+ID4gKwl9DQo+ID4gPiArCW11dGV4X3VubG9jaygmbWdyLT5s
b2NrKTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIHNzaXplX3QgdnJhbV9iYWRf
cGFnZXNfc2hvdyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdA0KPiA+ID4gZGV2aWNlX2F0dHJp
YnV0ZSAqYXR0ciwgY2hhciAqYnVmKQ0KPiA+ID4gK3sNCj4gPiA+ICsJc3RydWN0IHBjaV9kZXYg
KnBkZXYgPSB0b19wY2lfZGV2KGRldik7DQo+ID4gPiArCXN0cnVjdCB4ZV9kZXZpY2UgKnhlID0g
cGRldl90b194ZV9kZXZpY2UocGRldik7DQo+ID4gPiArCXN0cnVjdCB0dG1fcmVzb3VyY2VfbWFu
YWdlciAqbWFuOw0KPiA+ID4gKwl1OCBtZW1fdHlwZSA9IFhFX1BMX1ZSQU0xOw0KPiA+ID4gKw0K
PiA+ID4gKwlkbyB7DQo+ID4gPiArCQltYW4gPSB0dG1fbWFuYWdlcl90eXBlKCZ4ZS0+dHRtLCBt
ZW1fdHlwZSk7DQo+ID4gPiArCQlzdHJ1Y3QgeGVfdHRtX3ZyYW1fbWdyICptZ3IgPQ0KPiA+ID4g
dG9feGVfdHRtX3ZyYW1fbWdyKG1hbik7DQo+ID4gPiArDQo+ID4gPiArCQlpZiAobWFuKQ0KPiA+
ID4gKwkJCXhlX3R0bV92cmFtX2R1bXBfYmFkX3BhZ2VzX2luZm8oYnVmLA0KPiA+ID4gbWdyKTsN
Cj4gPiA+ICsJCS0tbWVtX3R5cGU7DQo+ID4gPiArCX0gd2hpbGUgKG1lbV90eXBlID49IFhFX1BM
X1ZSQU0wKTsNCj4gPiA+ICsNCj4gPiA+ICsJcmV0dXJuIHN5c2ZzX2VtaXQoYnVmLCAiJXNcbiIs
IGJ1Zik7DQo+ID4gPiArfQ0KPiA+ID4gK3N0YXRpYyBERVZJQ0VfQVRUUl9STyh2cmFtX2JhZF9w
YWdlcyk7DQo+ID4gPiArDQo+ID4gPiArc3RhdGljIHZvaWQgeGVfdHRtX3ZyYW1fc3lzZnNfZmlu
aSh2b2lkICphcmcpDQo+ID4gPiArew0KPiA+ID4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGFy
ZzsNCj4gPiA+ICsNCj4gPiA+ICsJZGV2aWNlX3JlbW92ZV9maWxlKHhlLT5kcm0uZGV2LA0KPiA+
ID4gJmRldl9hdHRyX3ZyYW1fYmFkX3BhZ2VzKTsNCj4gPiA+ICt9DQo+ID4gPiArDQo+ID4gPiAr
LyoqDQo+ID4gPiArICogeGVfdHRtX3ZyYW1fc3lzZnNfaW5pdCAtIEluaXRpYWxpemUgdnJhbSBz
eXNmcyBjb21wb25lbnQNCj4gPiA+ICsgKiBAdGlsZTogWGUgVGlsZSBvYmplY3QNCj4gPiA+ICsg
Kg0KPiA+ID4gKyAqIEl0IG5lZWRzIHRvIGJlIGluaXRpYWxpemVkIGFmdGVyIHRoZSBtYWluIHRp
bGUgY29tcG9uZW50IGlzDQo+ID4gPiByZWFkeQ0KPiA+ID4gKyAqDQo+ID4gPiArICogUmV0dXJu
czogMCBvbiBzdWNjZXNzLCBuZWdhdGl2ZSBlcnJvciBjb2RlIG9uIGVycm9yLg0KPiA+ID4gKyAq
Lw0KPiA+ID4gK2ludCB4ZV90dG1fdnJhbV9zeXNmc19pbml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhl
KQ0KPiA+ID4gK3sNCj4gPiA+ICsJaW50IGVycjsNCj4gPiA+ICsNCj4gPiA+ICsJZXJyID0gZGV2
aWNlX2NyZWF0ZV9maWxlKHhlLT5kcm0uZGV2LA0KPiA+ID4gJmRldl9hdHRyX3ZyYW1fYmFkX3Bh
Z2VzKTsNCj4gPiA+ICsJaWYgKGVycikNCj4gPiA+ICsJCXJldHVybiAwOw0KPiA+ID4gKw0KPiA+
ID4gKwlyZXR1cm4gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KHhlLT5kcm0uZGV2LA0KPiA+ID4g
eGVfdHRtX3ZyYW1fc3lzZnNfZmluaSwgeGUpOw0KPiA+ID4gK30NCj4gPiA+ICtFWFBPUlRfU1lN
Qk9MKHhlX3R0bV92cmFtX3N5c2ZzX2luaXQpOw0KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV90dG1fdnJhbV9tZ3IuaA0KPiA+ID4gYi9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdHRtX3ZyYW1fbWdyLmgNCj4gPiA+IGluZGV4IDU4NzJlOGI0ODc3OS4uNmU2OTE0MGMwYmU4
IDEwMDY0NA0KPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3R0bV92cmFtX21nci5o
DQo+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdHRtX3ZyYW1fbWdyLmgNCj4gPiA+
IEBAIC0zNCw2ICszNCw3IEBAIHZvaWQgeGVfdHRtX3ZyYW1fZ2V0X3VzZWQoc3RydWN0DQo+ID4g
PiB0dG1fcmVzb3VyY2VfbWFuYWdlciAqbWFuLA0KPiA+ID4gwqBpbnQgeGVfdHRtX3Rib19oYW5k
bGVfYWRkcl9mYXVsdChzdHJ1Y3QgeGVfdGlsZSAqdGlsZSwgdW5zaWduZWQNCj4gPiA+IGxvbmcg
YWRkcik7DQo+ID4gPiDCoHZvaWQgeGVfdHRtX3ZyYW1fZHVtcF9hbGxvY2F0ZWRfYmxvY2tzKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsDQo+ID4gPiBzdHJ1Y3QgZHJtX2J1ZGR5ICptbSwNCj4gPiA+
IMKgCQkJCcKgwqDCoMKgwqDCoCBzdHJ1Y3QgZHJtX3ByaW50ZXIgKnApOw0KPiA+ID4gK2ludCB4
ZV90dG1fdnJhbV9zeXNmc19pbml0KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKTsNCj4gPiA+IMKgc3Rh
dGljIGlubGluZSBzdHJ1Y3QgeGVfdHRtX3ZyYW1fbWdyX3Jlc291cmNlICoNCj4gPiA+IMKgdG9f
eGVfdHRtX3ZyYW1fbWdyX3Jlc291cmNlKHN0cnVjdCB0dG1fcmVzb3VyY2UgKnJlcykNCj4gPiA+
IMKgew0KPiA+ID4gLS0gDQo+ID4gPiAyLjUyLjANCj4gPiA+IA0K
