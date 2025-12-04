Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EBAD1D862
	for <intel-xe@archiver.kernel.org>; Thu,  4 Dec 2025 05:42:06 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3425210E00D;
	Thu,  4 Dec 2025 05:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OXLHy7yP";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AE9410E00D
 for <intel-xe@lists.freedesktop.org>; Thu,  4 Dec 2025 05:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764826924; x=1796362924;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=9Ygr/Z91ZvxmVyomPo6JRCZjY4fBCOVzJfNulMDU6s0=;
 b=OXLHy7yPu9+rZKtIlxk2im1X9Ee8wT5d4ldZLjoUWHyTxzaU0Gsh4ITh
 krbDJlelVk6Fw48V/Ekms8693lGvzj1yjPhG6I2twXIk4fkuCmgRZDfKF
 mG5JwXgw9T81tEbzBnjPzDnbhuAlqOZj0fC+jsnEUNvSuqMjJZDB8zdV7
 Nu0tAg9Xf2hP77Hhh8qowutiR/HveI1efwlcV4N0hHe07IJNo22tOfTrO
 kkYI2zAN+NJg4uCG62Kw1oEik25ur6zbkrTTTgKCWslHgQvjwtOt1iocM
 BRWU0xwJPQaPjdNBXw4y3p9t3xVkdlXSdoRbuyoiwdNN7uzimY48Zulbu Q==;
