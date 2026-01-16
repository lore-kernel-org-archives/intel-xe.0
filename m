Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331DCD47CA4
	for <intel-xe@archiver.kernel.org>; Fri, 16 Jan 2026 00:29:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC4C610E0B4;
	Fri, 16 Jan 2026 00:29:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X1+nxxup";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 748F810E0B4
 for <intel-xe@lists.freedesktop.org>; Fri, 16 Jan 2026 00:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768523385; x=1800059385;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Ct4bejf7QWvp0eYNqID8LUw2RzZv9YRABnSWPAqRg6Y=;
 b=X1+nxxupgLdEIJMUqAPYksnQlWRtUw1XLs9b4M06kvXgc0MFt5J7Co81
 Ro06AmMegSahnXx9sXjqKz794h8UvOHfanxc0Fpp/wGjWVECyT76SKI7c
 UIED48WI6BMPZXDoHmenjWlx+xebcdmXp77G9cG40aU/ih2wdL8O9oldp
 5FSk2lYgM2RtzoYWbRcSaVF0uSxjbPbXNbmAQ4pVHjzjV37V5k350jI0+
 b+nOn2HvQp4vLMRFYlYcAXmouHOlcPlIh0oZrdy8+V/e8f7KKHjIr5Ild
 /61wl2xOFHIgK2PZalzBJ4LmVwZKLt91bFExFn9r6gcGXIjZ3lIa/JgRB w==;
X-CSE-ConnectionGUID: jINWOcjnTfeoQrUbX6C+ug==
X-CSE-MsgGUID: UR5VYLGaS+qLiz5RuHK7Tg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="69745184"
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="69745184"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 16:29:45 -0800
X-CSE-ConnectionGUID: aGjv40JZS5aMJKgeB6+2Uw==
X-CSE-MsgGUID: EqMrcRPYR5eczTjILYFlCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,229,1763452800"; d="scan'208";a="205154154"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2026 16:29:45 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 16:29:44 -0800
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 15 Jan 2026 16:29:44 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.3) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 15 Jan 2026 16:29:42 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TC1NXXcnkczWrS6NzHvbkRvrRerXyBdIL6WmpQ2j20NshDpp6YkjbON9RiZ2N3e6N81KxZ9m2yeMELaHC3339groGh0b7T6L4goEeoGV+Bp8zPkIYa/qHEptWO49+uKP7P6320/fj4wuV8BDPEbeAIvvMDmZe3V085eSjSZFnyt5+ZGRE0HyoCFRDHVzh10BdUmylIFGO3k7cqnEysZYsvG1Ty+acjGOEik67xNp4UFAKt8HgH/PoYfpwyDahKH64WZUSjoiDhlI+uNqBgkSLzP8WuMHwgjtaMhqquEXI+rImKV/whb4jjBHg0B9UhtXnknqhCz2xhS4TpvNBQkjeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ct4bejf7QWvp0eYNqID8LUw2RzZv9YRABnSWPAqRg6Y=;
 b=Go6MdcfePNN+YDsMvWBOEcROvy5beQ8WR7J3dMTWr2t97tHN/Hp7fzLiQVGhE1gS5G3KoxbYejEU+ZWPXZKN97WYbUYG23KNR/kAuhgITs1xLZS+uDqUxx4XewATnxl8R955cr5BMNDc7zygAoBeBu1tyBR+N2h5+HzubwLJ8qN+Hw/6rxpA5hzDBTx4AxGe8Ys1BVi8Jb5iyhMBkRyQKN6D6RJ9fnjZ9ZIv1AksoNBUqBKthCPHb6CPbX6F7iev4n4qDxDtEijmsszifApLt5ndhycD+bM6eSDxsQc1jXaxNencMm3u4CExCEMJsNuFnWF/R6ZOxBJkoGpU7Gv6hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 SN7PR11MB7465.namprd11.prod.outlook.com (2603:10b6:806:34e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Fri, 16 Jan
 2026 00:29:39 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::6a14:6aa3:4339:4415%4]) with mapi id 15.20.9520.005; Fri, 16 Jan 2026
 00:29:39 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "akshata.jahagirdar@intel.com" <akshata.jahagirdar@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Add feature to force ring-based TLB
 invalidations
Thread-Topic: [PATCH 1/2] drm/xe: Add feature to force ring-based TLB
 invalidations
Thread-Index: AQHchOlmdfSzX70QJU6H3BrwbsTFm7VRAW0AgAAD3QCAAQc1gIAB6BAA
Date: Fri, 16 Jan 2026 00:29:39 +0000
Message-ID: <b882c78633882edb5bc58484a14d7ac4961bace8.camel@intel.com>
References: <20260114000421.331082-1-stuart.summers@intel.com>
 <20260114000421.331082-2-stuart.summers@intel.com>
 <aWcM/ODpvs403f0z@lstrano-desk.jf.intel.com>
 <aWcQOi7D0j4t2BDS@lstrano-desk.jf.intel.com>
 <ee273674df85ccd5435c9f03d1043212718df8cb.camel@intel.com>
