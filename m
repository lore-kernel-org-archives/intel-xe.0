Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41065E9A03B
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 09:04:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2D7F10E59B;
	Wed, 18 Feb 2026 09:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hHfLRhhm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE9910E5A2
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 09:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771405482; x=1802941482;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=CWtCtNHAFbJvS099kiUlBko7/CqLhJs2sFzKDpHdQH8=;
 b=hHfLRhhmmAUem4mtLWfx6Q3Jtf6FnZylWAnSlp4ofAUTgSE/oOGPRVpm
 YBaSlCXdVLPcqZT4wNfXflMdubAkK0WtcN0Jx49fxUlUd4AmryGLnD4lo
 KZ7JbvFUzNjhyVR/7FgQJx0A6Fq9s4CYeK4xC3Fgexu0oriIeDJeaV5J0
 29cJvavZfiim5lUekFDS4oLEzGpMAh6VkIyPJw0q+ti2VCqqblik5QHYv
 8zC7kXfr2jlrq7ZILa8aJgIyH9ZwZimNr1PGmbC6LcGNaDIvMIN6vwPKM
 tq8m8BXGAyd2sVWVrsyDqKQRpiuN2gDZj7i7U4oYOKrJS6NIqLdtHo90n w==;
X-CSE-ConnectionGUID: gLxxijhMTGebTsPyGolBcQ==
X-CSE-MsgGUID: es7yXZopTTaoYftJZDbRtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11704"; a="72468512"
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="72468512"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 01:04:41 -0800
X-CSE-ConnectionGUID: 0uMmwXdMTGe4wyHNm+ralw==
X-CSE-MsgGUID: 4FnFXZCySjiNLRIrn1700g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,297,1763452800"; d="scan'208";a="213382597"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 01:04:41 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 01:04:41 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 01:04:40 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 01:04:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UU7sY5gKj+vpZoNVjs2kNyIu4hhy8Cyqj4Sid0MmNAC9RJcgWO/YSRFj1aj5LWzBn89oaQdcKAMtPFWW9+GD0KVxGgQEvkLkQGtod3qg6hfuu2hmThH/7L5D/f3neLUFjO0b+HzXRQhCJ/MuojkAwtA7ArNTn8NreiMRGQSwXwQNfUciqy2n98TglYZ7wThd1aTs/AoLA2vb7unnFUwgYo6SD3cnhzWMW6B12x5wgXlT0AbOcddfouwftZX2agQSutmxrEttQ8qfZ7zVgDU9k1viDOL8/nwGW+Hn/O6yZJC9LkaNQGUhIWujY3ZuHfTvkz8XQqV2WwNGJbdfh+kCuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CWtCtNHAFbJvS099kiUlBko7/CqLhJs2sFzKDpHdQH8=;
 b=uXPV3yDzY/fXXmo3/OE8u/8I/n0917HhxHta49W7nz7hTGDeLvg3S4/sBX4DdoJt67TejPY1Sfwdp/Z0CCWPQaEqe2cLLDNEkM+2zh26p3Nbx1W79QzevFOddoakqM7U0eAoWsr8zZVzCmY7Gr6XNjgrMhi8QWWc+mWv5AhwNanIGINbnIcfiCtLJrp8j75jDY46LE2B6iT5e4MAYoCBDXYALbMBtxhSHyV6dBpSzeEzopAs0zIEWoB1pO4JOvCKSVHYOIDuWj01z2yn9YnBqeNnDYWpUF7RwoAJlr47ZgyGUS94MW9j5B8l6t/+bXIeiE+eOzn4Bx7AsmX82dgJdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS0PR11MB7733.namprd11.prod.outlook.com (2603:10b6:8:dc::19) by
 SA1PR11MB6821.namprd11.prod.outlook.com (2603:10b6:806:29d::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.13; Wed, 18 Feb 2026 09:04:38 +0000
Received: from DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f]) by DS0PR11MB7733.namprd11.prod.outlook.com
 ([fe80::3e49:3435:98fa:130f%3]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 09:04:37 +0000
From: "Hellstrom, Thomas" <thomas.hellstrom@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Kumar
 G, Naresh" <naresh.kumar.g@intel.com>
CC: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Shah, Ankur N"
 <ankur.n.shah@intel.com>, "Ghimiray, Himal Prasad"
 <himal.prasad.ghimiray@intel.com>, "Mrozek, Michal" <michal.mrozek@intel.com>
Subject: Re: [PATCH 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default for
 BMG/CRI
Thread-Topic: [PATCH 1/1] drm/xe: Set GT rp min frequency as 1.2GHz default
 for BMG/CRI
Thread-Index: AQHcn0w0JZUjpGabA0yL08Ptn+mIFLWILJ0A
Date: Wed, 18 Feb 2026 09:04:37 +0000
Message-ID: <4603e26486bdeeafac19dc8a4d0c64aa3fa988bb.camel@intel.com>
References: <20260216135107.3148167-3-naresh.kumar.g@intel.com>
 <20260216135107.3148167-4-naresh.kumar.g@intel.com>
In-Reply-To: <20260216135107.3148167-4-naresh.kumar.g@intel.com>
Accept-Language: en-SE, en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.58.3 (3.58.3-1.fc43) 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS0PR11MB7733:EE_|SA1PR11MB6821:EE_
x-ms-office365-filtering-correlation-id: e275ded3-4b27-4f54-8866-08de6eccbe46
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|10070799003|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?RTlqVzgreEI5V0NXNGVKbm1HL0RNKzhxS2ovVXF3dXl1VGg0c2IxVkphTEQ5?=
 =?utf-8?B?a2lBQm5aNDBqVXp4Y1c2bzRaZkRhS0hjdGd6SWF6L3poc1E1dmZ5RXE2YVZS?=
 =?utf-8?B?VDRxMkhhVGdkMDhQditQYlFQMkR3emZZRmJvTWhtcjZSOC9ma2ludG1yNXF3?=
 =?utf-8?B?UHpQTk9waUE3VUFmMm5Zby9mdGVueC9jT203RVpiVXRJa0hndEJVdDBTWTBv?=
 =?utf-8?B?K3R3NlNBUEhQbW9QNGFZYU5QSXI2VGJiYjJEcVNOaURwNDkvVlVySXF1N0JS?=
 =?utf-8?B?VG5SMG0yZXlRVnJrUXE0dDhETkZ1d1F2R0ZtN0U3VS9mOSttenJieXUxaWZw?=
 =?utf-8?B?eXNxVU9Nd1NyVWpmeC9IQzY2S0dJZFZzdCt0TXNVZUR3a2JDTmV4SEJDaGFR?=
 =?utf-8?B?RnFHcDJhQmVWT3ZyeHdOM1RPdjR1ei9uZ09ydWovYzVzUjNoQnMvWFY4NG5u?=
 =?utf-8?B?Y1RXKzVPakRWNWhCZ25DbUI2cW9ZN1FUSTNkNEZXQ1FMZjE1WVlBQnlOMlNV?=
 =?utf-8?B?aWJHMUJKMGNHUlFkeDN6WStLTVRTSjVqakpYYlA3UHdiMTRwMlBPM0pQUFp5?=
 =?utf-8?B?cGVET0JHaWFzd3UyUkZXRk4xMldOWkppdGtlWi94d2JJV3QxTUZ3dEhHL0ZD?=
 =?utf-8?B?NCt2T2p2d2hkRkt4RW83bUhpamlkUkRhL0VjREIvVXorUksyS0Q2ZjFjZ2l1?=
 =?utf-8?B?WWZVUXZWcmFDQmtzcHgwV1JGNkN6Y0ZDTzFCbTU0UXprUGR6RHZrejdGZXZq?=
 =?utf-8?B?d1JlZEdvcFY3S1F1VGpQNm51bW5RTENYNHVsR1lGQ1Z6YW5sckRSOGRnZ0VL?=
 =?utf-8?B?SC9IUncwc1pGTExoak5hQnh3NzJWQnJITWprRnJpM1JOc3VUUXZETS9ac2ox?=
 =?utf-8?B?dklmNXptQjk1SERnQXp6MUp4dEpsSTczMUxia0psbWNxbWZQNGdwdEhYWTF3?=
 =?utf-8?B?bDhPb0lIZDJxbjRNTytZaDU3a3N1QnRscWIwSEtPOWY2YWFVb0sxbGZoQ2FZ?=
 =?utf-8?B?ekRJTWlaTHgxNDFTL3pQWGpHb3ZYTC9uemFlR29hUllVdkdzazgxclQvYjN3?=
 =?utf-8?B?cE45eFRaQSt6OGZPMzNKRnlHRldzMHB0MWtGTExncjRYanRZZ2xFb0FXaVBZ?=
 =?utf-8?B?WmNNb0ZNaWRzN2lyMFRpY3JyTlBzbndRMDZwUzUvbjZFQlRRdEY0by9vWmRn?=
 =?utf-8?B?RThhaExmOFN6T3hsWnlONm05T1JJUFJjekZyK1JrMnNpQ3plY21lMGZsbm9E?=
 =?utf-8?B?RUVwNElDNGVRWk1vNG51NVNkaVBNYitkS2hpMndoazBabmlLZmRUdGRMNzZy?=
 =?utf-8?B?ek1GeEhtby9ZZDFCekxHOGx6MWdaZ0swU2tWUU5tanp3NlNVUDNyVHl2OTAw?=
 =?utf-8?B?Y3N3M01Ld0FLaHFNUklDcWp3NDQyRTBvTHRabkdpa21OSTU1UTBZTW5INXBa?=
 =?utf-8?B?LzVYWmp4V2NIdUhsNFNiSlZCN05FOXI4a3Q1SGhvQTMvRkpnUkZwOXU3d0p4?=
 =?utf-8?B?OWVIV3lIR1pzV29meUtHSmRqQ2JvZDJQY2ppbmY4OUk5cGM1b2RxTFNhTDVj?=
 =?utf-8?B?SmIxRGVhMGcvVldPM04rNjJJSTBJYnNpMkF6ZE5KODlEdzRRQmlMT2t3aXpN?=
 =?utf-8?B?TE9FY3VWb3BYTHhVc1pMSURKbG1OMEM0MG9Td1d5d2FqWGpkMHo4NUViVlkr?=
 =?utf-8?B?Yjc4MXNveWhSUGJBMU0yTVRHWEh6RDNGRVhvbDlrTURPTGp2WnZtSVhmWUx4?=
 =?utf-8?B?VXE3MVc0bUN4T05tWUJyeURycXF6cjdtVXNPVlJldE03aU12STJZMEJyeG5G?=
 =?utf-8?B?cWFoa01nUFpUWUg2cWhQRHVUby8yZzdxTFhqRnI2QkJod2xHSkxpeHV4Umwv?=
 =?utf-8?B?K3h5SC9LbEJTZDE1V1FaQm1xbXlWM2RhS2Y3akdNT0djODVzMDBCb00vU2Q5?=
 =?utf-8?B?TnpCYXVESW5OUTg5bm1QOEp4Yk1RQ1NrSzBWVVRsTlpnRUJxVjdxSExueU5P?=
 =?utf-8?B?N2FFSjl5S3M5d25QM0Q1Y1VFbHN5NmNZTksybmpaNTRDcTRqVDJzWUhENzRj?=
 =?utf-8?B?MkJnbmZqdStYcDJMRXRtZVNMeVZMeHRiRjg0cGRkMGxMSmY4N2VySnVUZU5i?=
 =?utf-8?B?WFVvVXdsaUxaalN5QVY2ODBzZnBnZEJkZktlSFRYZlFoZi83eEFhSXdSelFC?=
 =?utf-8?Q?vBsM4KMN0fSV06I0DQ7sqjU=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7733.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(10070799003)(366016)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?anJxNEs4cExBUmk4SkxycU9KRmcrS0RZVGsyZXpRZnVKbG9NdVZsWml3Z1hL?=
 =?utf-8?B?ZlQxV3IvbWhBd1hmL1lRK1VWT1V6K0lBbXFrQXZHOUpvR0Z2RUcwdEVyZnRW?=
 =?utf-8?B?bFowaU1GZkt5clg4aUx2YmRETWVkaTk5Zm4raktDNWpteWFSaytJNzJ6WWlT?=
 =?utf-8?B?UGw5bE43eTVjU3pralVkRnZvYWo5VWZqaW9QdW53Rk9FUnlteUd2Sk1CQnBZ?=
 =?utf-8?B?MGF0SmFLd0g1YWwxMGhrSUZtK1FuV2VxMjhDY1pralRQQ3F0ZGlwL2lEbkZw?=
 =?utf-8?B?YTQxaFJUMit5VnBzZHFHK1lOVVQvcjFVNmhjd294cUtWWG94T1FSV0wyS21M?=
 =?utf-8?B?Wm1yS0dTSGxvajBISmhYeVZhZUVnT1hWeUMvY0RvMkl1SlJzd0tEd29WNUpk?=
 =?utf-8?B?ZlFIMDN4Tm1IWkx2S0xhMTc4WVljaldLendVSVczdWc3ZFFvQmJjUHJyVFla?=
 =?utf-8?B?aHl0OUhqZlEyS0Q1SW9MTG5xalBONXZIQ1U3TVRhM2NwSitZMWQrQ3BHNVg4?=
 =?utf-8?B?QUx4WGh5TVVnOTU3bzBmWkJJRkpVdUJxNEp1R0IralJha001S1dIWFZEeUxS?=
 =?utf-8?B?Y3FMRFZSKzF0N2xPdDJyeXE3Z2NFM3VqQVRpZ2YxRVFCWDBEYXRkZFhBc3Br?=
 =?utf-8?B?T1VBRFlmSG1nZlhTb00wMjBRd0xIV1FHNlBZd2FHQTdKYkNRaitwektHbitJ?=
 =?utf-8?B?cEhzRzFNQVZPTGZrZE5MVG43ajk4ejF5WERKY29YRWY5WCtHWm1QVTBWKzFO?=
 =?utf-8?B?SlJoRytHSUhodllnSXI0OExBdS9ScktaZlV6QVJPTC9RbW8vTnd4M0pLVXBu?=
 =?utf-8?B?eUk3by9DQWVWZEVSUGoyNWw2dFdBN1I1ZDl0dWZPVldCay9ZODZHLzZvNmxD?=
 =?utf-8?B?SVpCd0MrdFFpcHZYZENYajlkNlVJVkxoUmN0cWtBM1AzVlgzMUltSVg0cUFW?=
 =?utf-8?B?TjNuSFdqQzFqMExRUTlQQ08yNmRtZlR4VEhZSnpEMGpmcG4yVGZ1T2JBU1Fz?=
 =?utf-8?B?UTV3NjQ3djZhQzFyaEZzUmZjTDlyNjdKU200c3Jvb3FadEx3R3I2cXpxaTVx?=
 =?utf-8?B?dWRkMGlnOHdZOHpPblFLMTBVY1BpNFJUOUlFbkdTdnpWVWVxcmFsNU1yaEV6?=
 =?utf-8?B?NEViZTYyY29vNDhDYWxDWWRTY0J3NEZRd0t1TXdPSk1zK3BPVHBucXI2MnFI?=
 =?utf-8?B?eit1Z25DRisrcnlQT1dETFJLUENLYU90UUw2SzhnVDJ3cXZSSjZibVE2blBU?=
 =?utf-8?B?M0VuN2I2TzV1SDViT1dQbTkrRzFqeDc2WTUzd0RuSEs4TkFlLzgyN0pNZ2Z5?=
 =?utf-8?B?bUU5eVgwRnBXcC94VEhmRGtmbTdHZjQxTlRuMUM2OUJjWm5mT3kzaVR1emRv?=
 =?utf-8?B?RW9kR2tQcTJlallpclpsSHNWUzVRdUpPbFhaUFVJTFVhRS9YSTFCSkVhUHNo?=
 =?utf-8?B?eUxUMXNlTmprQmxnVCtSNVU2cklKRm1IMlI2S1BHb1BIQ1EvQzg4OGRtY0tI?=
 =?utf-8?B?VGJCNXQyeTJ1SzlZM3N5dEFrQ25rcC8weTJrNkl6OUl4SVI1SjdKUnJ2Tmgy?=
 =?utf-8?B?dEhaMDBFUSt2cVN4T0p0czM3MXNwdlVQMnRGYTZ0WlN3cnpFRXQwdmtSNmdx?=
 =?utf-8?B?djFSNlNIeEZIKzJuTSsrMzJwVTJzc0NyRkYyK3lJekZpYXRSNGtQKzNTaTky?=
 =?utf-8?B?TWZQQVdCMVlRYUZkcWVpY3diTXc0NnJmTVdndzZES01Ld01ybHNFZVRnNXhC?=
 =?utf-8?B?QS95K0p1QWdtZ0tnMmE2ZWUwSzY4djNJbXMxSkRLRnlBckVrdGxCL0ZmM0Mv?=
 =?utf-8?B?YW9yVHVvZ0RoUXJSUEJCYzNSK0cyV3VueHdqRWVzOE4wTGttMXllbjZBMU9P?=
 =?utf-8?B?YXUrc1loTzM1NGF5d3dvOFZNQTg4SUhoZVdLZ1F1Wlh4NzhxODJUS1ROWWNN?=
 =?utf-8?B?RC9Da2tjcDVMSWNxZ1RUM0d4ZldoSFcwazMzQ3YzQ0VMV1k2UllsV1JtYjdj?=
 =?utf-8?B?dllyMUorbzJ5YUVpYVBFSTNSZUhRVmV0ZDhnb2doNENCeEU5bndoUkhGSkdx?=
 =?utf-8?B?QkR3dlJGM1ZOUFF2KzFyNWtmZUp2K2V4SkxsRFByWlFoTkRaNHZabUF6RTlG?=
 =?utf-8?B?WDZ2THBRMWhZdWtJbHZjK1k0bUdzUkJHMHNKNmd3ZEpXV2YwMGo3WndLL291?=
 =?utf-8?B?dGh3TlJFeDlBUWVlcDVwZHowUVRIT2I4Z3cxeWlob3ZFSUNtcmxMcmFRcjZK?=
 =?utf-8?B?WWwyVjdDKzVGSUlYVzBab2U5Zy9lOGFiOFVFRGJPOWN1UFpTWk45Z1AwRzNU?=
 =?utf-8?B?S0l3bmRsSGFuVTB0WGZ0SDFOTXVEdE00b0xZWmI2NlhBM09DRitqVHBEdTlr?=
 =?utf-8?Q?LVh6tfeKPGsVOnVLqmJhbp0k9CamllBeJ8iOSBE7PYLXj?=
x-ms-exchange-antispam-messagedata-1: idLSnuuFPIi/MQ==
Content-Type: text/plain; charset="utf-8"
Content-ID: <F20B38240CC1514A931B1604C1F6BBCD@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7733.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e275ded3-4b27-4f54-8866-08de6eccbe46
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Feb 2026 09:04:37.7531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VBiHRrDpHK+HpjxvCs1+E3I91mK1qBJQHlA3cjXAiBZjAgQ2KYtuSNnGFGP3U2grD67mcIZoZwbGbDyjYdbHeQZ1BPcaKBpGMYW0rrOnrvQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB6821
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

T24gTW9uLCAyMDI2LTAyLTE2IGF0IDE5OjIxICswNTMwLCBOYXJlc2hrdW1hciBHb2xsYWtvdGkg
d3JvdGU6DQo+IMKgV2hpbGUgcHJldmlvdXNseSBhcHBsaWVkIG9ubHkgdG8gdGhlIEJNRyBHMjEo
QmF0dGxlIGltYWdlKSBwbGF0Zm9ybQ0KPiDCoHZpYSB3b3JrYXJvdW5kIFdhXzE0MDIyMDg1ODkw
LHRoaXMgMS4yIEdIeiBtaW5pbXVtIGlzIG5vdyB0aGUNCj4gZGVmYXVsdA0KPiDCoGZvciBCTUcg
YW5kIENSSSBwbGF0Zm9ybXMuDQo+IA0KPiDCoFNldHRpbmcgdGhpcyBmcmVxdWVuY3kgZmxvb3Io
MS4yR0h6KSBkZWZhdWx0IGlzIGNyaXRpY2FsIGluIG11bHRpDQo+IEdQVQ0KPiDCoGVudmlyb25t
ZW50IGZvciBzdXBwb3J0aW5nIGVmZmVjdGl2ZSBQZWVyLXRvLVBlZXIoUDJQKSB0cmFuc2FjdGlv
bnMuDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBOYXJlc2hrdW1hciBHb2xsYWtvdGkgPG5hcmVzaC5r
dW1hci5nQGludGVsLmNvbT4NCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19w
Yy5jIHwgOSArKysrKysrKy0NCj4gwqAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCAx
IGRlbGV0aW9uKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1
Y19wYy5jDQo+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jDQo+IGluZGV4IDVlNTQ5
NWEzOWEzYy4uODgxMDU0YzljZjkyIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZ3VjX3BjLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2d1Y19wYy5jDQo+IEBA
IC04NjAsNiArODYwLDcgQEAgc3RhdGljIGludCBwY19hZGp1c3RfZnJlcV9ib3VuZHMoc3RydWN0
IHhlX2d1Y19wYw0KPiAqcGMpDQo+IMKgew0KPiDCoAlzdHJ1Y3QgeGVfdGlsZSAqdGlsZSA9IGd0
X3RvX3RpbGUocGNfdG9fZ3QocGMpKTsNCj4gwqAJaW50IHJldDsNCj4gKwlzdHJ1Y3QgeGVfZGV2
aWNlICp4ZSA9IHBjX3RvX3hlKHBjKTsNCj4gwqANCj4gwqAJbG9ja2RlcF9hc3NlcnRfaGVsZCgm
cGMtPmZyZXFfbG9jayk7DQo+IMKgDQo+IEBAIC04ODUsNyArODg2LDEzIEBAIHN0YXRpYyBpbnQg
cGNfYWRqdXN0X2ZyZXFfYm91bmRzKHN0cnVjdA0KPiB4ZV9ndWNfcGMgKnBjKQ0KPiDCoAlpZiAo
cGNfZ2V0X21pbl9mcmVxKHBjKSA+IHBjLT5ycDBfZnJlcSkNCj4gwqAJCXJldCA9IHBjX3NldF9t
aW5fZnJlcShwYywgcGMtPnJwMF9mcmVxKTsNCj4gwqANCj4gLQlpZiAoWEVfREVWSUNFX1dBKHRp
bGVfdG9feGUodGlsZSksIDE0MDIyMDg1ODkwKSkNCj4gKwkvKg0KPiArCSAqIFNldHRpbmcgR1Qg
UlAgbWluIGZyZXF1ZW5jeSB0byAxLjJHSHogYnkgZGVmYXVsdCBmb3INCj4gKwkgKiBhbGwgQk1H
IGFuZCBDUkkoRm9yIEJNRyBHMjEgV0EgZG8gdGhlIHNhbWUpLg0KPiArCSAqLw0KPiArCWlmIChY
RV9ERVZJQ0VfV0EodGlsZV90b194ZSh0aWxlKSwgMTQwMjIwODU4OTApIHx8DQo+ICsJwqDCoMKg
ICh4ZS0+aW5mby5wbGF0Zm9ybSA9PSBYRV9CQVRUTEVNQUdFIHx8DQo+ICsJCQkgeGUtPmluZm8u
cGxhdGZvcm0gPT0gWEVfQ1JFU0NFTlRJU0xBTkQpKQ0KPiDCoAkJcmV0ID0gcGNfc2V0X21pbl9m
cmVxKHBjLCBtYXgoQk1HX01JTl9GUkVRLA0KPiBwY19nZXRfbWluX2ZyZXEocGMpKSk7DQoNCkNv
cHlpbmcgdGhlIHJlcGx5IGdpdmVuIHRvIHRoZSBjb3ZlciBsZXR0ZXIgZm9yIGNvbXBsZXRlbmVz
czoNCg0KV2Fzbid0IHRoZSBpZGVhIHRvIGRvIHRoaXMgb25seSBmb3IgdGhlIEFyYyBQUk8gQk1H
cyAoc2VydmVyIFNLVXMpPw0KUGVyaGFwcyB0aGUgY29tcHV0ZSB0ZWFtIHdvdWxkIHdhbnQgdG8g
Y2hpbWUgaW4gaGVyZSBmb3IgdGhlIHNjb3BlIG9mDQp0aGlzIHdvcmthcm91bmQuDQoNClRoYW5r
cywNClRob21hcw0KDQoNCg0KDQoNCj4gwqANCj4gwqBvdXQ6DQo=
