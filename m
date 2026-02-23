Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A334EEC2A9
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 23:07:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1516610E45F;
	Mon, 23 Feb 2026 23:07:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="To786zm3";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8886210E45F
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 23:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771888053; x=1803424053;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=m3csty/jw53CiPL8FXaZLHuWLn+Y7XrdK2MNxrTDuGk=;
 b=To786zm3Oz9iDKd6wSzz/13uPbWV2RrSYD4XYFeIJjXDKs7dzsLdoBSD
 ATzZacv+w9gFuUTPNO3oTyT1jtw9rSsXMs7MsL/FHQALBZ8LJY2RkEge2
 XxUskkntGeqporB9NOEMlhbbIuDEYmntf8rhnMbS+VhItSrcN56+QwdEX
 wRfCIsHNuc8oveD94/N9SPM93Bo5PU5OIWBE2y1soIQEM/3hLZ0FZ/dap
 QzTEGpobf2yzDMGUHqtpaB4PKw5mA20rOrqmAinHtBHvlP5SCnBbuST7c
 IQIozlXrSHQGyOgw/3PB1u2TUBMPRTvKGOFHba+oMqWp/68nOdfcoB5AR w==;
X-CSE-ConnectionGUID: NQWi6k4gR0CoZr1/RZwS9A==
X-CSE-MsgGUID: L+gAfUS+TyiTn3/iobmxtQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72800735"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="72800735"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 15:07:33 -0800
X-CSE-ConnectionGUID: yoI+sjnxT+Wmr1pTOFgq/g==
X-CSE-MsgGUID: +hh4J1uyRWeb1EvWXI1uYw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="220713474"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 15:07:33 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 15:07:31 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 15:07:31 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.69) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 15:07:31 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ANQRZMAdBbAhzh4ssBCRenjUx8I6s/xbwDTOCCLfIJ0Gw3D+2YOM+OhqfvYvOiB0b02OFeHkZqT7Lfa++lPNWLDAQnKpjk7bUqbRJ66uF07Bqj9peBd2X4dK+YgZ5VYcejdjOl7h/2wR8O7UNE9lxmpsYaFWgx1XFwSv7i6ZyTOEOwPOOj6iXAv+fWnNqQcfjqPI/bupx+dEocBGIJyfKjfEl00Fh0s9KWqFCTu0g1XuRKo4kdZGafpXFqqjfM/kb75Zrvw0WdqHQCMZJqJYUHUC8zHzb5gQDpc+L5oTKHFJtr0/oyCt4kXN4xn+KUJj3QWZzvJlfMStWiw9SXk/Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m3csty/jw53CiPL8FXaZLHuWLn+Y7XrdK2MNxrTDuGk=;
 b=EN+xjNLnj6Maj6tzcmUxZTdkP7g330UiVac7vXVjlXCN/V+qizAoEHzassLNpbzicTfkrfMssBklemMreSZPM7Y+X8W7VcDhu7PKa/kjZKnuSXovJuk3iJf2wY/R+x2a8IXnEKWH3tonFlXGSpRwVjjOrTb9+pxoo0P/2dJnaCL6ZAyQW7fU8i9Qw8sDnuBzLHW2r7keLaSyD3v6oFm5slQ1mLr+TEI+Jqm0ReqBOoCqliwglvEGOjQ6fXHaSrH3zOe2/aBFQkTpEk238CTr80hWxW8lO9RhR6u8flN+7wHjphltWZ2P9S9vzJu57SaAF10KPqZhBtaDj+5eMf54eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from PH0PR11MB5577.namprd11.prod.outlook.com (2603:10b6:510:eb::15)
 by CO1PR11MB4802.namprd11.prod.outlook.com (2603:10b6:303:94::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 23:07:24 +0000
Received: from PH0PR11MB5577.namprd11.prod.outlook.com
 ([fe80::c60b:e0df:51cf:cea4]) by PH0PR11MB5577.namprd11.prod.outlook.com
 ([fe80::c60b:e0df:51cf:cea4%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 23:07:24 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>, "Nguyen, Brian3"
 <brian3.nguyen@intel.com>
Subject: Re: [PATCH 1/2] drm/xe: Skip over non leaf pte for PRL generation
Thread-Topic: [PATCH 1/2] drm/xe: Skip over non leaf pte for PRL generation
Thread-Index: AQHckPk3RdncFNFU0UyddFnPlKXa+7WRC1eAgAAC7gCAAAIcgA==
Date: Mon, 23 Feb 2026 23:07:24 +0000
Message-ID: <943064bb067941dd6883ebd60514bc147d346da6.camel@intel.com>
References: <20260129082756.1096935-3-brian3.nguyen@intel.com>
 <be5e3d57544ece734dec2513ab4717e80b49adec.camel@intel.com>
 <aZzb5COhqfv/3SBF@lstrano-desk.jf.intel.com>
In-Reply-To: <aZzb5COhqfv/3SBF@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR11MB5577:EE_|CO1PR11MB4802:EE_
x-ms-office365-filtering-correlation-id: 58fc21e0-fa51-43e3-32cb-08de73304e87
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?ZEhZa25HSUw0bEJWRkplalpOMThWUDlqQ3RLa3VOZmZSYkNwY09lOGRaNFRT?=
 =?utf-8?B?bkZkV2JtaEE5N2UvaFFNWS9XSHBFQ29JcC9ZbmxDSHE0TmlRZ3AzNCtlcy8w?=
 =?utf-8?B?aEdTVkYrUHhZZWZFVi9lQWJQWW9OdFJwSXcrcVFWeXhocC9GQW1LQU12Nmlt?=
 =?utf-8?B?SFRoVUljbFRJbnJaazdONjFTOFZZdkFpM2k4Q0FUMW50NVlPS0ZkNlRTbG5J?=
 =?utf-8?B?emNwZTVWM29ZVk9YTys0aDl6MWpyc1Q0bGpiN1hXaHFqS3FoNjlEQjFQSlFO?=
 =?utf-8?B?TXNQZlpzQzl4TVU0M3JnRFZPNXM4N2hJWUttUEFkK252d1FvT2xCL25XLzN3?=
 =?utf-8?B?bmt3aWJ6bXZaV29sb2taN1hJZWJ0QVhzMUUxNTFSTVNjWXlLS1ozMWFpdjMw?=
 =?utf-8?B?MHVvS1lKVGM1YThoWnRja1BIUUwrd0UvMTdGY0pNT0w2RjNHU0p0emx6Tm1I?=
 =?utf-8?B?aW1BS0kxY1JicElXcHY0WEVuQzN0dlhaQjhXVlpMNjFqVWVveE1ZRUUyTDVz?=
 =?utf-8?B?SkZCeEV5em9mVlh2SEVIWGFMSkpsaU1GcGhvUG4wOU5wNmV0MXo5QzE1REFK?=
 =?utf-8?B?YWwzN3lmNEtVaVYzeE9uZU1IVURqU0hQRkcwVEhmdXFLZmpadnQyRWNhbkgz?=
 =?utf-8?B?MEZHRFZkVEF3N0tXWjQ2T3JlMDQ3THJkUlRFNmE1c0dWRHllUEtYSVl1eEZp?=
 =?utf-8?B?dVFtSW55YUhnS1BzdEZBOWRKOElZUktJdlRIUm5JUkpVaHhNcUtlVlVsZGhr?=
 =?utf-8?B?UnEyVEh4MUpFeDgzVWtDUk9UaTRWSWF4OEtCL1ZpY3JLOUEvUS91WGxYczRs?=
 =?utf-8?B?ZUNGUWxvVm1iLzNxQnR2TzRWNndvWWV3TXpKM083QnpGV0lBK1BGM3ozWjN5?=
 =?utf-8?B?RzIyNFJwYzdkUExVTE1wZXZDTEdNSTh6OVErSFFWdzBBRTVRYjU0aklnY0sy?=
 =?utf-8?B?NXpKOW9hWTN0WkdCU1plVGdzNDJHZHB3NHQ2M2oyWWJwMXJkZXJ5UUJPZ3Zj?=
 =?utf-8?B?UUZ3QUVidXNGajZLZXVacWxNMTZraVQ3SXVPUG9QSUhuZFNYdGlVUzNhd1R6?=
 =?utf-8?B?RGtpU3Y0S2tlU2c4RVpLSE96TFBPQ0RtTzhjSzlUOWtQdDZEVWdWQXhoQzgr?=
 =?utf-8?B?K2NQdVBVM3YvK1VWaDlpTzN3TDlwSW44K2FTbVY0ekZ1UDhuMFBTd01RVU1W?=
 =?utf-8?B?OTlRaTYvK3VjeEhMSHZPU2RST1hOOWl3VHRWd2pzdXpoeXRZTmpUVlpDOEMy?=
 =?utf-8?B?czA4enlkSXVSbWhuL2Y4bUhmYmhHNnU2eGo5MkRUY2Y5RkNJbDJOb2VwaENv?=
 =?utf-8?B?bmQ1VnNiVHFSRldocklrbXkrMUtZcWo5YXdwa2ErSlFJdXdLeU5iUXZHQk9G?=
 =?utf-8?B?R1p1eTdOSHJuSXd3UFpzMW9Ea0VlNXR2dWQwN0p0WkFnT2NySDlkcVE0WDVN?=
 =?utf-8?B?NzQyemlXU2JuVS9TMnhBM1IwakZjQ1ZWVllDdmlOV0FMZFd6dEJZcnk1VGFC?=
 =?utf-8?B?Z0Q3L3RoVTJGT2pFSzhibFRvaFBiVW02MGhrQjROeXhTMEFhNFQwY09mMkQ4?=
 =?utf-8?B?VXBNeUt2aXFERmVvbXk0SFB4RUFndTlJZWVWeEZuMmNpVG9NV1lDRzZIK2Jw?=
 =?utf-8?B?ejhBRzRWWEZYR2s2cDRKZEp0aDlDQWNRR3ZxL2pZM3hNWGY5V1dvTVdCOXdJ?=
 =?utf-8?B?YS8vRlRtOUdXQXorSWdrUGZHRkU2aGtjRURtS3dYNzNDT0RQb1h4QVZKaFgx?=
 =?utf-8?B?ZUd0am0va2Z4MkZFRFB5aUdMTmxmclFvZUlPMHBDT0Z0R0FKTWJ2azlDUkF2?=
 =?utf-8?B?Y2tVdDdnQmN3YUlaOTZzVXNPQ2ZkUlN1YnIvcVQxa2x5bnZjci9OeDA0L2h1?=
 =?utf-8?B?RllQTEFjaWxIcmNqWCtjMHBUSHpGRWtDalgwNDJHS0RKL3pTK3Q0andPU1NO?=
 =?utf-8?B?aUJoVmFzQ3FBOVJzSVArUEZLUGJRSkgxMW9YYkt6ZFRxd0NwWGt2N2pDNDFR?=
 =?utf-8?B?M2NXOStERG5lY3dhTWFmUTR5K1RLOTBCRitUdGtsV3pwUEdscDR2OTdhL1ln?=
 =?utf-8?B?WkpTNDBnNmp2OWRzOXpGMUZFM1NGQlpxOEM0ekc3VjRndVlWbkZsVEJublZo?=
 =?utf-8?B?SlJtRTFKUTM4SmpVMTdpSjcrNksrTVgyRkRRN3NOemY0ZHNoVkxBZ283Zm96?=
 =?utf-8?Q?aKdnA442tCrJLqyj0otTntI=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR11MB5577.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SmNLRnJlaGFqN005VzYxVnVDQ2JLQVRDMG8vWHZjVyt6SGo4NzBzQ2lISGFa?=
 =?utf-8?B?ZENGbVBtNE5KRHN2eGVKYkJPWjNvb0xETEc4Y3dGb2NYbUlzUGFpelRGazBU?=
 =?utf-8?B?aHYzTXJvcGd6V2ZzcXFrZTZFbFR2UXhsai9zclM1dXhCQ2tCc002ZWxpRzFI?=
 =?utf-8?B?c0ZzajF3RXFlSElSbWMyOTE3S2lySUY3dkpZc0FTWXh0UWFnQWF4QjVYS2hB?=
 =?utf-8?B?bkkvUmpxTTVxeWNBN1pqKzMrZzA5Ri9LTVRQVy9ZbnVDdXVia2ZxbytWb2JG?=
 =?utf-8?B?MHJlSXNxd2hhUzBDZjFxVkIyeFI0ZDJxR29ZeEI3bW9WTWEyNzZITGYyRzdj?=
 =?utf-8?B?ZW44c2hwdHE2QWdIeldSZjRjVko1ZnZBbE1sZTNzTCtMSXlzRW84YlhWbGxW?=
 =?utf-8?B?T0xSV3krYlcvRzNXREJNNzIzVzIyM1F4bWpVaS9IcEt0ODYzbEtqRzk0RU9Q?=
 =?utf-8?B?eTZmSTlPN2wwN0hYME1HbTQrOTFoc3dSVE00VlBZZDVDM1p4WDZDM3l3SUFO?=
 =?utf-8?B?Y0VzV0JaM2JCY0ZkeE4wcjVObzJaVXZFem9GM0hBSEJlazdiL1Fob1llc09O?=
 =?utf-8?B?UzJFTWxnQzkvMWUyZXlITWtBWEdKdm1MTDBkUnp2ZFY4d2ZZTUxPV3pLSm44?=
 =?utf-8?B?Q3pMQ0o3VGZyMXdIelZhQ3NCSWc0UDkrSUtja2xTK0diUTFINldOUWNjWGpy?=
 =?utf-8?B?NytpVEtPS2dHRmJMdlJ0WDhzTHIrSW43d0NsRmQ4UWtZdmc1Y2J0MTFBVkhi?=
 =?utf-8?B?UXUzZmk2eUo3ZUtySWhHYzlkNUlsR3d2bEkzVEpxSTRCRVdwcjE4bG02ZWhr?=
 =?utf-8?B?Yys0ajlDU3lLbjcwWm1ndDlLMStQU0ZqTkNMZVEvZU5mell5ajlRNWo0NkZu?=
 =?utf-8?B?NkJCSGdVMHhsem9NUTd1UDNRVCtEekFyc2ZMU0JzOW16Y25oU1JydjIrM21Z?=
 =?utf-8?B?SGNXSmFZQmJWMzlUQ2NReVlKRUpxcGo2d1FpRVEzWFYramthR3dteWNFYTgv?=
 =?utf-8?B?SzlQeS9nRWVST3Z0MDNsMUlJWVVaM2duUE9ySlo5QktyL2Z6bE5IWjVNblZo?=
 =?utf-8?B?NVRBY1NMT1Y0OUlIUjdSMnF5Tk1SdUh4Ry9TS2tYdFF6eHpBU3VtQVYwVE4w?=
 =?utf-8?B?SS9wZWJzNEVSdjJJQnZSVkNRY0ZsS3Fma0JpTExORG04cWhwdmtSdVdFdjcy?=
 =?utf-8?B?ck5lKy81RitVWlZqMkUwdHFidTFTZWNpVDB5Uld5MUNyMzZlbTg4UWV6ZEpB?=
 =?utf-8?B?N21PdDVheXoySE9pb1phN0F5TmZYd2hJUmRTY2d3clYwVU5GaGcwZ0FVOGZs?=
 =?utf-8?B?ZGpLTHNuSTA0TXptNHhKWlZPQUdVcEtiK01KMVdaSTlXQzJNeXBnYlNubncw?=
 =?utf-8?B?d00reVFXcUZQNmo3aTlxRjdSTUJoSWNBTGtObkdXMk0vVGlhdlBkOVloOVVX?=
 =?utf-8?B?ek5UeDl6VjJjVTRYdTZsamNFNzNkVXhib3BXTGFBT0t4aFpFSG1xdml1N2tC?=
 =?utf-8?B?SkFaQklpaXpnTGRjNGJPWSt2L05XbXc0V3FPeVdOT2MzUXhlKzJiL08xSkF1?=
 =?utf-8?B?QXpkSTVndllyRW1BU2c4K2RwK0VJY28vYy84QTJ3SWtlWW5UcU43VzlWU293?=
 =?utf-8?B?TlpFWW9iSExyQWtsQ0Ird0ZOUlpiZWxhVzhEVUZpdlR1enB3eGk0VnRXTnpQ?=
 =?utf-8?B?M05CejZSc0dLWVpTWHE1T0NkTXFxZmhrUnpBS2Z2ZzVqNUtXNDlkalFKQ2Zu?=
 =?utf-8?B?Rk05OEd1RFAyYktubFloc2hhV3VMMWRvY1UxU0RxcGg1UUE1OVBaTDFuOHR2?=
 =?utf-8?B?cy9Ca1ZnK0hBMDVpZ3FPQVN1SE1peEF1Mk44U2kyK3M1K25HK3VpVlgzSHZ4?=
 =?utf-8?B?WnJwWDI2NFFUdnpiNWxHWHRFMnNvdi9YN0hGMVVJd0dWNUdBcVF0TGdkZHQ4?=
 =?utf-8?B?clQxc09DVXZUNWVHOGMrWjgrdlRGdktLSVRScUk2QnNWTXR2enJxRlRwT3BD?=
 =?utf-8?B?dE1CaWRSNlNXdnJER3lRT2NWQ2xxK1BWZGpoTVV0MW1iSzVIV3hhOFVRRXNW?=
 =?utf-8?B?T2dtN0Era2NHOVFQSjU2ejVBUE93b1pra3IzMmxuSkxXWDlrVGxlOVJXS3FZ?=
 =?utf-8?B?MEJZa1R5ZkpmRzIydGZBRGhqWXJ3Y2ZOSTcrVWVvS0U2UTBNdFJWblpUNTlx?=
 =?utf-8?B?YmdLanU0cFUweHVtNmlVTjVlUVhuSlZnZkZHTGxremFOSXJWQlArM2c1SVc2?=
 =?utf-8?B?alpaWENpdjhUKzhoWU5lQno0Ty9oZTVmTEp5OWd1Kzk0OXZEVXBiWWg4djM2?=
 =?utf-8?B?eGlwQjBnSDZ1MTZJOWdCMTIxa05TZFNaSEdWY3lBNkNWdjJ6MmdQVnJrUzhO?=
 =?utf-8?Q?BGhc0BfVnuN5sqh4=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <07E9D3BCE5AB67408BC5DB73F4B478D8@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB5577.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58fc21e0-fa51-43e3-32cb-08de73304e87
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 23:07:24.6162 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: D4YcZWEg2WwSpKxoTUxRD9Wyy7sEE0KfVF1SHW1CajBNWP/KOzDY2hHFr0HXhjr9xXH57LsbTS/+TOZjN1pcfhatcqi9xHTzeZYuWMAjn2c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4802
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

T24gTW9uLCAyMDI2LTAyLTIzIGF0IDE0OjU5IC0wODAwLCBNYXR0aGV3IEJyb3N0IHdyb3RlOgo+
IE9uIE1vbiwgRmViIDIzLCAyMDI2IGF0IDEwOjQ5OjIxUE0gKzAwMDAsIFN1bW1lcnMsIFN0dWFy
dCB3cm90ZToKPiA+IE9uIFRodSwgMjAyNi0wMS0yOSBhdCAwODoyNyArMDAwMCwgQnJpYW4gTmd1
eWVuIHdyb3RlOgo+ID4gPiBUaGUgY2hlY2sgdXNpbmcgeGVfY2hpbGQtPmJhc2UuY2hpbGRyZW4g
d2FzIGluc3VmZmljaWVudCBpbgo+ID4gPiBkZXRlcm1pbmluZwo+ID4gPiBpZiBhIHB0ZSB3YXMg
YSBsZWFmIG5vZGUuIFNvIGV4cGxpY2l0bHkgY2hlY2sgZm9yIGlmIGEgcHRlIGlzIGEKPiA+ID4g
bGVhZgo+ID4gPiB0aHJvdWdoIHRoZSBiaXQgY2hlY2tzLgo+ID4gPiAKPiA+ID4gRml4ZXM6IGI5
MTIxMzhkZjI5OSAoImRybS94ZTogQ3JlYXRlIHBhZ2UgcmVjbGFpbSBsaXN0IG9uCj4gPiA+IHVu
YmluZCIpCj4gCj4gTW92ZSB0aGUgRml4ZXMgdGFnIGJ5IG90aGVyIHRhZ3MgKFNpZ25lZC1vZmYt
YnksIENjKQo+IAo+ID4gPiAKPiA+ID4gdjI6Cj4gPiA+IMKgLSBSZW1vdmUgb2xkIGFzc2VydC4g
KE1hdHQgUikKPiA+ID4gCj4gPiA+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE5ndXllbiA8YnJpYW4z
Lm5ndXllbkBpbnRlbC5jb20+Cj4gPiA+IENjOiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJA
aW50ZWwuY29tPgo+ID4gPiAtLS0KPiA+ID4gwqBkcml2ZXJzL2dwdS9kcm0veGUveGVfcHQuYyB8
IDEzICsrKysrKysrLS0tLS0KPiA+ID4gwqAxIGZpbGUgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCsp
LCA1IGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9wdC5jCj4gPiA+IGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3B0LmMKPiA+ID4gaW5k
ZXggNjcwM2E3MDQ5MjI3Li5iNzNhMzU2ZDBmYTEgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9wdC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9wdC5j
Cj4gPiA+IEBAIC0xNjU1LDcgKzE2NTUsNyBAQCBzdGF0aWMgaW50IHhlX3B0X3N0YWdlX3VuYmlu
ZF9lbnRyeShzdHJ1Y3QKPiA+ID4geGVfcHR3ICpwYXJlbnQsIHBnb2ZmX3Qgb2Zmc2V0LAo+ID4g
PiDCoAo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgWEVfV0FSTl9PTighKmNoaWxkKTsKPiA+ID4gwqDC
oMKgwqDCoMKgwqDCoFhFX1dBUk5fT04oIWxldmVsKTsKPiA+ID4gLcKgwqDCoMKgwqDCoMKgLyog
Q2hlY2sgZm9yIGxlYWYgbm9kZSAqLwo+ID4gPiArwqDCoMKgwqDCoMKgwqAvKiBPcHRpbWlzdGlj
YWxseSBjaGVjayBmb3IgbGVhZiBub2RlLCBtYXkgbm90IGJlCj4gPiA+IGd1YXJhbnRlZWQKPiA+
IAo+ID4gSSB3b3VsZCBrZWVwIHRoZSBjb21tZW50cyB0aGUgc2FtZSAtIHdlJ3JlIHN0aWxsIHRy
eWluZyB0byBjaGVjayBhCj4gPiBsZWFmCj4gPiBub2RlIGhlcmUgYW5kIHdlIGFyZW4ndCByZWFs
bHkgZG9pbmcgYW55dGhpbmcgc3BlY2lhbC4gSWYgd2UgaGF2ZQo+ID4gcXVlc3Rpb25zLCB3ZSBj
YW4gbG9vayBhdCB0aGUgY29tbWl0IGhpc3RvcnkgdG8gZGV0ZXJtaW5lIHdoYXQKPiA+IGNoYW5n
ZWQKPiA+IGZyb20geW91ciBwcmlvciBpbXBsZW1lbnRhdGlvbi4KPiA+IAo+ID4gT3IgaWYgeW91
IHdhbnQgZG9jdW1lbnRhdGlvbiBoZXJlLCBpdCdzIG1vcmUgaW50ZXJlc3RpbmcgdG8gbWUKPiA+
ICp3aHkqIHdlCj4gPiBjYW4ndCBzZWUgdGhpcyBmcm9tIHRoZSBjaGlsZCBhbG9uZSB0aGFuIGp1
c3QgdGhlIGZhY3QgdGhhdCB3ZQo+ID4gY2FuJ3QKPiA+ICh3aGljaCB3ZSBjYW4gb2JzZXJ2ZSBi
eSB0aGUgaWYgY29uZGl0aW9uKS4KPiA+IAo+ID4gQWxzbyBhcHBsaWVzIHRvIHRoZSBjb21tZW50
IGJlbG93IHRvby4KPiA+IAo+ID4gVGhhbmtzLAo+ID4gU3R1YXJ0Cj4gPiAKPiA+ID4gZnJvbSBj
aGlsZHJlbiBhbG9uZSAqLwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKHhlX3dhbGstPnBybCAm
JiB4ZV9wYWdlX3JlY2xhaW1fbGlzdF92YWxpZCh4ZV93YWxrLQo+ID4gPiA+cHJsKQo+ID4gPiAm
Jgo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICgheGVfY2hpbGQtPmJhc2UuY2hpbGRyZW4g
fHwgIXhlX2NoaWxkLQo+ID4gPiA+IGJhc2UuY2hpbGRyZW5bZmlyc3RdKSkgewo+ID4gPiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHN0cnVjdCBpb3N5c19tYXAgKmxlYWZfbWFwID0g
JnhlX2NoaWxkLT5iby0+dm1hcDsKPiA+ID4gQEAgLTE2NzUsMTAgKzE2NzUsMTMgQEAgc3RhdGlj
IGludAo+ID4gPiB4ZV9wdF9zdGFnZV91bmJpbmRfZW50cnkoc3RydWN0Cj4gPiA+IHhlX3B0dyAq
cGFyZW50LCBwZ29mZl90IG9mZnNldCwKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4gPiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqB9Cj4gPiA+IMKgCj4gPiA+
IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgLyogRW5zdXJl
IGl0IGlzIGEgZGVmaW5lZCBwYWdlICovCj4gPiA+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgeGVfdGlsZV9hc3NlcnQoeGVfd2Fsay0+dGlsZSwKPiA+ID4g
LcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIHhlX2NoaWxkLT5sZXZlbCA9PSAwIHx8Cj4gPiA+IC3CoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAocHRlICYgKFhFX1BURV9QUzY0IHwKPiA+ID4gWEVfUERFX1BTXzJNIHwgWEVf
UERQRV9QU18xRykpKTsKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqAvKgo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCAqIFRoZSBjaGVjayBmb3IgeGVfcHQncyBjaGlsZHJlbiBpcwo+ID4gPiBpbnN1
ZmZpY2llbnQgdG8gZGV0ZXJtaW5lIGxlYWYuCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogSWYgbm90IGxlYWYsIGJyZWFrIG91dCBhbmQgY29u
dGludWUgaW4KPiA+ID4gbmV4dCBwYWdlIHdhbGsgbGV2ZWwuCj4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICovCj4gPiA+ICvCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgaWYgKHhlX2NoaWxkLT5sZXZlbCA+IDAg
JiYKPiA+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgIShwdGUgJiAoWEVfUFRFX1BTNjQgfCBYRV9QREVfUFNfMk0gfAo+ID4gPiBYRV9QRFBF
X1BTXzFHKSkpCj4gCj4gSSBkb24ndCB0aGluayBYRV9QVEVfUFM2NCBuZWVkcyB0byBiZSBjaGVj
a2VkIGhlcmUgYXMgdGhhdCBzaG91bGQKPiBvbmx5Cj4gYmUgc2V0IGF0IGxldmVsIDAuCgpPaCB0
aGF0J3MgYSBnb29kIGNhdGNoLiBQUzY0IGhhcyBhIHNwZWNpZmljIG1lYW5pbmcgd2l0aGluIHRo
ZSBQREUuIEFyZQp3ZSB0cnlpbmcgdG8gY2hlY2sgaWYgdGhpcyBpcyA+IDRLIGJhc2ljYWxseT8K
ClRoYW5rcywKU3R1YXJ0Cgo+IAo+IEkgYWdyZWUgd2UgeGVfY2hpbGQtPmJhc2UuY2hpbGRyZW4g
Y2FuIGJlIHNldCBhdCBsZXZlbCA+IDAgYnV0IG5vdwo+IEknbQo+IHRoaW5raW5nIHRoZSBvdXRl
ciBpZiBzdGF0ZW1lbnQgaXMgd3Jvbmcgd3J0IHRvCj4gJ3hlX2NoaWxkLT5iYXNlLmNoaWxkcmVu
W2ZpcnN0XScuIENvdWxkbid0Cj4geGVfY2hpbGQtPmJhc2UuY2hpbGRyZW5bZmlyc3RdIGJlIE5V
TEwgd2hlbiBzdWJzZXF1ZW50Cj4geGVfY2hpbGQtPmJhc2UuY2hpbGRyZW5bZmlyc3QgKyAxXSBi
ZSBub24tTlVMTD8KPiAKPiBNYXR0Cj4gCj4gPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoGJyZWFrOwo+ID4gPiDCoAo+ID4g
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAvKiBBbiBl
bnRyeSBzaG91bGQgYmUgYWRkZWQgZm9yIDY0S0IgYnV0Cj4gPiA+IGNvbnRpZ2lvdXMgNEsgaGF2
ZSBYRV9QVEVfUFM2NCAqLwo+ID4gPiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqBpZiAocHRlICYgWEVfUFRFX1BTNjQpCj4gPiAKCg==