In-Reply-To: <ee273674df85ccd5435c9f03d1043212718df8cb.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|SN7PR11MB7465:EE_
x-ms-office365-filtering-correlation-id: 9e275ffc-4750-4491-930e-08de549655ad
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|376014|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?MUF4Zkp1M29IN1lIY24ydVRsMGRxa1pSeEZ3Mk5YcDZkTHJoS0IzelBXNkpQ?=
 =?utf-8?B?RW5wMDUzWFNVV0tYVktlMTVqbDRTK3RxKzh3d3gyOHVaTFVESy9tcUJ5L1lU?=
 =?utf-8?B?cmdCelhDZ0EvVWNMdVZIR2dXQ1hqOU55OWxyWWdXdTZPcnROMGhGU3h6ZEpR?=
 =?utf-8?B?Zjg1RHo4WVhuOWNweVRqSVd5MllndmVNS0NheXdWVG9hZkZRamRSR1YxZ1o0?=
 =?utf-8?B?WEtKb2xXbEYyTTVKUXpZRk9zSzlWeE56MXZmbFNaV1lZZEg2OGtHYTdINjBH?=
 =?utf-8?B?N3N3NzRCUlUzdERRV25aeG5rd0JhazdtRi9Pa2FJVlE2WFo0Z3NiU2NkWGln?=
 =?utf-8?B?eWdKN2h3d05hKzFrWHNyOXUxWWNDcXpaWTVYRW1jcC9sbW5KUCtYcTd1cmFw?=
 =?utf-8?B?YkhkS3ZXTWZncEs5MEJ5QTRnU3QzYnNGU2R4RGI2NzNzNTg0ZU5rMmlVOXRz?=
 =?utf-8?B?REF5VHZqazdZdWVIN05iNXpMeHpIeDNnZjNXWS9od1ZPQ0VZMGpEM1ZreFpl?=
 =?utf-8?B?eHIrUmRCSDhHdlU1UmRBVDFZdnlTd0tkb2p2cnNwS1BlSnM0b2ErM1A2R21m?=
 =?utf-8?B?QW5WWEdDRnJpdFFhVjNmZVBlNmhpRG43T3E1ajBrTXpiWEcrZHN1M3Y1VDJY?=
 =?utf-8?B?UHo1ZEcxYVVVODQ2OURYcWxyd0djNS9UcEs2M0FUOXpWWDdYeWNkbERxZGxm?=
 =?utf-8?B?RUsyUmxzNXFrNDhKU1M4TExzd042WFRiYUplNysrblVjdHNoMG42OEJGUVJC?=
 =?utf-8?B?WTZidTMwMnNraW9YSFYwTDM3bGdYZ0VtWVEwTUxEcUpway8zS1BZdXo2MHRC?=
 =?utf-8?B?QlJvY2Z0N2VtM2hPYkw2d29sZEhFWElSYi91eUZKWXFkUUVJL28wTk9yNCt2?=
 =?utf-8?B?NE9uMzROc3R0UDRnNWJ0eE51a3BQYzZiZ2h0d0NIQzJyeGZvSlZ4UittbnB1?=
 =?utf-8?B?VXpOUFlsYzNiZmg3LzcrNmJPS1dwdE50YkxzdnBuMnI1TU9BSm8zU2huR0RD?=
 =?utf-8?B?aVBiQ0h6Um1WZllKUHJDSXptVGltTmVsdzVGK09NZVh1NFhEb3pUcEk1QnBr?=
 =?utf-8?B?V2ZKQkdRYWZKNllDRENSQWpwc0JUTDUzajYvRmlDZ3Zzd1hxSHNTajMrMlNv?=
 =?utf-8?B?bWF2Mjk2clJFVWhHdmlsUkd4SFZQeUZBcXBhY2pEUlV5M0dQWFBRTXNrbmpa?=
 =?utf-8?B?QnNSMHd1amF6ZWRWUEZNd2dRTGFvMENwRExIMTJBQVRwMzMwbE42MVBOTzgx?=
 =?utf-8?B?OStWK0hld3l1Q3lJeUFxWUZDbTZDUU9YK0FrNWN4NnNKWGFZemxNWGlvUkxZ?=
 =?utf-8?B?TFdpeXdXN3FpSzBuTDJKN3FkMHZtVW13RWpuTEdycWp5OS83VEZWOThLd1h3?=
 =?utf-8?B?UFNIUE5IT0s3aVZMdVMwR3lQZkxrcEJ3ejdJWWhKZlowcXFLc1Ewdjl0ZlNp?=
 =?utf-8?B?SUZQK0RzZk1zMDIvZHpuUys0WVV3MTY5czJtcTRkRjV6NURCZTVGRVQ5S3Ba?=
 =?utf-8?B?WkJ4N01wcnRlRExZK2lEMlVCbXBkRnBUUk1FWGVQc2NoamRhM01oYlhJdE9p?=
 =?utf-8?B?bWsvYWgzUkhGbGhOeUxzOExDQnNvWUEwYldZQkQ1YStZWFlpalRYS3pnQmcv?=
 =?utf-8?B?Y29WdkVMb0pIbUp2UlBULzJhcmdUVHNuMFNWUjZLczBEV2dQR1gvRCtkTXlM?=
 =?utf-8?B?a3czNkxlNjJCa2x6MGg2U1pBbUtadU84U2FOQXNGaG1keTlOaVhvTVBGRy9S?=
 =?utf-8?B?UjFGTWo1ZUI2MmlRbkFUbGhyNjVLdm1nd3Y5TEhieFpqbGMyK0JsbUd0Zkls?=
 =?utf-8?B?SmZUWnNsSkpwdlc5Q0hNT1BOTURsMXM1cmpWSXg1WGRxcHY5ZUdvTjB5bHBt?=
 =?utf-8?B?N2hkY0tSZmpaS1FhSlk0SWhZNVRSSk9vaHVhK3BTRTBIQm13M2VXN2dPTVpB?=
 =?utf-8?B?d3V1RWJtdzczakhSQkM1OE1UNVV5S0pkdVlvbUZwMXl4R0dUcVZMdHZwTTF6?=
 =?utf-8?B?eXhEcTUyOXFLb1ZSQmw2Qld5dng4MVlvbllBV2tia09TbmN5UElpK3RaMTNI?=
 =?utf-8?B?cDU4dDQ2aXI3cndLYlBLeXpUU1h5QW5jSmo4K3lYak1JMlZId25nU21DSWln?=
 =?utf-8?Q?zEGI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a1BVOS92dURWb1NtaFRBUWNXT25EdkhNZGNmbjFYTjU4R01pZFNYNTlDRUxP?=
 =?utf-8?B?MWp2em0wczFPd2E5ZDZQU1BFVUtXZ0VrM0NMbHNDL3RkV25ueGQ4a3ZHRUhx?=
 =?utf-8?B?M3ppSEVYSGdTcU9KZkZVVmIrK2RuYjZIZjFmSHdHUmowVGNNWlE4Rjc2aDVi?=
 =?utf-8?B?QVRqOWwzclgvRU5RSVphQzFxVnRWUk1jT3cySFFWRnFDTk0xQmdnZ29Bb2lJ?=
 =?utf-8?B?Y1V0YU85dDc0ZTJSdHhMYmpWeCtzUklxRmlQSlFhM25mU1hvUGpGZkNsM2tT?=
 =?utf-8?B?TEZsL2hISmJBQkhzV3cwd1VGeGg3YjA4ZFNWbkhKM3hQYzJob3dkaHhWd1R2?=
 =?utf-8?B?Q1ZXZmU4Q1lEeGYwOUJXTVVUM2dPVmRXZUsrWC9GYTQ0cFBxYXdSc2lhRnVH?=
 =?utf-8?B?SERWaU1zbzhNY0MzeE1rVjJPdk9yM0llbDRCOWJOaFBXYXBqSTNnVWtEZnZn?=
 =?utf-8?B?ajV5NkpXMnVNOStmb1o2ZnRiVmM0R04rcXdMekM4QU1GRVpKWDJUSmErYlFF?=
 =?utf-8?B?amF5bWpvWlArTW5QMEtQUFliT21Mamw5V3FueGovMnFDZWh6SWpkZTQzUk1G?=
 =?utf-8?B?bWxvYXdiUHdhaTVkanJOcVVyS1lTVGlsS3VDbHhDeitiUXBDSjlORUdEMmdM?=
 =?utf-8?B?clBlZWp3Wnd0aXpNTWJ6eVpTTUQ4YkFGdlkwRDQ1dWIwaTRsMzZ0SjBTa1NR?=
 =?utf-8?B?bzFYU2orM0lXc1hxbE56VVNhUlpIbXRXOHJJVFJJUjdiOGZZNzBMb0J6MmZp?=
 =?utf-8?B?ditaSTRrRk8rd1Q1WmRJVm1uVXF4Q3ZIVHJweExrSGw4UzlGVDBCQ3NjTGhy?=
 =?utf-8?B?UGROWnZFQWxuQk4zWGxza09jcVNQSUh3V2xBajNsZE5JT2tzM1B4b1k3RDA3?=
 =?utf-8?B?bnozenZrVlFGbVJBNFFTQkh4eVkwZTM5LzFoL0hzNlRtQnd4dUdldmhPNEIv?=
 =?utf-8?B?bHpleTVYTUNtYUdHNCtocUhBRnFHSWhnZ0FqaFpHbHlvT3JGRm9SU0s4WFUy?=
 =?utf-8?B?K3gxN2N5YlpqMVpDVUdrSEUwZllKMUd4K2d3dGk1SzJ3WTM0S29obXYwZHVn?=
 =?utf-8?B?bEJ5cG5xeitYd0F4SmRBb1NwV3h3dmhHdkpKYldUT0hiQjN2eXQ1Z1hYUm5I?=
 =?utf-8?B?REo4VFZNZDBMYnBaSFM0clhkcGE5S3hoaVlNaStmdVkvU2pQV2ZjWHhoWHIy?=
 =?utf-8?B?dGFsNmszRGpmWDBzbDhpdDQ4UThTeGRCL0lTWnpQVU1Ja0c0aStjNk5mU1pC?=
 =?utf-8?B?Ulk4cndDRkw5RER2YUpxVFdLMmNBUGxsVDZiMzdQM2crbDZZa3RIU01xTGQ4?=
 =?utf-8?B?TXFNdThjampOU2dxTkkyOGlOTUVnZXJDVS9UU1pWRGZSM3gvMGFQSFhSaDZK?=
 =?utf-8?B?N05ja3FPRHJ0UEJaaE9hYkxYUWlLdjVoZW9vdU85TWlwMkRnVUdUeitnblR3?=
 =?utf-8?B?TGd0REs3Zy80clp0WjU0MnFQSEZMM2M0WjdSNms4ek0rRVB6QytYZTZ6djBa?=
 =?utf-8?B?R1h6N0N6NXNjY3hCcXdsM25OcncrMlZKaGdocy83by9BTVpmbFloRUVCeWFL?=
 =?utf-8?B?bkNhcW1YSjQ3TVFrSE4rRTg4TFFKWWVaZldLeXExQnRyZy84QTZIampaMmdw?=
 =?utf-8?B?Nm5neVljVE5WQ1E0L1pUVXE2Zmg2QU9DY1RnbHJkSTBiYnVFL2dDS21NMWN3?=
 =?utf-8?B?WFJJQWRyQkphcXJ2YUF2Z0kyOW9YdFZYN3FjRlNMU29YdlJiazlYZXpETVlM?=
 =?utf-8?B?ay9Gc2tWbWFEcGV4cWRtZUU2MmduQlhPZkFlQTQ3QXlXTDNseEZvQXNEc2dP?=
 =?utf-8?B?bjRwV3MwQWJ0RHdoMGRqRXVWNCt4cjhkak51Y1NSb0R6VXJmOUNLL3kzR01K?=
 =?utf-8?B?RUNHQkRNaEpXVS9JMzIwY003R1E4RkFJSlU0cmpOZlROTnlVQUsxdm43VGpV?=
 =?utf-8?B?UGhNZ0tvaUtaOCtsRWlzSDh0MDhkclMxU3U0Y0JPcWUzcHJhVmNUK3VORUtj?=
 =?utf-8?B?RE9aYWlsTTU0akNKS0lzajFCL09DZW8zUDY1di9vdWxWNC84T2ppUFlFbURS?=
 =?utf-8?B?cVdvelFvT21ZMG5CWmMxQ0tOMlNqRFo4d2pPUi9tSWYrRUtQVGJUdTZacnFm?=
 =?utf-8?B?V0tQenlnWkdnczNBeFkrOEVrazZDNVdON3JXdFkrMHN5UXBNZDJLekRhSlJQ?=
 =?utf-8?B?Tk5MMnFlNWM2RmJvSGVYQWRsZytVR0ZBQ1ZUTERqNjVGa2Rnd1hsY2QrYzdG?=
 =?utf-8?B?dmtJSC9NUXBHSm4ra0MrM2NkZXlBc05LUHIxQU9VeW1sS2x5bDVsS1ladHdG?=
 =?utf-8?B?L3JBQjdqMlExenBlV0wyN0hkQThzUlY1WHVPMjk4QktIc05GUlRmTXA4SlRE?=
 =?utf-8?Q?51bhvOEERbAt0a6M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <25F2851A7A7B8248BBEA47299C5DCB45@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e275ffc-4750-4491-930e-08de549655ad
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2026 00:29:39.1844 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 938QFSIkntFsFS7ZdFK2lnZe1HzbA+5y/0xeesIMcpx73DFWysY6sl4biWNdDXHx+ZrCmCxmy5GMJkkrUXVlqjRmkjY0JKN9tcfO43H/7hQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7465
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

