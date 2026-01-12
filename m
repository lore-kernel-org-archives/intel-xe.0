Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88406CF45C8
	for <intel-xe@archiver.kernel.org>; Mon, 12 Jan 2026 21:00:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0217210E086;
	Mon, 12 Jan 2026 21:00:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5pka7Hm";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F41610E086
 for <intel-xe@lists.freedesktop.org>; Mon, 12 Jan 2026 21:00:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768251619; x=1799787619;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xq7nWTFlTiCQAM//mBe+xWrE6wW7pHQ/hQuFwSfq0YY=;
 b=f5pka7HmfGX1rqTEtJZeGOIFoHOWHGzXJE0nYmDzDLGC6h+NBXN7Uzxg
 svmJaEiOU6NzIIPraxJ0M7EoxLbOe6HTqnTGlmitM/ZSBFjHkih7UC2tf
 a0us2OvVKXcFCul/c3AnBCpGbHeq5olBnO313fJMSshxDRBya7ek3FlNl
 0b2LpEMLYVSJrmXFaMYbQDwcXelk3Y4oIYQzO3eDyQhrY1Cief4pIGQcy
 vXZgS9KC6uN/POy3ZYrZ7VFyTaxSQF9TJ4bo8j5YZpr6rSkD9soS++gSZ
 06ykp2SqfPW0veVBtRP1VN+GFIEkv8sqMbcINsZVMudVHgmQT6gzuBJaI Q==;
