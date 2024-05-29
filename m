Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CC4C25B75
	for <intel-xe@archiver.kernel.org>; Wed, 29 May 2024 06:28:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF78410FB46;
	Wed, 29 May 2024 06:28:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EdtDSxE0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D81B10E703
 for <intel-xe@lists.freedesktop.org>; Wed, 29 May 2024 06:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716964106; x=1748500106;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=wArU0g3b0d29XQpEwvTFJuEt7ZRr+cdZhlAMfOqj8w0=;
 b=EdtDSxE0ry6Ht9296GSsc8eJDXG06ZPmyAds3jMRiKrbv7TMaYHQ1yR5
 vPxcRh9FdVxTnmyqkNJ+w92p1ZR//pcSoR+RrKH7NiKigx84V1LdrNwrz
 7YffeQYQ4qoFB4RSSMSYvSB9iMdekftAVksPrYm6bWNuhuPQf6e1MV4US
 y+EJiFqN1TkRlWr/cGoNfzW9hLdsuKEasDZTCfE2GEDleJzemx0WEaYnA
 wPTow5APJkcb1pAF40AW1EcH27nMZO9+chj//yOr18EyioNSaahoaHf59
 /uwgnxqg5fUozss6AiYUMQj/K5Rz9syafjBYxEkJoaU5JwEXYzErxfqYl w==;
X-CSE-ConnectionGUID: mS7Hn5JOSzem7jsXyzIxqQ==
X-CSE-MsgGUID: lBOpj/RFS1ina+boKbfWZQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="24763046"
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="24763046"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 May 2024 23:28:22 -0700
X-CSE-ConnectionGUID: B53cq0WPT+iTulBb4hmHSA==
X-CSE-MsgGUID: GO647ZvWSBuPG8PSaTm5Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,197,1712646000"; d="scan'208";a="40313006"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orviesa004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 May 2024 23:28:22 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 23:28:21 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 28 May 2024 23:28:20 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 28 May 2024 23:28:20 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (104.47.57.168)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 28 May 2024 23:28:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dxIQG6AnjKlWhXpOCiD2xKd1QEj78ZXqeqtUjsdiPvk3kfV1l0Q+TKdJ2ZvlGdPycFK4lc7TQlBphIL5yNbwOSnwr1UWKL4/e7rLzA+QsPS9rXUeAqb2AxP0vyBKhHAtc4Ee6bUqWY6B2xq0m9LJBTeBrAeMmuQVLxtcrli1IjuJbZ2EIvu8Oitvusj1TfKsBGxzP7wJ2ZGa8GXWLi5ucr7Cv3fXNBHPmNVrO/cZrUIaV5XpEU90UoidtZWiv3NlxTr5Jk1fmxTUYOCr1+nj9Sz9SwCAv7AE7Sf01fR0jBm3AfWzVZbBfE2uPeWd9+zGcw88jREle1Q0cB2/VFyuuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6HDBHwzjNUuLO0myY8udJ0PkMARo0PkYTMcmOc/6yDg=;
 b=StUkkkXKcMD9CDqsKkxPjLEFtQ6IAxKimR3SXkNYP+zPgZIjv+Pm9qAuZBFaTRJJnDnhCKsxY3DtbVLOrKqiKTwLRr0hjY4rrTqljqOLphwUiXKAPK6J2xaL4p/z2xNF48ByHr6L93qKWVMjnDaigo4fznpbQtFl9+05cD2bcKrsLUlcEz+eHICCPE1Xgj5wWtE9CCqMA88Z4Y8krAczS6osxKr3bMcJEgXL9TeBg8m6mp5+WKWdwREcrzWvo91+5QOW1+J53Hp9zceMk5RTHQ03ayvhRYmNjSSvGy96Zi6W0V/Xr+ca2CtetkIZrSFhCeHYevzVCGyfefvrGl7OHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN6PR11MB8146.namprd11.prod.outlook.com (2603:10b6:208:470::9)
 by IA1PR11MB7775.namprd11.prod.outlook.com (2603:10b6:208:3f3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.19; Wed, 29 May
 2024 06:28:18 +0000
Received: from MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0]) by MN6PR11MB8146.namprd11.prod.outlook.com
 ([fe80::3bc7:767d:bb72:a6d0%4]) with mapi id 15.20.7611.025; Wed, 29 May 2024
 06:28:18 +0000