T24gV2VkLCAyMDI2LTAxLTE0IGF0IDE5OjIyICswMDAwLCBTdW1tZXJzLCBTdHVhcnQgd3JvdGU6
DQo+IE9uIFR1ZSwgMjAyNi0wMS0xMyBhdCAxOTo0MCAtMDgwMCwgTWF0dGhldyBCcm9zdCB3cm90
ZToNCj4gPiBPbiBUdWUsIEphbiAxMywgMjAyNiBhdCAwNzoyNjo1MlBNIC0wODAwLCBNYXR0aGV3
IEJyb3N0IHdyb3RlOg0KPiA+ID4gT24gV2VkLCBKYW4gMTQsIDIwMjYgYXQgMTI6MDQ6MjBBTSAr
MDAwMCwgU3R1YXJ0IFN1bW1lcnMgd3JvdGU6DQo+ID4gPiA+IEN1cnJlbnQgaGFyZHdhcmUgZG9l
cyBhbiBpbXBsaWNpdCBUTEIgaW52YWxpZGF0aW9uIG9uDQo+ID4gPiA+IGNvbnRleHQgc3dpdGNo
LiBUaGlzIGlzIHJlcXVpcmVkIGZvciB2YXJpb3VzIHVzZSBjYXNlcyBsaWtlDQo+ID4gPiA+IHBy
ZWVtcHQgZmVuY2VzIHdoZXJlIGEgY29udGV4dCBzd2l0Y2ggd2lsbCBoYXBwZW4gd2l0aG91dA0K
PiA+ID4gPiBhbnkgZXhwbGljaXQgVExCIGludmFsaWRhdGlvbiBmcm9tIHRoZSBLTUQuDQo+ID4g
PiA+IA0KPiA+ID4gPiBBZGQgYSBob29rIHRvIG1ha2UgdGhpcyBleHBsaWNpdCBhcyBwYXJ0IG9m
IHRoZSByaW5nDQo+ID4gPiA+IHByaW9yIHRvIGJhdGNoIGV4ZWN1dGlvbiB0byBhbGxvdyBmb3Ig
bW9yZSBleHBsaWNpdCB0ZXN0aW5nDQo+ID4gPiA+IGFuZCBzZXF1ZW5jaW5nIG9mIHVzZXIgYmF0
Y2ggZXhlY3V0aW9uLg0KPiA+ID4gPiANCj4gPiA+IA0KPiA+ID4gSSBkb24ndCB0aGlzIHBhdGNo
IGlzIG5lZWRlZCByYXRoZXIgdGhpcyBhbiBleGlzdGluZyBidWcgaW4NCj4gPiA+IHhlX3B0LmMu
Li4NCj4gPiA+IA0KPiA+ID4gMTk3NMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlm
ICgoIXB0X29wLT5yZWJpbmQgJiYgeGVfdm1faGFzX3NjcmF0Y2godm0pDQo+ID4gPiAmJg0KPiA+
ID4gMTk3NcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZV92bV9p
bl9scl9tb2RlKHZtKSkpDQo+ID4gPiAxOTc2wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHB0X3VwZGF0ZV9vcHMtPm5lZWRzX2ludmFsaWRhdGlvbiA9DQo+
ID4gPiB0cnVlOw0KPiA+ID4gMTk3N8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVs
c2UgaWYgKHB0X29wLT5yZWJpbmQgJiYNCj4gPiA+ICF4ZV92bV9pbl9scl9tb2RlKHZtKSkNCj4g
PiA+IDE5NzjCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LyogV2UgYnVtcCBhbHNvIGlmDQo+ID4gPiBiYXRjaF9pbnZhbGlkYXRlX3RsYiBpcyB0cnVlICov
DQo+ID4gPiAxOTc5wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHZtLT50bGJfZmx1c2hfc2Vxbm8rKzsNCj4gPiA+IA0KPiA+ID4gSSBiZWxpZXZlIHdlIGFs
c28gbmVlZCB0aGlzIGF0IHRoZSBlbmQ6DQo+ID4gPiANCj4gPiA+IGVsc2UgaWYgKHB0X29wLT5y
ZWJpbmQpDQo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgcHRfdXBkYXRlX29wcy0+bmVlZHNfaW52YWxp
ZGF0aW9uID0gdHJ1ZTsNCj4gPiA+IA0KPiA+IA0KPiA+IFVnaCwgYWN0dWFsbHkgdGhpcyBpc24n
dCByaWdodCBlaXRoZXIgdGhpcyB3aWxsIGlzc3VlIGEgVExCDQo+ID4gaW52YWxpZGF0aW9uDQo+
ID4gb24gcGFnZSBmYXVsdCBmaXggb3IgVkYgcmVzdW1lIHdoaWNoIGlzbnQgcmlnaHQgZWl0aGVy
Lg0KPiA+IA0KPiA+IEkgdGhpbmsgaXQgaXMgdGhlIHJpZ2h0IGJlaGF2aW9yIGZvciBWTSBiaW5k
IElPQ1RMcywgYnV0IG5vdyB0aGF0IEkNCj4gPiB0aGluayBhYm91dCBpdCB3ZSdkIGdldCBhIFVO
TUFQIG9wIHRoZXJlIHdoaWNoIHdvdWxkIHNldA0KPiA+IG5lZWRzX2ludmFsaWRhdGlvbiAtIG9u
bHkgb24gcGFnZSBmYXVsdCBmaXggb3IgVkYgcmVzdW1lIG9yIGV4ZWMNCj4gPiBJT0NUTA0KPiA+
IHBhZ2UgZml4dXAgd2Ugb25seSBpc3N1ZSBhIE1BUCBvcCAtIHRoZSBsYXR0ZXIgY29ycmVjdGx5
IGluY3JlbWVudHMNCj4gPiB0bGJfZmx1c2hfc2Vxbm8uIFRoZSBwcmlvciBjYXNlcyB3ZSBhc3N1
bWUgbm8gaW52YWxpZGF0aW9uIGlzDQo+ID4gbmVlZGVkDQo+ID4gYnV0DQo+ID4gYSBpbnZhbGlk
YXRpb24gYXQgc3RhcnQgb2YgYmF0Y2ggd291bGRuJ3QgaGVscCBpbiBhbGwgY2FzZXMgdGhlcmUN
Cj4gPiBlaXRoZXIuDQo+ID4gDQo+ID4gPiBNeSBxdWVzdGlvbiBpczogZG9lcyB0aGlzIHBhdGNo
IGludGVybmFsbHkgY2hhbmdlIGZhaWx1cmUgcmF0ZXM/DQo+ID4gPiBJZg0KPiA+ID4gc28sDQo+
ID4gPiBJIGJlbGlldmUgaW1wbGljaXQgVExCIGludmFsaWRhdGlvbiBpcyBoaWRpbmcgYSBidWcg
aW4gdGhlDQo+ID4gPiBjdXJyZW50DQo+ID4gPiBJR1Qgc3VpdGUvS01EL2hhcmR3YXJlIHRoYXQg
anVzdCBoYXNu4oCZdCBiZWVuIGNhdWdodCB5ZXQuDQo+ID4gPiANCj4gPiANCj4gPiBTbyBsZXQn
cyBzdGFydCBoZXJlLg0KPiANCj4gT2sgc28ganVzdCB0byBiZSBjbGVhciwgaXMgdGhlIGV4cGVj
dGF0aW9uIGhlcmUgdGhhdCB3ZSBhcmVuJ3QgZG9pbmcNCj4gYW55IGltcGxpY2l0IFRMQiBpbnZh
bGlkYXRpb25zIGdlbmVyYWxseT8gT3IgYXJlIHRoZXJlIHNwZWNpZmljIGNhc2VzDQo+IHdoZXJl
IHdlIHdhbnQgdG8gcmVseSBvbiB0aGVzZSAobGlrZSBwcmVlbXB0IGZlbmNlcykgYW5kIGFueSBv
dGhlcg0KPiBjYXNlcyB3aGVyZSB3ZSBhcmVuJ3QgZG9pbmcgdGhpcyBleHBsaWNpdGx5IGlzIGNv
bnNpZGVyZWQgYSBidWc/DQoNCk9rIEkgaGFkIG1lbnRpb25lZCBpbiByZXZpZXcgY29tbWVudHMg
dG8gWzFdLCBidXQgdGhpcyBpcyBkZWZpbml0ZWx5DQpyZXF1aXJlZCBmcm9tIG15IHRlc3Rpbmcg
dG9kYXkgYXQgbGVhc3QgLSB3aXRob3V0IGFueSBvdGhlciBmaXhlcy4NCg0KSSdkIGtpbmQgb2Yg
bGlrZSB0byBtb3ZlIGZvcndhcmQgd2l0aCBbMV0gaWYgcG9zc2libGUgdGhvdWdoLiBXaGF0IGRv
DQp5b3UgdGhpbmsgb2YgaW5jbHVkaW5nIHRoaXMgc2VyaWVzIG9uIHRvcCBmdW5jdGlvbmFsbHkg
YW5kIHRoZW4gZm9sbG93DQp1cCB3aXRoIHRoZSBmdWxsIGZpeGVzIGxhdGVyIHNvIHdlIHJlbW92
ZSB0aGUgcmluZy1iYXNlZCBpbnZhbGlkYXRpb25zPw0KVGhlc2UgYXJlIGhlbGQgdW5kZXIgYW4g
dW51c2VkIChvdXRzaWRlIG9mIHRoZSBmb3ItY2kgcGF0Y2ggaW4gdGhpcw0Kc2VyaWVzKSBmZWF0
dXJlIGZsYWcgYW5kIG9mIGNvdXJzZSBubyBkaXJlY3QgdXNlciBpbnRlcmZhY2UuDQoNCkxldCBt
ZSBrbm93IHdoYXQgeW91IHRoaW5rLg0KDQpUaGFua3MsDQpTdHVhcnQNCg0KWzFdOiBodHRwczov
L3BhdGNod29yay5mcmVlZGVza3RvcC5vcmcvc2VyaWVzLzE1Njg3NC8jcmV2NA0KDQo+IA0KPiBU
aGFua3MsDQo+IFN0dWFydA0KPiANCj4gPiANCj4gPiA+IE1hdHQNCj4gPiA+IA0KPiA+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBBa3NoYXRhIEphaGFnaXJkYXINCj4gPiA+ID4gPGFrc2hhdGEuamFoYWdp
cmRhckBpbnRlbC5jb20+DQo+ID4gPiA+IFNpZ25lZC1vZmYtYnk6IFN0dWFydCBTdW1tZXJzIDxz
dHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQo+ID4gPiA+IC0tLQ0KPiA+ID4gPiDCoGRyaXZlcnMv
Z3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaCB8IDIgKysNCj4gPiA+ID4gwqBkcml2ZXJzL2dw
dS9kcm0veGUveGVfcGNpLmPCoMKgwqDCoMKgwqDCoMKgwqAgfCAxICsNCj4gPiA+ID4gwqBkcml2
ZXJzL2dwdS9kcm0veGUveGVfcGNpX3R5cGVzLmjCoMKgwqAgfCAxICsNCj4gPiA+ID4gwqBkcml2
ZXJzL2dwdS9kcm0veGUveGVfc2NoZWRfam9iLmPCoMKgwqAgfCA3ICsrKysrLS0NCj4gPiA+ID4g
wqBkcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uY8KgwqDCoMKgwqDCoMKgwqDCoMKgIHwgMyArKysN
Cj4gPiA+ID4gwqA1IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pDQo+ID4gPiA+IA0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X2RldmljZV90eXBlcy5oDQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90
eXBlcy5oDQo+ID4gPiA+IGluZGV4IGY2ODk3NjZhZGNiMS4uZmExOTNlMGI5MDZkIDEwMDY0NA0K
PiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gPiA+
ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+ID4gPiA+IEBA
IC0zNTUsNiArMzU1LDggQEAgc3RydWN0IHhlX2RldmljZSB7DQo+ID4gPiA+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgdTggaGFzX3B4cDoxOw0KPiA+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoC8qKiBAaW5mby5oYXNfcmFuZ2VfdGxiX2ludmFsOiBIYXMgcmFu
Z2UgYmFzZWQNCj4gPiA+ID4gVExCIGludmFsaWRhdGlvbnMgKi8NCj4gPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB1OCBoYXNfcmFuZ2VfdGxiX2ludmFsOjE7DQo+ID4gPiA+
ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiogQGluZm8uaGFzX3JpbmdfdGxiX2lu
dmFsOiBQZXJmb3JtcyBUTEINCj4gPiA+ID4gaW52YWxpZGF0aW9ucyBvbiBjb250ZXh0IHN3aXRj
aCAqLw0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdTggaGFzX3Jpbmdf
dGxiX2ludmFsOjE7DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyoq
IEBpbmZvLmhhc19zb2NfcmVtYXBwZXJfc3lzY3RybDogSGFzIFNvQw0KPiA+ID4gPiByZW1hcHBl
ciBzeXN0ZW0gY29udHJvbGxlciAqLw0KPiA+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoHU4IGhhc19zb2NfcmVtYXBwZXJfc3lzY3RybDoxOw0KPiA+ID4gPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoC8qKiBAaW5mby5oYXNfc29jX3JlbWFwcGVyX3RlbGVtOiBI
YXMgU29DDQo+ID4gPiA+IHJlbWFwcGVyIHRlbGVtZXRyeSBzdXBwb3J0ICovDQo+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4gPiA+ID4gYi9kcml2ZXJz
L2dwdS9kcm0veGUveGVfcGNpLmMNCj4gPiA+ID4gaW5kZXggNWM3MDUxMjQyNzBlLi5hMmNlOWRh
MmUzY2IgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2kuYw0K
PiA+ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcGNpLmMNCj4gPiA+ID4gQEAgLTg5
Myw2ICs4OTMsNyBAQCBzdGF0aWMgaW50IHhlX2luZm9faW5pdChzdHJ1Y3QgeGVfZGV2aWNlDQo+
ID4gPiA+ICp4ZSwNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZS0+
aW5mby5oYXNfZGV2aWNlX2F0b21pY3Nfb25fc21lbSA9IDE7DQo+ID4gPiA+IMKgDQo+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgwqB4ZS0+aW5mby5oYXNfcmFuZ2VfdGxiX2ludmFsID0gZ3JhcGhpY3Nf
ZGVzYy0NCj4gPiA+ID4gPiBoYXNfcmFuZ2VfdGxiX2ludmFsOw0KPiA+ID4gPiArwqDCoMKgwqDC
oMKgwqB4ZS0+aW5mby5oYXNfcmluZ190bGJfaW52YWwgPSBncmFwaGljc19kZXNjLQ0KPiA+ID4g
PiA+IGhhc19yaW5nX3RsYl9pbnZhbDsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHhlLT5pbmZv
Lmhhc191c20gPSBncmFwaGljc19kZXNjLT5oYXNfdXNtOw0KPiA+ID4gPiDCoMKgwqDCoMKgwqDC
oMKgeGUtPmluZm8uaGFzXzY0Yml0X3RpbWVzdGFtcCA9IGdyYXBoaWNzX2Rlc2MtDQo+ID4gPiA+
ID4gaGFzXzY0Yml0X3RpbWVzdGFtcDsNCj4gPiA+ID4gwqANCj4gPiA+ID4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2lfdHlwZXMuaA0KPiA+ID4gPiBiL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9wY2lfdHlwZXMuaA0KPiA+ID4gPiBpbmRleCAyMGFjYzUzNDllZTYuLjc4M2Vi
ZGE2ZWFlMSAxMDA2NDQNCj4gPiA+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3BjaV90
eXBlcy5oDQo+ID4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wY2lfdHlwZXMuaA0K
PiA+ID4gPiBAQCAtNzIsNiArNzIsNyBAQCBzdHJ1Y3QgeGVfZ3JhcGhpY3NfZGVzYyB7DQo+ID4g
PiA+IMKgwqDCoMKgwqDCoMKgwqB1OCBoYXNfYXRvbWljX2VuYWJsZV9wdGVfYml0OjE7DQo+ID4g
PiA+IMKgwqDCoMKgwqDCoMKgwqB1OCBoYXNfaW5kaXJlY3RfcmluZ19zdGF0ZToxOw0KPiA+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgdTggaGFzX3JhbmdlX3RsYl9pbnZhbDoxOw0KPiA+ID4gPiArwqDC
oMKgwqDCoMKgwqB1OCBoYXNfcmluZ190bGJfaW52YWw6MTsNCj4gPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoHU4IGhhc191c206MTsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoHU4IGhhc182NGJpdF90
aW1lc3RhbXA6MTsNCj4gPiA+ID4gwqB9Ow0KPiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL3hlL3hlX3NjaGVkX2pvYi5jDQo+ID4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hl
X3NjaGVkX2pvYi5jDQo+ID4gPiA+IGluZGV4IDM5YWVjN2Y2ZDg2ZC4uYzNiM2Q5YzU2ZGJiIDEw
MDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfc2NoZWRfam9iLmMNCj4g
PiA+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3NjaGVkX2pvYi5jDQo+ID4gPiA+IEBA
IC0yNDYsNiArMjQ2LDcgQEAgYm9vbCB4ZV9zY2hlZF9qb2JfY29tcGxldGVkKHN0cnVjdA0KPiA+
ID4gPiB4ZV9zY2hlZF9qb2IgKmpvYikNCj4gPiA+ID4gwqB2b2lkIHhlX3NjaGVkX2pvYl9hcm0o
c3RydWN0IHhlX3NjaGVkX2pvYiAqam9iKQ0KPiA+ID4gPiDCoHsNCj4gPiA+ID4gwqDCoMKgwqDC
oMKgwqDCoHN0cnVjdCB4ZV9leGVjX3F1ZXVlICpxID0gam9iLT5xOw0KPiA+ID4gPiArwqDCoMKg
wqDCoMKgwqBzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IGd0X3RvX3hlKHEtPmd0KTsNCj4gPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBkbWFfZmVuY2UgKmZlbmNlLCAqcHJldjsNCj4gPiA+ID4g
wqDCoMKgwqDCoMKgwqDCoHN0cnVjdCB4ZV92bSAqdm0gPSBxLT52bTsNCj4gPiA+ID4gwqDCoMKg
wqDCoMKgwqDCoHU2NCBzZXFubyA9IDA7DQo+ID4gPiA+IEBAIC0yNTksOSArMjYwLDExIEBAIHZv
aWQgeGVfc2NoZWRfam9iX2FybShzdHJ1Y3QgeGVfc2NoZWRfam9iDQo+ID4gPiA+ICpqb2IpDQo+
ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHhl
X3ZtX2Fzc2VydF9oZWxkKHEtPnZtKTsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoH0NCj4gPiA+
ID4gwqANCj4gPiA+ID4gLcKgwqDCoMKgwqDCoMKgaWYgKHZtICYmICF4ZV9zY2hlZF9qb2JfaXNf
bWlncmF0aW9uKHEpICYmDQo+ID4gPiA+ICF4ZV92bV9pbl9scl9tb2RlKHZtKSAmJg0KPiA+ID4g
PiArwqDCoMKgwqDCoMKgwqBpZiAodm0gJiYgIXhlX3NjaGVkX2pvYl9pc19taWdyYXRpb24ocSkg
JiYNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgICh4ZS0+aW5mby5oYXNfcmluZ190bGJf
aW52YWwgfHwNCj4gPiA+ID4gIXhlX3ZtX2luX2xyX21vZGUodm0pKSAmJg0KPiA+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgICh2bS0+YmF0Y2hfaW52YWxpZGF0ZV90bGIgfHwgdm0tPnRsYl9m
bHVzaF9zZXFubyAhPQ0KPiA+ID4gPiBxLT50bGJfZmx1c2hfc2Vxbm8pKSB7DQo+ID4gPiA+IC3C
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB4ZV92bV9hc3NlcnRfaGVsZCh2bSk7DQo+ID4g
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIXhlLT5pbmZvLmhhc19yaW5n
X3RsYl9pbnZhbCkNCj4gPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqB4ZV92bV9hc3NlcnRfaGVsZCh2bSk7DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgcS0+dGxiX2ZsdXNoX3NlcW5vID0gdm0tPnRsYl9mbHVzaF9zZXFu
bzsNCj4gPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBqb2ItPnJpbmdfb3Bz
X2ZsdXNoX3RsYiA9IHRydWU7DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqB9DQo+ID4gPiA+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+ID4gPiBiL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV92bS5jDQo+ID4gPiA+IGluZGV4IDY5NGY1OTJhMGYwMS4uOGUwYmEyZWJh
MjFlIDEwMDY0NA0KPiA+ID4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+
ID4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdm0uYw0KPiA+ID4gPiBAQCAtMTYxOSw2
ICsxNjE5LDkgQEAgc3RydWN0IHhlX3ZtICp4ZV92bV9jcmVhdGUoc3RydWN0DQo+ID4gPiA+IHhl
X2RldmljZQ0KPiA+ID4gPiAqeGUsIHUzMiBmbGFncywgc3RydWN0IHhlX2ZpbGUgKnhlZikNCj4g
PiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgdm0t
PmJhdGNoX2ludmFsaWRhdGVfdGxiID0gZmFsc2U7DQo+ID4gPiA+IMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgfQ0KPiA+ID4gPiDCoA0KPiA+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgaWYgKHhlLT5pbmZvLmhhc19yaW5nX3RsYl9pbnZhbCkNCj4gPiA+ID4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB2bS0+YmF0Y2hfaW52
YWxpZGF0ZV90bGIgPSB0cnVlOw0KPiA+IA0KPiA+IFRoaXMgZGVmaW5pdGVseSBpc27igJl0IHJp
Z2h0IG9yIGRlc2lyZWQuDQo+ID4gDQo+ID4gTWF0dA0KPiA+IA0KPiA+ID4gPiArDQo+ID4gPiA+
IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogRmlsbCBwdF9yb290IGFmdGVyIGFs
bG9jYXRpbmcgc2NyYXRjaCB0YWJsZXMNCj4gPiA+ID4gKi8NCj4gPiA+ID4gwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqBmb3JfZWFjaF90aWxlKHRpbGUsIHhlLCBpZCkgew0KPiA+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqBpZiAoIXZt
LT5wdF9yb290W2lkXSkNCj4gPiA+ID4gLS0gDQo+ID4gPiA+IDIuMzQuMQ0KPiA+ID4gPiANCj4g
DQoNCg==