X-CSE-ConnectionGUID: hi1mueFnSzWKQNhmNfKGJQ==
X-CSE-MsgGUID: tHYU5mOjTRerNJQonQp2+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="69609222"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="69609222"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 13:00:18 -0800
X-CSE-ConnectionGUID: J5MYxtXfTjW/RpE+9rXj6g==
X-CSE-MsgGUID: 3V11Az7YRYSdMUE24WqQng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; d="scan'208";a="208663173"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 13:00:18 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 13:00:17 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 13:00:17 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.9) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 13:00:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a6QMz1EXv90mKzj7ktr3ciJL/IRabhoLliolBdFhGAkdBXHWPfLdPezrYU9USW3rXQGTN+KvPVoBs8p1/iXv+N14MGyG9NW5tWjg54R+HnpHK/+IPBNWSIHJow0MRdwBjQbLspI+jj2c/9bp4FochqaNjo0xDUismE1x0L1f1Ud9ckoZD7gesizNVe214jOHq+jILw44/y3Z2k92IqvxDX8kf474+ml9nYqYcEk2Axlyaa/ZVtHLwRDM8wJRMrOmAtUAbwC1kz5YyaYjL3DD1kymCqf+v/1Q/CH1E7yb4CCp/aWZP4Wr2jNSGqIfb445YLhLxgaoqXSIHxL35d8LaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xq7nWTFlTiCQAM//mBe+xWrE6wW7pHQ/hQuFwSfq0YY=;
 b=DGhCeH/NvSju0X+yH66osNXQ/Nk7LWkBKgHoOK9tuP9xVZhYmb2+pc+EAjBKZ1bE1JC587qPanb2yCoUBPzi+LyKL4Zb5RyoSiaA9gwRlza9NosAM0G7YG4MtESNS8nBqkDI43Lc1ag7bux0tUURmTDRv1SswPnVl7jeD465iB8dMlmP9VQhTATkrhJ9B3FxL6hK3QTYTSCgPRogLBC+PaY3oYkS11qCQJdmIypiLmJBqFVobzLbwXDp6IsatWv522//TdbQwmnfoxKgTbORLr/KsMefa826SHokn4q2ZxV1mTAtnvo7QhX4Erj5VLXB3M7nKqqcbx5kuMAz+Y8XTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from BL3PR11MB6362.namprd11.prod.outlook.com (2603:10b6:208:3b5::8)
 by SA1PR11MB7039.namprd11.prod.outlook.com (2603:10b6:806:2b5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 21:00:14 +0000
Received: from BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::796c:2779:697e:54e7]) by BL3PR11MB6362.namprd11.prod.outlook.com
 ([fe80::796c:2779:697e:54e7%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 21:00:14 +0000
From: "Yang, Fei" <fei.yang@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH 1/1] drm/xe/cri: vram addr range is expanded to bit[17:8]
Thread-Topic: [PATCH 1/1] drm/xe/cri: vram addr range is expanded to bit[17:8]
Thread-Index: AQHcgfKwqmpXaEjCOke1DIfTH190+bVNg+EAgAGA5hA=
Date: Mon, 12 Jan 2026 21:00:13 +0000
Message-ID: <BL3PR11MB6362975F68C7644C9067108E9A81A@BL3PR11MB6362.namprd11.prod.outlook.com>
References: <20260110053650.2241351-1-fei.yang@intel.com>
 <20260110053650.2241351-2-fei.yang@intel.com>
 <aWQadEqbiBzu1ePh@lstrano-desk.jf.intel.com>
In-Reply-To: <aWQadEqbiBzu1ePh@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL3PR11MB6362:EE_|SA1PR11MB7039:EE_
x-ms-office365-filtering-correlation-id: 56941799-7087-45a9-ba46-08de521d94f4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NHN6emtNTzZneTdKbmdSdnNyUFRjQ3hxNUM3ejhZWElmMnVQWFA1UnFhS1FG?=
 =?utf-8?B?T3ZpSlVVL2lmdE5DY2t0Y1VOKzJKTDFnZndNdzNpdURUZmJKU0l4MTNaNE5V?=
 =?utf-8?B?UzlUcnRxYkowQUx2bFh2cFk3cSt0dmlzcXJZK0cyNk9yM0lCaVVwSml2TjdC?=
 =?utf-8?B?S1F2VmdYb2QraDhwZk14V1ptcVlLaDNQeVM2WUUxcVg2ZURxVkdrY2wvQXFo?=
 =?utf-8?B?NFhGWk1SR0xmT2RibGljeFY3aW8yalNFcHZOL3AxeTBMeG05aVFLZEdpTGpC?=
 =?utf-8?B?UWovUkJTcTY1U2J0bFVBUGFiUmZHWnIvNFR0bmxocW9KL1VwUHpPOWUwcW5S?=
 =?utf-8?B?S0RuTnVtMmdDQTllcXJwRXU4Q1pBTXBSWTZSeTFJQzVOMWxFcWsxUWhicHNi?=
 =?utf-8?B?SVpYaWs5bjE1aEhTbjNIYU1HV3RwYmM2VS9DbFgrb3p4SS9idjZwM0liWnJK?=
 =?utf-8?B?b2FRZk1ibXNHVmlkRk9odzVYKzNSczlBVklGRmVWVGFjbUdBQThkQkdwOFlX?=
 =?utf-8?B?MlVLNHgwcjF2dGtYN2JxOHZJZ3cxUmkxMDRKNituenVoVk5VVWRTVGx5V1dR?=
 =?utf-8?B?eHVrNVBBekpiZWpKSENKYzhzQmxzaHljQnpUeFFJSldablFLUVlZSkNHSHpR?=
 =?utf-8?B?Snd6dVN0Y2h2QzJXMCtGOUFaWGU2dHEwN2lUWVpObXRscXBUOG5BajJ6K1Qr?=
 =?utf-8?B?ZDlXR2pZMW5RQTBjSzgyUEpDakhlTmQvRWZESE9zUGR3MlVHWGNDQXdNMVV4?=
 =?utf-8?B?eE5ReUM0clJ2cWk0Z2lIWjRnc1VGOHJialo0eGd0UDdQZXB2T3dUa1lqbDIw?=
 =?utf-8?B?bjBacjkxYzVXTWZXVzRKbnRycVVNNkhtaHdzUThvU21DYVhoWmJDMW5WV3dq?=
 =?utf-8?B?SXc5c21aVCtKL1JZcy9KVFd1aUpzdnpVdnlONWxwUVJhS1lhNlJoU0MveHhT?=
 =?utf-8?B?d0didVVwa2thQ0JoV2d3SUU1aXlHb3dMbkhaRzVvbDdFM05QYWg0UnhCaXdx?=
 =?utf-8?B?ejFCNnRLMDhya1NxVitKUTBXU2pYdFNxcWlNMTQ1cHY4TFdPN290ajIwR0pi?=
 =?utf-8?B?RkZzeVBzbkhSTFpkWjNuZkd2ZmlzU3hGd2MySElPMzhseUtyNDJhVDlCSm5x?=
 =?utf-8?B?WElIOTg0bkdXRkpnZzREcTJJSnlDbjl5bUVZN0gyS3JQVC9TMkRxdkhGTGc3?=
 =?utf-8?B?Q1grR0NvV3Y0RlpERUNSd25XWjh3SzFISWdNOHpzUkxhWVA4UktWYmhtU0hh?=
 =?utf-8?B?UDdSemNqdzdFYU9CKzh3a2MzdjY3RlFLZmg5dnpEdGRZN2RCOEFVaTl5VFFX?=
 =?utf-8?B?aTBTcjZzbHFNeE82ZEhlQ1R4ZGczQUZaTTcwNTZYMEdyY3Fod3dsbHJnTTJh?=
 =?utf-8?B?clZFMmFQNk14eEVvK28vSHBncU5PdkdTL1NYMWpYWW9vYWlHcTRkTDBObzhS?=
 =?utf-8?B?M0l6VmdaWU12NUd0eDZhZ2ZKdGhEQmhqUW8yWHNjeDBBS0ZpTzFYbTN4Ri9r?=
 =?utf-8?B?SVlJcks4SE13dWREdTlpVlZnQ1lvRGZXNDVSNnMySVh1am9jdkZFRlBPZzN3?=
 =?utf-8?B?WUNNY1diUlRvR3dJZXlEcWQxNDJ2dWw3U1BVaWZXTmk2aUtXQjRlZStIM2dE?=
 =?utf-8?B?bWZKMmlJdGpxN2U1UWY3eTlNQlRKVG82eC9PelprZjIwVW5aK2FhTUlOU05j?=
 =?utf-8?B?VGtIbGxIb1RUR0dXVnUzd1VXcU9ZQWhuMFF1MVJBL2ZiVmIvSTlwR0tEUEtM?=
 =?utf-8?B?S1dyY21oZjlDMVJJa2JnZEt6SjFycTFYUG9yeVNHMGJSL2ZPV1pnbjVWNWFN?=
 =?utf-8?B?MGVDaHRDVXFHLytPaGEweUpYVUIyU2t6Zm12ZjJsNVBUS1pseUhFTGw1Ymkw?=
 =?utf-8?B?eHh5Z2hnQkgzTkNyeEFZZ1gxOE8yZkxQa3owTlBIUFlxa3A1TTFDYnZYaEs2?=
 =?utf-8?B?OFN5MEZHSmI3TURuaW4yZ0dYRngwaUQvemlXV1g1aGhONHpQYmM1U0VnSWE1?=
 =?utf-8?B?aDE5WkEwWGRydXVZUjhTc0dHRVhCTGgvN3RqQlphUnBtSVQ3czZHM0x4RkJy?=
 =?utf-8?Q?4Z986b?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6362.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bDVFTldkWnRhalFSRmszKzFGUlZSU0VkL05qZ29BSHFjaXRZQTdWdkRDT0pS?=
 =?utf-8?B?Y1hjeU9uZDBjSUxrUkhwSkpRZFpRWGJxNGV6UVhkOWpvY0JDUFBTcGdRSXBR?=
 =?utf-8?B?ZUwxMWdEUW5yeC9VeHhIb3BPQjJPa0JreE9ZM044RVhTREJJK2NlQS9YbWN3?=
 =?utf-8?B?dmNvblNuc3FrSEluc0h3TzZPclpRN1dhZTh5aDZlWDFMV0h2RkdsWjJQSEpT?=
 =?utf-8?B?YjJpNGd2VXE2TDVrOGFudTNiUnJGMmdMakVLMXlGb2xUMUFqcENXQTA3NWM4?=
 =?utf-8?B?RmtLeDF3L0dINjRCcmpHYVZ0TnNpWHpKaFhBQk9GN1Q0NmszbHpVb1VrRHh2?=
 =?utf-8?B?aXdLM3lIT1NhYlVZWm9NdFJFdTZOaHpSalptRzVWNEVHRldBb2dnaGVSNTdQ?=
 =?utf-8?B?ekUyTnVBWUtBQnUvaEJ2aktBV3hzeExkajZpdnhMRzdjMjJiVWtKRThTZWZ2?=
 =?utf-8?B?c2U2QnYzRWJuVmtjWUxNT1djRkUxWEVIcWNDWThXSEIyOEZqRWNRTHdaSWl1?=
 =?utf-8?B?cnI2SnlFdktlbW5GK2M1Rk83V3FYelFoRlhyRXpBVVdOUzc2bUFYRTBKdjZj?=
 =?utf-8?B?NTJtWFp3aDgrUjdTajhpbFBDOGpIdEd2L2xPMnR1QUdsUFBHYjFWSk1ScVZT?=
 =?utf-8?B?eXZjNzNBQUp4UmpDWDhiYVliNjcrMFk1b21CVEozZ2JMRmJJN2g1NTFKUXhj?=
 =?utf-8?B?Q0FrYWVubmsyKzlQRjFlZEV0WTdycWd1MitJejJBWXVjNlhNbDEwRzdUdGxw?=
 =?utf-8?B?R1ZBc0pGY05EbTZQazNvMTJLcThPSloyQ0NlRmticmh2ckJWSFZubnd1ZW1W?=
 =?utf-8?B?Z3V1TDNKTXl6eW5DeUR0dXN3eVFCMmdHZzhaNk44d2JOYVk2NVExRHhiYitm?=
 =?utf-8?B?b2lIZHJtekYxZGgzNWlDa2JSdkx3N2xkUVJueU9WU3N6bzVrbCtqQXhwMlNm?=
 =?utf-8?B?Ulh3aW5ENVVPUjhqbzI0amJXZStkUVM0OW9DNVNtbE1vcUxreFd6ZG1qNEJp?=
 =?utf-8?B?MDZsVzJkNFZVN3ZsRjRYYlFsakZ6UDFocjZKYm5rR2trRW5TZUdpQjBSOEZL?=
 =?utf-8?B?WGZyVnF1cThoYUxrUEdTVWwwYzNCUVFiMDZ4WkxrdzZFOExPOHc4WlFFUFRO?=
 =?utf-8?B?cFB5L1NHd2prMkpZamNqVU5uU1RlUnA1bnpHQUZEZkM5emVjTlBDZnJLWWNF?=
 =?utf-8?B?OVNlQWZwT1JCWWR2eUpQSGRXQm82WS93dFpkME0vQXptNm84dldoUldjaWpL?=
 =?utf-8?B?OFJUTS9kSWwwKysrdFNYeGxjOG5QaGdZUi9ja1JtdmxaQWhTQklUbDVXZjBF?=
 =?utf-8?B?TGNPRGFOR1NaWVNYL3M5TllYR0YzMlZtZUVNOWVFOURwamFTOVV2UGVTQitn?=
 =?utf-8?B?eHFmSWtlSzZ5TzNtdlVYaUpsZFJWY21jejJJcDJ4aW1UL0pOVlVhMG5RWXNn?=
 =?utf-8?B?eER3bFVxMTRSY2JFbU1NSGpzUlFVL0p1RTBHOXpQalpmZjRES2FuUUxpMmFL?=
 =?utf-8?B?Q0Q2QWpyYllJdEZ1YkM1NHNIb3VVTnhjZytROWczYi9za0ZlRUlwM0tyNm9L?=
 =?utf-8?B?UWIyM2hpWmRSTTVqZU1hdk9kVUZRT0p5MSt4STNuMWw0WTU2VDBnei80SUtQ?=
 =?utf-8?B?MlRwMTZVRVBYaHNtVllhaVJCTk1kYk1QR2o5emIyQXhRaE9rN0lSOW5TVHNx?=
 =?utf-8?B?UHlsN3A2L2pSWDU4eS9vTmptbnhyNGgvRWN2a0owWjBoM0g5MXNpTkJDYTJq?=
 =?utf-8?B?SXVlNHliS2c1QmR5aSt3eUp5WFpYZWRHSEpodE1SMnREcUNITXdTaFJWcUhB?=
 =?utf-8?B?OUtzazl4Z3VEdG9HZjlmN21sc21TeWZRMnRvak50YXpHUDVHUUhGaGRFQ1RT?=
 =?utf-8?B?MGtsckFzRnVBd1RhbkpFRnV5V1RxRHhlMHFBMmUyNUhkbVRUQ0FmaFJiZExZ?=
 =?utf-8?B?eURZM1p4NDB1bjlnT0ZBN05vbU9CL1FXOWF1LzV5NFlGQWlsWTVzeTB6MkY1?=
 =?utf-8?B?R1pMa2E4UzcxcGdNbEtFVmVnNU1weVNnT0pXc1IvWTc1dEpNNDlTbGw5MHVQ?=
 =?utf-8?B?Zms2TlJ0OUMzaWxBMStsWWpRVHo4dTZvMHc0RURYdkVVNFlXWFFkR0hJZnRX?=
 =?utf-8?B?cnBIaS9NY2VEOUYxc2hNb3VRZCs5eTU2ZGtEOWhWODFSMkozV2pUakFxQVBL?=
 =?utf-8?B?c1VMNkdZNUdQVWFrY0d0YjJLL09GQkVId09FVlhlZTFtQnJBaGJNdDhGNWQx?=
 =?utf-8?B?UGhFRU1taWRDZHdGUThlaWpIMWIxM2RVMWdBSWhNN29hQThKaTNPNExtVlVT?=
 =?utf-8?Q?dt/UHzuthtM6ZA10EO?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6362.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56941799-7087-45a9-ba46-08de521d94f4
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jan 2026 21:00:13.9575 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4vIvZN0cr/A1whZxOZ9IsU0KBAI3n9GOmweQSksjspBezcPmTlPwHZRInPAUK0CPrCh+rdY+y02Xf7ZXkBvMbA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB7039
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

PiBPbiBGcmksIEphbiAwOSwgMjAyNiBhdCAwOTozNjo1MFBNIC0wODAwLCBmZWkueWFuZ0BpbnRl
bC5jb20gd3JvdGU6DQo+PiBGcm9tOiBGZWkgWWFuZyA8ZmVpLnlhbmdAaW50ZWwuY29tPg0KPj4N
Cj4+IFRoZXJlIHdhcyBhIEJTcGVjIHVwZGF0ZSB0byBpbmNvcnBvcmF0ZSBsYXJnZXIgdnJhbSBz
aXplLg0KPj4gQlNwZWM6IDU0OTkxDQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogRmVpIFlhbmcgPGZl
aS55YW5nQGludGVsLmNvbT4NCj4+IC0tLQ0KPj4gIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92cmFt
LmMgfCA1ICsrKystDQo+PiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxl
dGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnJhbS5j
DQo+PiBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92cmFtLmMgaW5kZXggYzY0ZDk4YmYxNzIzLi4y
MTU5ZDljMzNiYjEgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnJhbS5j
DQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnJhbS5jDQo+PiBAQCAtMTU1LDcgKzE1
NSwxMCBAQCBzdGF0aWMgaW50IHRpbGVfdnJhbV9zaXplKHN0cnVjdCB4ZV90aWxlICp0aWxlLCB1
NjQgKnZyYW1fc2l6ZSwNCj4+ICAgICAgICAgICAgICAqdGlsZV9vZmZzZXQgPSAwOw0KPj4gICAg
ICB9IGVsc2Ugew0KPj4gICAgICAgICAgICAgIHJlZyA9IHhlX21taW9fcmVhZDMyKCZ0aWxlLT5t
bWlvLCBTR19USUxFX0FERFJfUkFOR0UodGlsZS0+aWQpKTsNCj4+IC0gICAgICAgICAgICAqdGls
ZV9zaXplID0gKHU2NClSRUdfRklFTERfR0VUKEdFTk1BU0soMTQsIDgpLCByZWcpICogU1pfMUc7
DQo+PiArICAgICAgICAgICAgaWYgKHhlLT5pbmZvLnBsYXRmb3JtID09IFhFX0NSRVNDRU5USVNM
QU5EKQ0KPg0KPiBJIHN1c3BlY3QgdGhhdCBhbGwgZnV0dXJlIHBsYXRmb3JtcyB3aWxsIHdhbnQg
dG8gdXNlIEdFTk1BU0soMTcsIDgpLCBzbyBtYXliZSBhbiBJUA0KPiB2ZXJzaW9uIGNoZWNrIChl
LmcuLCBncmVhdGVyIHRoYW4gQ1JJLCB1c2UgR0VOTUFTSygxNywgOCkpLg0KDQpUaGlzIGlzIG5v
dCB0cnVlIGFjY29yZGluZyB0byB0aGUgQlNwZWMsIEkgZG8gc2VlIHNvbWUgcGxhdGZvcm1zID49
Q1JJIHVzZXMgR0VOTUFTSygxNCwgOCkuDQoNCj4gQWx0ZXJuYXRpdmVseSwgc2luY2UgYml0cyAx
N+KAkzE1IGFyZSByZXNlcnZlZCBvbiBwcmlvciBwbGF0Zm9ybXMsIHRoZXkgcHJlc3VtYWJseQ0K
PiBqdXN0IHJlYWQgYXMgemVyb+KAlHNvIGFub3RoZXIgb3B0aW9uIGlzIHRvIGJsaW5kbHkgdXNl
IEdFTk1BU0soMTcsIDgpLg0KDQpTZWVtcyB0byB3b3JrLiBCU3BlYyBkb2VzIGRlZmluZSBHRU5N
QVNLKDI3LCAxOCkgYXMgU1BBUkUgYW5kIGRlZmF1bHQgdG8gMC4gQnV0IHN0aWxsIHdhbnQNCnRv
IGRvdWJsZSBjaGVjayB3aXRoIGhhcmR3YXJlIGZvbGtzIHRvIGF2b2lkIGFueSByaXNrLg0KDQo+
DQo+IE1hdHQNCj4NCj4+ICsgICAgICAgICAgICAgICAgICAgICp0aWxlX3NpemUgPSAodTY0KVJF
R19GSUVMRF9HRVQoR0VOTUFTSygxNywgOCksIHJlZykgKiBTWl8xRzsNCj4+ICsgICAgICAgICAg
ICBlbHNlDQo+PiArICAgICAgICAgICAgICAgICAgICAqdGlsZV9zaXplID0gKHU2NClSRUdfRklF
TERfR0VUKEdFTk1BU0soMTQsIDgpLCByZWcpICogU1pfMUc7DQo+PiAgICAgICAgICAgICAgKnRp
bGVfb2Zmc2V0ID0gKHU2NClSRUdfRklFTERfR0VUKEdFTk1BU0soNywgMSksIHJlZykgKiBTWl8x
RzsNCj4+ICAgICAgfQ0KPj4NCj4+IC0tDQo+PiAyLjQzLjANCj4+DQo=