X-CSE-ConnectionGUID: zjsczr1KSNWGBV5err3DVw==
X-CSE-MsgGUID: iHxR2EqoTZ2Wc7niPnTOaA==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="92316130"
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="92316130"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 21:42:04 -0800
X-CSE-ConnectionGUID: prmH0qfWR0ufOgJeKp+3Ow==
X-CSE-MsgGUID: RBs0kRrFT5KoBrgjXiMeSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,248,1758610800"; d="scan'208";a="199307562"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 21:42:03 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 21:42:02 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Wed, 3 Dec 2025 21:42:02 -0800
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.52) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Wed, 3 Dec 2025 21:42:02 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ybd+POZX3F4K4o4M7MclEf0tL/97RV+1/YW6moQnVwMz6FHA7oIG7RUnVIchGUBJk+4SzdO9FqZ7KgotTNur4ELZhsXCGcrrxvsPf2lzMHY3xdEMXcrMEMTp8jNwqIwXmdTqNZW5eHMw1g6gDH9vjvXaq6b1o0dchj15cgd+LleETPCRtoxYs1q6HeLLYcYQTCJW0mCXI8dueKj2QzXtQhTTi0MJsktpsaGeP8E1HLTsAggGJDjSAeHKHCkIykW7DjQ8/8trsifZTy0J5bqCYxYqF5jhVyxLk7QAuSrGi+BLoiDhWTRSMEGGDvmSD9DuQPRBtVqFJgoycxOYunzjRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xJgo7LUwjwFWIykAcSyPbhRO5O5p8SUQZcvU+StxCD4=;
 b=bkwsb5bBJXQ9zp/eXWLECm/6zIF6cxg+vzQ2QwYWK4K8HsD/t81sDxysd14CzMPg27sbunOIkFfq8QTzpFP28Zjnx1sFngo6NKfjewpN43AfY0D2HBjXKp65hANfRkBouFjn4aenYMXGOceW6XbkkAgkRnlr7c4yas+2gXZilkhcnRbo/PlXIBd8zgNI1818sp/nPbtBfnUlulxNlN/43WSjtlcBrRLV+MNohwszw44cc7MQfLCTxo2PAb+Gf2CLfAbeBW0DlCFAj6+lBRZdwxpe1yV+TquAO6hRkxcu/6jTxHntdTYtFX1lUP6YedsAvxiOThnY8tTmRmlR7jvyKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA1PR11MB8839.namprd11.prod.outlook.com (2603:10b6:806:467::17)
 by MW4PR11MB6691.namprd11.prod.outlook.com (2603:10b6:303:20f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Thu, 4 Dec
 2025 05:42:00 +0000
Received: from SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394]) by SA1PR11MB8839.namprd11.prod.outlook.com
 ([fe80::ce6c:3c7f:92ef:1394%5]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 05:42:00 +0000
From: "Nguyen, Brian3" <brian3.nguyen@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Upadhyay, Tejas" <tejas.upadhyay@intel.com>, "Lin, Shuicheng"
 <shuicheng.lin@intel.com>, "Summers, Stuart" <stuart.summers@intel.com>,
 "Wajdeczko, Michal" <Michal.Wajdeczko@intel.com>
Subject: RE: [PATCH v2 08/11] drm/xe: Prep page reclaim in tlb inval job
Thread-Topic: [PATCH v2 08/11] drm/xe: Prep page reclaim in tlb inval job
Thread-Index: AQHcXyjJG7EwvMuSJ062FpUI1FjWxLUQlpUAgAACXKCAACEagIAAMhsQ
Date: Thu, 4 Dec 2025 05:42:00 +0000
Message-ID: <SA1PR11MB8839764A5C743C00807BE25AAAA6A@SA1PR11MB8839.namprd11.prod.outlook.com>
References: <20251126230201.3782788-13-brian3.nguyen@intel.com>
 <20251126230201.3782788-21-brian3.nguyen@intel.com>
 <aTDEIK/L+Qc4faWw@lstrano-desk.jf.intel.com>
 <SA1PR11MB8839E3FBDEFCCF05D27F757BAAA6A@SA1PR11MB8839.namprd11.prod.outlook.com>
 <aTDh3/SkCvIgj3yg@lstrano-desk.jf.intel.com>
In-Reply-To: <aTDh3/SkCvIgj3yg@lstrano-desk.jf.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR11MB8839:EE_|MW4PR11MB6691:EE_
x-ms-office365-filtering-correlation-id: 191d12de-27b8-4f4a-4d58-08de32f7d862
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?2iOIGF+7EjqgcW09KMgc5gdSK2Woy/3VhkT4tlait/I+GG4uA1yDrtEI7IoW?=
 =?us-ascii?Q?p4qva7c78Irg18yBmou7B5ypzRccRB12fzKbWrUKLxxceZM/1dwEoa94OxdK?=
 =?us-ascii?Q?y2yYODHU4ozLpFyHD8pYGsQZkXVoam9pbb7X5ki3RN+KGH7f5jobIfxmQHaC?=
 =?us-ascii?Q?t/QuxJEn8RJJJYc2Z/3YxpWF1emG+dclJ61To55fza29GsH1UNYv2QaCONwU?=
 =?us-ascii?Q?vh1LOq0YmgPQ3MAAvTs4VuR+zBvz7IHsa6VL+2Bwny8BFyznoulVU9vnWUQX?=
 =?us-ascii?Q?FSLL+pezdfpk/+g0dASlTMMrQj7tAGQwFzS3asrlWnGoOxANPiXr2FhuVlH5?=
 =?us-ascii?Q?iWE+Z7rhAX1MISFnBVQO0wqp/JiFiWQcA9akbjOR3svtAYj6JsgC32/HmA5k?=
 =?us-ascii?Q?J465tyCCLjqKjdrk966RHgYUYt/vOR2KbM/MtUfHQHpKdh2alAXesjtkvbBI?=
 =?us-ascii?Q?1XLfBwFb/smOla1eDCFH2ZWkQBsQXoaWYozNOfZLNvKn/jv40iY/g1fRBRIo?=
 =?us-ascii?Q?agfjEFKjNPIqPPT5nxV24414frB8V32TsXjz9faAW7IbTU6JCWukXaYe0yjF?=
 =?us-ascii?Q?i5rfsm1qChWQxGSyeVwZpMXvyu4H4F8SX6SuNIxAnf4pbTCSjwYr5ovASSTL?=
 =?us-ascii?Q?b3WGpO9ijlGanFYDpKtCTDNR2LpUJ1KHerl6Uk3JpZh/W0D1ciNsMuhRvw2U?=
 =?us-ascii?Q?i2AhmYIp8SOOy2Z1oRvafT/zOBOGosT6+1XeNaqLBdZnFOD4SNC6ykV69Vsw?=
 =?us-ascii?Q?NzB6eny9ScmM2Nv2o/dwxNRGKQD4eWOUzP1S9rOEGseUkAu30HN7eCrUIgVU?=
 =?us-ascii?Q?kirKl46lmKjX9UamBYoq3WMGmPHYLEspfc0/txRhrNFUu+ZQl6wDHIMObC3Z?=
 =?us-ascii?Q?WJzeO6QCoWzV6jSFfUGF8jTWgtxKFK9L+a/5j9L0kGY9o193GZhVGSCKwM3U?=
 =?us-ascii?Q?lscaKZudtI+uBKhsgo0HkbWDsvKDyofblwQfDDUUfIPLF/KLxalZu6gdptp+?=
 =?us-ascii?Q?aaI+7OYYMpsMHY8Fqkq7nwOku+AR2uTw5CnYqs8VMvPUiAf2aqFXPlRIwjVS?=
 =?us-ascii?Q?NiSMS0KTjVBNNJ3z8MFI9U2QryRS8JFFpcWOz8ad2bnLVva5bELWhr33PQJY?=
 =?us-ascii?Q?eI5pYZoAJXd8CS8t2Tzs1kZZd0kJpxBa2lBuNePefwuxEflD6evmzTq6aZAm?=
 =?us-ascii?Q?1NAOsJXzscKQrAGukuBTH/nw9+708VSVrWIffM2zkrWgf5D0gEWt4RFKKL82?=
 =?us-ascii?Q?6LjUKzjYVrTbo8juE/ATAiGrwCU5Htvkn4aiSe3XuVJQVBnBwy8FqHaYh+/9?=
 =?us-ascii?Q?px/D1tuahyZjiLggY9hV2k91MktszqfX+1YdLuhxe8IjK4U/SUVgDRnaWUdM?=
 =?us-ascii?Q?12O11TQo+N1oxu9IV/oAfw9YHhL77FG9ZNp9GfWhnAgpxcySCWVAxBFflxrA?=
 =?us-ascii?Q?DaSQ4nri1hRvEjt1v1erKtuJgocILa0dA4lgMX+ViPHJ77suQHjDcdCUW5SZ?=
 =?us-ascii?Q?FHpbz/l+02ewaZtqHpGrUPOn40iMTWCVbDtL?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR11MB8839.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?2h3AohWwtyt/PyBGg9vT4U9YYsnNJ8OU1oHs00MJ6Fu56vM50CULOIaAdJLS?=
 =?us-ascii?Q?FTBfL9LmlQ14ouvC6wiA2/PSqzgLGc+ujOpBKeZWuVqhsoZAEYmnnBFQAaCb?=
 =?us-ascii?Q?yxw4zkBvgViALS+A1lNp9+aj9IPsE3xUAI/mvLm58pE+3ebZGPe7D/qb9r62?=
 =?us-ascii?Q?dKSmfKOdMOffZNIB1qj2fEdhuB9SrmtBD0lSA7ukjfCyXVyOmtAzc3CrF/8f?=
 =?us-ascii?Q?foSvge4U4arZbascuztW2jsEWGOVy7EGLS1XS3JLAPC+fhVQZW1jLqYjXxYx?=
 =?us-ascii?Q?0zQFptXaAKqREhUU8CfEVuTeSZKeGi9me8K+DcyK+1bGLdiXDfikr80Sai1x?=
 =?us-ascii?Q?9XEjJH+f44hzUZyV6Z1DD+bP92YA507WEbuauZ91fjkyawyeMlzgMUMAPWSi?=
 =?us-ascii?Q?0rVXotF+j07RC15H561byO/vEET4D8cWjEiRpjRqWpBEyEOjLJ3FN4ziUeq+?=
 =?us-ascii?Q?MI+i2C3QfV/asoWDRRdY/8l6Um4ip+ZL7GlHclUjKEe73BFvNAdvtoKCS7Oi?=
 =?us-ascii?Q?pDjTY1BNppZqmj+Isc4V8FDmv4oM0Ujix0PqslQQFhS6yVcYtHeQtflvGm4Q?=
 =?us-ascii?Q?9RBsLBOUDgW8wJTddQQGh1bZa8UEkpsUZ8xZpEb5OqRtoq/w9GmZMKmunbCh?=
 =?us-ascii?Q?4twIFW3kXrPmFakPW/tHdz5lgpjAXy4BmMxtQFSLjHfWeOlIj/3uwIaJBBeh?=
 =?us-ascii?Q?qSYUC7ZeVWYnDKpCMMzvCTOIgwQ74BeUn8Dnq1pmVvQJELrH2Xyrgr7ubf+b?=
 =?us-ascii?Q?d7emmWAb716E0QLMsT1yMzfuZT1ZCNTzdfUPpt668SOi7RRP/AjJtak5YOOl?=
 =?us-ascii?Q?bwXxuTJtaGhVp4cAw/e4yE1r5NB8mgYwgPFXEhNTb9IBksU7l0v+BPB/9iB9?=
 =?us-ascii?Q?oogCWuZsCGh5laBhLYF17dvRopzMOXsw3JmaQaNjdE/Y1Sq/rK2qQ4ZQl2AR?=
 =?us-ascii?Q?r9EdDzTre+nctbm801YJB+hT3KeH0dVp0GWHx8/Wv0N1EnKtVINcR9mLCc1u?=
 =?us-ascii?Q?ZNsU8xb89esY2zn+3IWuoGc/ieqwQGtNaPJKE5j35j5y50ZVWGMCBsi7wO9c?=
 =?us-ascii?Q?y1fw7zwLPtRZctFOf9dFBlhTJXEKBULEV+pDBsdahK2E7fpnIIh2JkhpS9/H?=
 =?us-ascii?Q?uYbW+2929qLyH56sQw3pzo9LQHcFfaKJhrUZdNEBgAnDKgpTKy27uOj3A9sL?=
 =?us-ascii?Q?GggwBjx7UrRdOqp5Sn222eiHWZVfAQx8a4+MJLdWxkgHO6pJdVbYqXFPpOs3?=
 =?us-ascii?Q?wf7FcZT4H4tElBy1hc/+H8O7SfNz4Xz+47mIUFzYDYQNmpRUcNmPhv4pUnUM?=
 =?us-ascii?Q?wOR2bq22hiP7MuV7JyhZRZAiZyCnLF4WmS2QsBFUMpJfVyCK0T5v4oYiuzvs?=
 =?us-ascii?Q?V48LUrIK1MftNGKEW+3kjSKFjEwS7ynYQLGmFFbWuh/2bEQXQ10PfB1eiQ4X?=
 =?us-ascii?Q?He/u8jRvmnoaWG4xA7w0bsVdxfFIuxW+++ZRf0hfm8Ax8xTbgkaw0MfOBoP0?=
 =?us-ascii?Q?2b+ZK/v3d0//JmpdvCmaAPyzrDc6ojSYoVv/GUmTYGe0iTi2ojPH0C4kKZRi?=
 =?us-ascii?Q?0JiPhyC2REXbwB1LYGY/zeTyChPcZtJEb0vc25y2SZITehiVkOnPVrHHSJE/?=
 =?us-ascii?Q?RPCHvhEss1k9JIT/TEBY42TZqv9gZfSdZzodEBR6vxn3?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR11MB8839.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 191d12de-27b8-4f4a-4d58-08de32f7d862
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Dec 2025 05:42:00.1414 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: TxIdlq10FVhT+HRA1m8DgF6lykhXBupUVHXuAFIKqKNi4D1g+Bomk0/NEg3KSY3pIJSChUfZt5SDD7foIdSBiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6691
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

On Wednesday, December 3, 2025 5:21 PM, Matthew Brost wrote:
> On Wed, Dec 03, 2025 at 05:22:10PM -0700, Nguyen, Brian3 wrote:
> > On Wednesday, December 3, 2025 3:14 PM, Matthew Brost wrote:
> > > On Thu, Nov 27, 2025 at 07:02:09AM +0800, Brian Nguyen wrote:
> > > > Use page reclaim list as indicator if page reclaim action is
> > > > desired and pass it to tlb inval fence to handle.
> > > >
> > > > Job will need to maintain its own embedded copy to ensure lifetime
> > > > of PRL exist until job has run.
> > > >
> > > > v2:
> > > >  - Use xe variant of WARN_ON (Michal)
> > > >
> > > > Signed-off-by: Brian Nguyen <brian3.nguyen@intel.com>
> > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > ---
> > > >  drivers/gpu/drm/xe/xe_pt.c            |  6 ++++++
> > > >  drivers/gpu/drm/xe/xe_tlb_inval_job.c | 26
> > > > ++++++++++++++++++++++++++ drivers/gpu/drm/xe/xe_tlb_inval_job.h |
> > > > 4 ++++
> > > >  3 files changed, 36 insertions(+)
> > > >
> > > > diff --git a/drivers/gpu/drm/xe/xe_pt.c
> > > > b/drivers/gpu/drm/xe/xe_pt.c index 347b111dc097..833d6762dd8d
> > > > 100644
> > > > --- a/drivers/gpu/drm/xe/xe_pt.c
> > > > +++ b/drivers/gpu/drm/xe/xe_pt.c
> > > > @@ -2498,6 +2498,12 @@ xe_pt_update_ops_run(struct xe_tile *tile, s=
truct xe_vma_ops *vops)
> > > >  			goto kill_vm_tile1;
> > > >  		}
> > > >  		update.ijob =3D ijob;
> > > > +		if (pt_update_ops->prl.num_entries !=3D XE_PAGE_RECLAIM_INVALID_=
LIST) {
> > > > +			xe_tlb_inval_job_add_page_reclaim(ijob, &pt_update_ops->prl);
> > > > +			/* Release ref from alloc, job will now handle it */
> > > > +			xe_page_reclaim_entries_put(pt_update_ops->prl.entries);
> > > > +			pt_update_ops->prl.entries =3D NULL;
> > > > +		}
> > >
> > > Do we not need to do this on the media-GT? Or is issuing PRL a single=
 GuC sufficient?