Message-ID: <0ab4475e-0fb7-4f79-aba6-48ad569e110c@intel.com>
Date: Wed, 29 May 2024 09:29:02 +0300
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/xe/oa: OA stream initialization (OAG)
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Jose Souza <jose.souza@intel.com>, Umesh
 Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
References: <20240527014333.603914-1-ashutosh.dixit@intel.com>
 <20240527014333.603914-8-ashutosh.dixit@intel.com>
 <0cd6f261-2345-4cc5-b95c-b2c28dc79fa5@intel.com>
 <8734q2pkus.wl-ashutosh.dixit@intel.com>
 <e33226a0-f0ef-4dee-9ac1-3778c3a61829@intel.com>
 <855xuyjw8k.wl-ashutosh.dixit@intel.com>
 <4e2d7cb9-22e3-48cb-9aec-aaa07ad2f8df@intel.com>
 <854jaijtj6.wl-ashutosh.dixit@intel.com>
 <cc7eec53-abc4-4e2c-baf1-e20e84a39c28@intel.com>
 <87wmndnrob.wl-ashutosh.dixit@intel.com>
 <87v82xno4q.wl-ashutosh.dixit@intel.com>
Content-Language: en-US
From: Lionel Landwerlin <lionel.g.landwerlin@intel.com>
In-Reply-To: <87v82xno4q.wl-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0038.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1f::8) To MN6PR11MB8146.namprd11.prod.outlook.com
 (2603:10b6:208:470::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN6PR11MB8146:EE_|IA1PR11MB7775:EE_
X-MS-Office365-Filtering-Correlation-Id: 647f284f-1016-4f67-49e7-08dc7fa88791
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|366007|1800799015|376005;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RXAwRUtOc1V0Rm5ic21qcklJSExZOGRPMDFKTWdKUWxsYlNsSmpWcGw3MExz?=
 =?utf-8?B?QnRFTERCUnByQTRVcFhueXM5L29lUi9PVXM1d1AyeXd3ZnlvRlUwazU0aGpy?=
 =?utf-8?B?NUtIbHZoQXkvZytrME1rNXlkY1lueFl1OEZCRml2L29vdi9mVWI2TjFGdVZG?=
 =?utf-8?B?a0JIWXNGSTk1QTk3LzFKclJoQUUrMHpDRFFVN3owaWRXRWZiSUxEdlRLVnJt?=
 =?utf-8?B?NkdTNWFJeE9VUngzV0gwaFZwVjkrcnp2OUtZVlBJQVlWaWZKT29kT2N4YW1T?=
 =?utf-8?B?VnE3a1ZOK1FVUkZmcEREemo5aTJrU2I2RlJmSm0rcnFXeFFVUFE2MnlTeDJZ?=
 =?utf-8?B?Vk8wVW05MzYyN2Rub1dSY0pMSGNoYm1xRXlacjEzSDBhYlBjY05YY2NSVEhv?=
 =?utf-8?B?RnVoSGJOUlhjYXduUTdIQkhDTDJXSDBnNDNabmNIVG9JeWppOGNzZWh5d1lz?=
 =?utf-8?B?Q1FOWHBPcGNOcjl3Sjl6WVJTOHd5UFJrd0MzYnNCTENhcGRQZnpYMVN3YTBk?=
 =?utf-8?B?U1c1aU52WmltLzQ0NnNac1dGL3huSm9JVW51WjU2QVJSbGJsVlZicmNvcTlW?=
 =?utf-8?B?M2gxUnBYQzRKdEdRa2xFNHdPRWZyZXJ1RkthNE96NDBzUExib253WnZBZHlZ?=
 =?utf-8?B?RXk4V1UvdEdkaE1zRy85OG11NjhWb3hKbjV6cEN6dzYzK1BrKzVHN0h0QXpE?=
 =?utf-8?B?dXdEZktGdWZiYjdTWHp4blZnVDZLdTQ5eFovN1ZNbDA1SkNVbFZ3NDF1cFl4?=
 =?utf-8?B?UnJ1Sk4vYXRqTFVOSjVFQ1RkYk5WcE13SjRmWUFDZTRGS0NMb2RzdTVOYVRB?=
 =?utf-8?B?V1dsTGd5bWVKdnJvNllqZmlhZXhlQ1ZjaWZZZmt5dUVPZEFSam1FM2c0RUNU?=
 =?utf-8?B?QWxsUEhXc3JRZ1I1TjNFL0FEV2ZsU2hGVHk3RmZVZ1UzQ01sd2gzNVJKN1pV?=
 =?utf-8?B?V3hlVHMvVzcrMFR1L29UbDJpZnRxU1p6YXZhQjUwMnZQYmtxYm5rQzF5TGNF?=
 =?utf-8?B?RkVkVFViTUkrYmR1TVpTWHFodTBBRmhzNTR3M0VtYm5iOVpIdTNCU2xSNkZw?=
 =?utf-8?B?WVhTblJVZG8yUHo3UnIwRjQ4VWJqVjJ6RU5OUDhmaytQVGtRdCtlSEovN2xX?=
 =?utf-8?B?M3NSd211bDh4Q092U1U1VjFScGdndWJpcDVqdG1LZ1pBdjVwOThhbWRicGMv?=
 =?utf-8?B?TnhWdDNpTG1peW1QWVprNHhHeHV1RW9jVEZ3Mjd1MTR4cWdjdERTeEttckhX?=
 =?utf-8?B?QmJ5Q09vMkJxNTVBSTlyTkxEbC81TXBxa05za1JFa0JWc0JNdWdVa3pmRVV3?=
 =?utf-8?B?ZHdZRnJ0N3hlUGN6RkNPNC9wa1pzU3E1cVMvZHdML084RDFXMkE3bjZEcGdv?=
 =?utf-8?B?Ky9wcjcrazNiZEhmRHUrR0Fhc1ViTnZja2UzZU5TbzUrd3N5VXp0aENVdVp2?=
 =?utf-8?B?ZUtDQVpTYk9XMmM3SGZuRmFaWGc2UnA2Q3oxazFYeHJFT1dXUFBGbW5BNDh0?=
 =?utf-8?B?bi9Rd3cyMEt0b05LSk53OFJ5dlU5UmMyZmRMOUt0SEp3cCtiRmwyME8yOHkw?=
 =?utf-8?B?enFlMGJ2NTBGdDY0d0piYTVJTnJJQ1BCbVlKZ25INkNReWpuYld1LytrZXhE?=
 =?utf-8?Q?r0pSrk3SphyxHlMTLLFwRc11Z3yxc86wo7YZAaL934GY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN6PR11MB8146.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(376005); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RDBNS0RsZXh4eUl4VWxvS1pSL1BXMlRqVGJidzcxTHluRHdteGlEM1ZxVWlH?=
 =?utf-8?B?UWhURGpKQ1hubGZvbHd6UXl3Tm5iQ1NualZLcHZBNkFqNVd1QXpteVdhanps?=
 =?utf-8?B?NXI0N3hEQXAvYUdJOTNqR0FLeld2eER5cEFodWx6WC9jUUJsVWw5cktPV2pk?=
 =?utf-8?B?N3VjUVBZdVE0OXc0TmlNSGYvYU1LVHRMVFFaODd2ZEp4TFpZSHhSQXdaUDI5?=
 =?utf-8?B?eGVYUEY1Y2c3MFdib0ozMi9lOHlXUWtqajg4eUZRQW1EWlhsUHhSeUhmSU5o?=
 =?utf-8?B?VnJ0aEdURk5RamNGWFVNV2JOem91NG1JZVFpQ0Y1VEdybStCNVlLRlhYS2pQ?=
 =?utf-8?B?U2RDZUJMOTZNdjNyd0VzblIxcXhiQThab0xkdkRpczlnNkNNRzNTMm1BMVEx?=
 =?utf-8?B?SldWQXFqRTU5dUFUMURLcUpZZ3FRMXhFTHFwNmx3VVhXTGtSRXNkU0ZkSyt1?=
 =?utf-8?B?eGJRR3ZDY0dad0VEb0czZC9Ma0ZKTVArUDhzM2c2YzY5YzZ1Q085SlZPNXZ0?=
 =?utf-8?B?N2xMYndnek4zSlRnMGJpS1pGQmkxbVJCZXdhWVJwbk8xcjRPL3h2ZUM4REtr?=
 =?utf-8?B?RkdPNjVpWkpiUVBTS3cyU0lhNUJ2NGdjcHJ1djRKNmlFS0NXeE55cUVBQ2cz?=
 =?utf-8?B?a09abHZTbnM0UWNhODh6eWowQVZFS0Rld3pzVGdhSTZKbjgvNDA3NFBFRG9v?=
 =?utf-8?B?aHNCVTRCekJhL2c0cGtnaUlPdUVNUldFR3Q0dlNiKzhweXYyamY3L1JVcmFv?=
 =?utf-8?B?YWl1VVdaY1dqMUVCQ3dkR3RULzEzOFc1d0JlOGYyZVMzdFdkb3dLQXdpcHBM?=
 =?utf-8?B?VC9wSUd6bG1XMTRtN0dWMWlpRDU3RkovOGVQTkkzUlp6SnlBMDdOZFdBdCt0?=
 =?utf-8?B?Q1h3djQwQUtnMktXdEpmTXJRL0dNb0NOK2Z1bnhZQm43RmRzcXg2a09SOVNK?=
 =?utf-8?B?aFRETkNIU1Jka1dxOEN5Wi9VYXo0Y3pDSHpaOTlSTThYVFFGSk9tc1o2QUhL?=
 =?utf-8?B?cE1aMDlFWUJFRU4xSWNML0IzMzErL3pMU2FxeEJFQnNJRjh1c0ZBcnlnUjJP?=
 =?utf-8?B?cVJyekZpR1c1YmY3Yyt4WCtmYW1CVkNISWtlYTJXREVkQTNJeHo3TUoyR2Y4?=
 =?utf-8?B?YURvbW9Udm1ETy8rVTUyN0ZsYzlpeWxkZ0pNVkFFcHRCMDdYcFUxQ0drY0hu?=
 =?utf-8?B?eFAvaG91SXpkRnlGTzc5NmhsZW5CU1NUT1dCY29JL0lYRmhaR2VZVW9RWUhr?=
 =?utf-8?B?bkVJMkxiRmpoRloreTAvVlJhSEdWbmZkRFg5V3YreVp1alg4WGxsSmhlUExT?=
 =?utf-8?B?OWxLY2tQbERqRXg5cUV1MUhDMEZ0QmF1anlsdDdmQnk3eENmS2xsRTZiRkNz?=
 =?utf-8?B?RVdkdXBieEd1WG5wWCthdU1JamhjYkh6SEpUZUlwR0tuNThmenNOaDh0cGZJ?=
 =?utf-8?B?REZRVTIyWUtCRjRSNXExTk44ZGJqYW80R0hhY1pLVnlwSTBLRmt4K0UvZTU4?=
 =?utf-8?B?Q3RLV1kxNnlrc3JBcTRENlVTL0JiS1NuUUxoUVp2WkdGQ3Z6S2VkbVdnVjFl?=
 =?utf-8?B?ZEw0OUJacWpDRmJRc2lvZ1BrcGo1SFZ3V0hwbWFaVlMwajZBa25vNk02RnQz?=
 =?utf-8?B?TzlFcDNoODJ3Z0JBV1hUcTVWR3lIVnIwckU4T04rbzFaRWFPVi96alNXUTVh?=
 =?utf-8?B?OVFneG15L3NDSDNtQ2xNQXVIaURkZWJ6T2FIdGh1Q1FvZDFLS21UWmViZ0Er?=
 =?utf-8?B?SVZKZXBnMEVPSGdOcjhrZVNtSDBkUGxxVzVwMDZmelM4SkRwYW0wOGt6K3Zj?=
 =?utf-8?B?QWFwd3c2SnRqOEJUamh4VjRzdzQ3RFI1REdOaS9VU3NCUXVGNGo2d0plWkRo?=
 =?utf-8?B?TUJWWlEvbUUxazNYaUVJN2ZURkRHc2ROZmpxZ3l1WVpDOFZtQmVtVFgraUsv?=
 =?utf-8?B?ZDV1dTlHWk4zT2YrMVVyMmZDMU16R1hSSGhRUEZnSTBSL2dSL0NYQUpGSlhG?=
 =?utf-8?B?TDhUeGFXeEhwRUJsb044RVNoLytpYkJwZit5R2NFMnAxOXZyb09iMkZSQ2x1?=
 =?utf-8?B?NkxJczFSZTZwZGFsYXBzaTEzRU1ZejFVMGR3NTZETnRHOTZHZytKczRURzJH?=
 =?utf-8?B?d3hrSnk3TjYzWk1TUHFlUWlhVjA0dGI1ejJZR3NuMEwvNVFLSytZeXNJcitZ?=
 =?utf-8?B?Mnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 647f284f-1016-4f67-49e7-08dc7fa88791
X-MS-Exchange-CrossTenant-AuthSource: MN6PR11MB8146.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 06:28:18.6394 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 44O8wPIjK7XDGb1BIgA1WHnrQIRTQMeM033ZPEfKsmBLgA3OH8RoO5HLyyUU5PxOWPXx/FkOju6MNNU6BKrJ6mJEAjZdbOIlDsuz1niFBmk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7775
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

On 29/05/2024 09:11, Dixit, Ashutosh wrote:
> On Tue, 28 May 2024 21:55:00 -0700, Dixit, Ashutosh wrote:
>> On Tue, 28 May 2024 00:43:42 -0700, Lionel Landwerlin wrote:
>> Hi Lionel/Jose,
>>
>>> On 28/05/2024 10:16, Dixit, Ashutosh wrote:
>>>> On Mon, 27 May 2024 23:39:50 -0700, Lionel Landwerlin wrote:
>>>>> On 28/05/2024 09:17, Dixit, Ashutosh wrote:
>>>>>> On Mon, 27 May 2024 22:47:13 -0700, Lionel Landwerlin wrote:
>>>>>>
>>>>>>> On 28/05/2024 08:27, Dixit, Ashutosh wrote:
>>>>>>>> On Mon, 27 May 2024 00:04:21 -0700, Lionel Landwerlin wrote:
>>>>>>>>
>>>>>>>>>> +static int xe_oa_stream_init(struct xe_oa_stream *stream,
>>>>>>>>>> +			     struct xe_oa_open_param *param)
>>>>>>>>>> +{
>>>>>>>> /snip/
>>>>>>>>
>>>>>>>>>> +	stream->k_exec_q = xe_exec_queue_create(stream->oa->xe, NULL,
>>>>>>>>>> +						BIT(stream->hwe->logical_instance), 1,
>>>>>>>>>> +						stream->hwe, EXEC_QUEUE_FLAG_KERNEL, 0);
>>>>>>>>> Hi Ashutosh,
>>>>>>>>>
>>>>>>>>> On i915 the changes of configuration were pipelined in the application's
>>>>>>>>> execution just like any other submission.
>>>>>>>>>
>>>>>>>>> Creating another queue completely unsynchronized from the application's
>>>>>>>>> submissions makes this non usable in my opinion.
>>>>>>>> As we discussed previously, the plan here is to provide a drm_xe_sync array,
>>>>>>>> through stream properties, which can use to synchronize OA programming with
>>>>>>>> workload submisson.
>>>>>>>>
>>>>>>>> Would that not work? If not, we can do what was done in i915. But note that
>>>>>>>> i915 still has unresolved hangs, which I believe are due to the spinner
>>>>>>>> running on the application engine (iirc repeatedly opening/closing an OA
>>>>>>>> stream will hang in i915, though it could be due to other i915
>>>>>>>> complexity). That is why thought using drm_xe_sync array is both safer and
>>>>>>>> more standard way of doing what we want to achieve.
>>>>>>>>
>>>>>>>> Basically the output sync object will be signalled after registers are
>>>>>>>> programmed and also any additional OA programming delay (which is
>>>>>>>> implemented in i915 using the spinner).
>>>>>>>>
>>>>>>>> This would be done both for OA stream open and changing OA stream
>>>>>>>> configuration.
>>>>>> That is true. But now that I have other stuff like gpuvis wrapped up, I
>>>>>> plan to start looking these couple of missing uapi pieces (hold preemption
>>>>>> and synchronization, likely in that order).
>>>>>>
>>>>>> Because synchronization is not implemented I add the delay below:
>>>>>>
>>>>>>            static int xe_oa_emit_oa_config(struct xe_oa_stream *stream)
>>>>>>            {
>>>>>>            #define NOA_PROGRAM_ADDITIONAL_DELAY_US 500
>>>>>>                    struct xe_oa_config_bo *oa_bo;
>>>>>>                    int err, us = NOA_PROGRAM_ADDITIONAL_DELAY_US;
>>>>>>
>>>>>>                    oa_bo = xe_oa_alloc_config_buffer(stream);
>>>>>>                    if (IS_ERR(oa_bo)) {
>>>>>>                            err = PTR_ERR(oa_bo);
>>>>>>                            goto exit;
>>>>>>                    }
>>>>>>
>>>>>>                    err = xe_oa_submit_bb(stream, oa_bo->bb);
>>>>>>
>>>>>>                    /* Additional empirical delay needed for NOA programming after registers are written */
>>>>>>                    usleep_range(us, 2 * us);
>>>>>>            exit:
>>>>>>                    return err;
>>>>>>            }
>>>>>>
>>>>>> I need understand this is temporaty band-aid, since it stalls the
>>>>>> submission pipeline and needs to be replaced by proper synchronization.
>>>>>>
>>>>>>> Just letting you know, because we cannot use the current ioctl because it
>>>>>>> doesn't behave as we expect
>>>>>> You wouldn't be able to merge the Mesa PR as per the current uapi now and
>>>>>> then add additional Mesa patches, when we implement these couple of missing
>>>>>> uapi features in KMD?
>>>>> We could merge only the stuff that parse the reports, that's enough to have
>>>>> perfetto work.
>>>> Hi Lionel, so this means the OAG buffer stuff, correct?
>>> Correct
>>>
>>>>> But all of the VK_KHR_performance_query won't work as far as I can tell.
>>>> And this is the OAR stuff, synchronization and hold preemption?
>>>>
>>> This is actually a mix of OAG/OAR. We do read a couple of OAG registers
>>> that don't come as part of MI_REPORT_PERF_COUNT.
>>>
>>> We will need a way to tell when you've added the feature we need for
>>> VK_KHR_performance_query.
>>>
>>> I don't think we want to test this at runtime given some of the ioctl
>>> take time.
>> Hmm, you mean like a version? We have capability bits in Xe and could
>> potentially add a bit if needed. It is in the oa_unit query so like init
>> time, not runtime.
> Though, maybe, just not implement in mesa yet and implement it only after
> KMD exposes that property? Till then say VK_KHR_performance_query is not
> supported?


Yeah but how do I know the kernel I'm running on supports this feature?

A version number could help or whatever query we can do on Xe.


Thanks,


-Lionel


>
>>
>>>> Yes even if we can merge the OAG stuff first, that will get most of KMD OA
>>>> code merged and then we can merge the remaining stuff later. Since it's a
>>>> pain to maintain the code out of tree, that's why even if I can merge the
>>>> OAG stuff (together with Mesa) which is the majority of the OA KMD code
>>>> anyway, that would be a big relief.
>> So, do you think you Mesa guys can give us an ack to merge the uapi we have
>> now? And add the missing uapi bits in the second round of OA uapi changes?
>> Or is there anything else you want us to do in this first round?
>>
>> For the second round, here is the list I have:
>>
>> * hold preemption (needs some investigation as to feasibility)
>> * xe_sync for OA stream configuration and reconfiguration
>> * Equivalent of DRM_I915_QUERY_PERF_CONFIG_DATA_FOR_UUID. I am still trying
>>    to figure out if this is really needed. See here:
>>
>>    https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/29312#note_2429650
>>
>>    Since this seems to be using some MDAPI metrics in Mesa, I think it
>>    should be ok to do this in the second round too.
>>
>> Thanks.
>> --
>> Ashutosh