> > >
> > > Everything else looks good.
> > >
> >
> > It should be sufficient per tile. KMD will request GuC FW per tile and
> > afterwards GuC FW will issue Page Reclamation to all the primary XeTLBs=
, for GT and media within the tile.
> >
> > However, I realize that this means we should be disabling PPC flush
> > for media TLB invalidation otherwise, it will conflict and do a PPC
> > flush anyway. Will have to rework some of the logic to handle this if s=
o... Taking another look at this.
>=20
> Yes, that's a good catch and would've missed this part. Now I'm wondering=
 if on upstream devices if flushing the PPC cache on both
> primary GT and media GT is really neeeded. If not, this might be small pe=
rf win.
>=20

I asked Nekkalapu, Satyanarayana for HW perspective confirmation. Media doe=
sn't have any PPC to speak of,
so, it looks like PPC flush bit for media translate to a NOP so we wouldn't=
 be getting any perf here on upstream,
maybe skipping a handshake at most.

So, regardless of PPC bit enabled or disabled for media, it shouldn't inter=
fere with the primary GT caches.

Therefore, I will plan to keep this logic the same for simplicity unless yo=
u suggest otherwise.

Brian

> Matt
>=20
> >
> > Brian
> >
> > > Matt
> > >
> > > >
> > > >  		if (tile->media_gt) {
> > > >  			dep_scheduler =3D to_dep_scheduler(q, tile->media_gt); diff
> > > > --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > index dbd3171fff12..2185f42b9644 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.c
> > > > @@ -7,7 +7,9 @@
> > > >  #include "xe_dep_job_types.h"
> > > >  #include "xe_dep_scheduler.h"
> > > >  #include "xe_exec_queue.h"
> > > > +#include "xe_gt_printk.h"
> > > >  #include "xe_gt_types.h"
> > > > +#include "xe_page_reclaim.h"
> > > >  #include "xe_tlb_inval.h"
> > > >  #include "xe_tlb_inval_job.h"
> > > >  #include "xe_migrate.h"
> > > > @@ -116,6 +118,7 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q=
, struct xe_tlb_inval *tlb_inval,
> > > >  	job->start =3D start;
> > > >  	job->end =3D end;
> > > >  	job->fence_armed =3D false;
> > > > +	xe_page_reclaim_list_init(&job->prl);
> > > >  	job->dep.ops =3D &dep_job_ops;
> > > >  	job->type =3D type;
> > > >  	kref_init(&job->refcount);
> > > > @@ -149,6 +152,25 @@ xe_tlb_inval_job_create(struct xe_exec_queue *=
q, struct xe_tlb_inval *tlb_inval,
> > > >  	return ERR_PTR(err);
> > > >  }
> > > >
> > > > +/**
> > > > + * xe_tlb_inval_job_add_page_reclaim() - Embed PRL into a TLB job
> > > > + * @job: TLB invalidation job that may trigger reclamation
> > > > + * @prl: Page reclaim list populated during unbind
> > > > + *
> > > > + * Copies @prl into the job and takes an extra reference to the
> > > > +entry page so
> > > > + * ownership can transfer to the TLB fence when the job is pushed.
> > > > + */
> > > > +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *jo=
b,
> > > > +				       struct xe_page_reclaim_list *prl) {
> > > > +	struct xe_device *xe =3D gt_to_xe(job->q->gt);
> > > > +
> > > > +	xe_gt_WARN_ON(job->q->gt, !xe->info.has_page_reclaim_hw_assist);
> > > > +	job->prl =3D *prl;
> > > > +	/* Pair with put after bo creation */
> > > > +	xe_page_reclaim_entries_get(job->prl.entries);
> > > > +}
> > > > +
> > > >  static void xe_tlb_inval_job_destroy(struct kref *ref)  {
> > > >  	struct xe_tlb_inval_job *job =3D container_of(ref, typeof(*job),
> > > > @@
> > > > -159,6 +181,10 @@ static void xe_tlb_inval_job_destroy(struct kref =
*ref)
> > > >  	struct xe_device *xe =3D gt_to_xe(q->gt);
> > > >  	struct xe_vm *vm =3D job->vm;
> > > >
> > > > +	/* BO creation retains a copy (if used), so no longer needed */
> > > > +	if (job->prl.entries)
> > > > +		xe_page_reclaim_entries_put(job->prl.entries);
> > > > +
> > > >  	if (!job->fence_armed)
> > > >  		kfree(ifence);
> > > >  	else
> > > > diff --git a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > index 4d6df1a6c6ca..03d6e21cd611 100644
> > > > --- a/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > +++ b/drivers/gpu/drm/xe/xe_tlb_inval_job.h
> > > > @@ -12,6 +12,7 @@ struct dma_fence;  struct xe_dep_scheduler;
> > > > struct xe_exec_queue;  struct xe_migrate;
> > > > +struct xe_page_reclaim_list;
> > > >  struct xe_tlb_inval;
> > > >  struct xe_tlb_inval_job;
> > > >  struct xe_vm;
> > > > @@ -21,6 +22,9 @@ xe_tlb_inval_job_create(struct xe_exec_queue *q, =
struct xe_tlb_inval *tlb_inval,
> > > >  			struct xe_dep_scheduler *dep_scheduler,
> > > >  			struct xe_vm *vm, u64 start, u64 end, int type);
> > > >
> > > > +void xe_tlb_inval_job_add_page_reclaim(struct xe_tlb_inval_job *jo=
b,
> > > > +				       struct xe_page_reclaim_list *prl);
> > > > +
> > > >  int xe_tlb_inval_job_alloc_dep(struct xe_tlb_inval_job *job);
> > > >
> > > >  struct dma_fence *xe_tlb_inval_job_push(struct xe_tlb_inval_job
> > > > *job,
> > > > --
> > > > 2.52.0
> > > >
