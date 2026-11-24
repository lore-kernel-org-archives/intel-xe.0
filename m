Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC21E606A685
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 06:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=PH1Cn/rj;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=eT+uiU1X
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FB010ECD5;
	Tue, 24 Nov 2026 06:45:11 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9539F10ECC6;
 Tue, 24 Nov 2026 06:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795502701; x=1827038701;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=n0Kdiwj1xFWVTc/sG4eKx9IQ6ef2mC/xyF6Q3g1TvWU=;
 b=PH1Cn/rjO/OXbQ9MgYvYwj23DqSSI4mOUvmIYj+n8Qo/q5GjjZe4lo3H
 4fsHo0U6RsZRCJsy3qraxevp6L/0ma8YOrx4HMR93ofuLCbrTT88KGJA0
 46JHs2smCOQZ1eYd057B3kUcDzPc8JssMBOWZKrQoiE+TQHe3Ol7IrayP
 KPysM1ojbWqOO0VStGzAcP6wsPr581SXVcQ2EphqJ7737YJ4avVLzoiMG
 c4uGQZAbGJbxL7yKzQcJL2lXGx41U+2ahVSfEnmOsJPktIr9pAAVp7xRo
 jK9NqiMmm3njAcHg8kq0QFvX3L9NslEO1/oawMJ8S9PPP4YkdBMJd1y9p w==;
X-CSE-ConnectionGUID: wfPdZXRHRI2795v/RoGJbg==
X-CSE-MsgGUID: I9dVifhvSsSm1zpBNAV2AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11975"; a="4309393"
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; 
   d="scan'208";a="4309393"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 22:45:00 -0800
X-CSE-ConnectionGUID: KGf9tfYpSXWaSjQi0vQZHg==
X-CSE-MsgGUID: OrGk4s8FSN+IwFWzUqBeeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,230,1787036400"; d="scan'208";a="11827461"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2026 22:45:00 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 22:44:59 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Mon, 23 Nov 2026 22:44:59 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.29) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Mon, 23 Nov 2026 22:44:59 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UBdCznHyM28LkfolVp4t2GekY0iy2snbMup0SlaJ9sBRLiPksTToEuOHPhXnxsjEQs40SYr0oSq/iGixuYvd3csShsQry+7sv2PJJsnqn8/PVgD0qJ+1JWlo62uSKX3jPddEhKysGmClMSNgfVmZA9ftXq/98fHjOPGzQFgEBcy1kZhcScNlG6jiKKQcskaYOlfjfThN6FfXplNR6uVy3E7YKX11+/YWC0WvAa3qRWEu28ae2vxbi70/6UK1S228U7JPBj8E3nXv/NWPFyHRRa/DmUj9c5xTzcyJJmZ6zD0EBFwTOyjWZDMlMGYdXq0zeu507+YGNjtX6Tm4Ep66oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CkRGuqGGTStPa5i6T8WgmMQLPVoHlOImfYxb5hksjxA=;
 b=nz/8hTx3Ke0ngkGZ/y4TfrY93B3I4yJc0xu4S9hXjzIVwCRBPPmXWlHFkg6WUmvePMctDIfTtRG2ZO3LjbSv0GalUUH9X4f63bzk8ESZO0ZEiw+WUrPqv/5GPAEkfYMFH0dloKdt6WPLT0RPhuLDu6mYRAPonTC5UgwSN9IkQtY9S/5s3RGPh8VhO8jwlErfZ2fWLTqXq+UVJg9F3d7dceYu1aaGQi5qZASwLVLoDiYUZo6YTlDwatGje6tmbURsdIutn4KO9PCULoK1MQdBJcnTtoNNWlwYSiJu1nc9TWjODR70vVgYhvQcgssBY58WtEo+uAomoDfSVGAwFAzWyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CkRGuqGGTStPa5i6T8WgmMQLPVoHlOImfYxb5hksjxA=;
 b=eT+uiU1XfINZzYuTifAHvT1Ud6c/7IFj2mbfocFlySpgdRAEGoxY4g2ZgdIW043PWOqDnqqnp+LowTLeoca/Bm8C/83odCRVaix0C/X8eDNXaK5tLd3KOwpKuN/TfWGkbnxj/5Fp/JM+zJ3UaDDhJe7G+Gqf8NIIynJzajWxVuA=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11) by DM4PR11MB8092.namprd11.prod.outlook.com
 (2603:10b6:8:184::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Tue, 24 Nov
 2026 06:44:57 +0000
Received: from LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c]) by LY0PR11MB357627.namprd11.prod.outlook.com
 ([fe80::71fd:d139:945b:a71c%5]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 06:44:57 +0000
Message-ID: <95c758a8-669e-40e0-b8dd-f031f3ca1cdf@intel.com>
Date: Tue, 24 Nov 2026 12:14:48 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/i915/dip: Clear VSC_SELECT before setting it
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>, Eriksen Xie
 <xiaolu.xie@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, "Suraj
 Kandpal" <suraj.kandpal@intel.com>
References: <20261118131441.2023100-1-xiaolu.xie@intel.com>
 <fba24224-e42f-473d-8e9d-801ba183849b@intel.com>
Content-Language: en-GB
From: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>
In-Reply-To: <fba24224-e42f-473d-8e9d-801ba183849b@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0095.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1d4::16) To LY0PR11MB357627.namprd11.prod.outlook.com
 (2603:10b6:404:21a::11)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LY0PR11MB357627:EE_|DM4PR11MB8092:EE_
X-MS-Office365-Filtering-Correlation-Id: 488fecde-d44a-4b10-a8c7-08df49f673fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|22082099003|6133799003|18002099003|261009223027099003|56012099006|4143699003|11063799006|10067099003|261102123227099003|261022075727099003|261028144727099003|261022105027099003|261026121527099003|261026140227099003|261021123027099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: /GURjHBBPL3LhsL3x9hPA5IcwmiMWnAMl9iRY607qt3amSn6fMBIqL+l/BjVUSeaLpCSWDyy9jRow3bqYCh9x/E+LPxuPXUpiuOL7W5KUnK+/TTJBtmW0k3YzJgkJeDYIYqxrtL5Og+wZ4ZqYVi/PkE2RqYNsbi0EJQw0nBAOoOA17BqJC3yomk1AGTszC3IBvHTEnA3CfN6jdmfjmdNRXEAhsmIpQgVRTjKzZxeYLfCrmRRK/W/sM7uBaQsAyAynD2H7ITmgQtWkPJeQCPr80SDme5bEGU5GkuL7xX0VaxWBd63j43Tay7v1NKsvYg9fSMAfvPh9uCA/jf6urv+xWW0tua8Lq8NeSmxZExvZwTYGjFlZHDZ4dj4Sz8nqqEA25M9RxjWFU3+xOtD7LIZ+LyNqjYZ1LbrlpZlwvd73nH3TaafEQMmH6I3lBY7nq2SDM223Dra3Wwh9oaZqJFWXDmjMwKJ94HvDW7iYOWLtiGpSE8OdyQhbPUZ9wdccoV4MNfnEvif3c4FsSXX3HCOVkKk9Jb3akUDzycRM/hklkqBhltKry4hRl77nSSKhVkduaxhsk+Tee7r98hJ70mcTb5E0dRtPXiyLPJuPVGDetA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LY0PR11MB357627.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(22082099003)(6133799003)(18002099003)(261009223027099003)(56012099006)(4143699003)(11063799006)(10067099003)(261102123227099003)(261022075727099003)(261028144727099003)(261022105027099003)(261026121527099003)(261026140227099003)(261021123027099003)(261021121427099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmV0RTNTSHN2RnBkbVZ0U3BsTGlFSWRYWC9vNUVHczMrVGxxMnBRc1pJS2pJ?=
 =?utf-8?B?MXZvUlhIMnpUTzA3UG41cUtCMGUzcEM0Sk1IWFp5OUE4eXZYa1lJTHpzd2Nn?=
 =?utf-8?B?bk55aVBIQ3JMSHA4enZJZHNpQ1VHcjd4NEhFWlhmNXJQU2xQc3N1aFd5L0Er?=
 =?utf-8?B?R3ZDWFZuZEpLeGZ3K1B5c0l1OENEZlRBTGc5WWdwOHYxM1RDSHliMzJXUndH?=
 =?utf-8?B?anNmUXZsanR0RzJUMXZIamIxQ1BDZEYrQkIzeWJHQ2tMQ0ZkeUlwVHRhOENL?=
 =?utf-8?B?MStoWnBERWQ0UDBtOW1neit1MUNtTG1vS1Ird0hPaFhIcVVVY3gzSXA0QXMw?=
 =?utf-8?B?eXY5Q3Y3V3A1aHh2SVFYanRraEFzaUQ2MHB2eXVTRFBEZXY3SytLWXNCUkIv?=
 =?utf-8?B?SG9LeUIxazlrRmJlc0t2Mzk0OUJFZGJ1L1pQcDhtRFBZWjRvckM2NHVmNHVR?=
 =?utf-8?B?QWRXc2lDdlRGbjJSMDY2V0FwMGF4bitUUEhDdlVsbFFjRzBzR0FUSUpTTG1s?=
 =?utf-8?B?Vkk5OVBxalhVbXdoSUpSQStuWlRCZzdjNzhQWVgwZ2gzdysvcXBKQTFuN3M4?=
 =?utf-8?B?MW1GSE14M1hyc3g1cElGUjR1NStiYjB5NW1uRjBlaWZJb0l4Z04zMmVzS0tk?=
 =?utf-8?B?SzZsN0lxaU5vTmZWZEx6SEtQMzRuT0ZYSWxyYXFuczhxYVB6MlVMNWo1MHNL?=
 =?utf-8?B?VnZKT1J5NmpkMkZ1aXNzb2dIck5idW13Zm5VZjd5MlVCa3hLb1JSdENJbDlQ?=
 =?utf-8?B?bTl1cDBNNnBPOVk4N1h4NTd4N1I2K0hKOGRGVzd6MVI0U2xJVGl4UkpQNDRa?=
 =?utf-8?B?M3pYUlFFWW1UdmtFaTF2UWdNS21LVDlGK1dKY3VBY2VZNHJOVjQ3V1VEM2I5?=
 =?utf-8?B?aE1ZMjRISnl4RHNtMnpQRkNUTE0wVSsvU3NEUWRaQ3ZVdEZvQ2o5QXVxVHlL?=
 =?utf-8?B?SVMwTG03ZFR0bTFHaStqazJKUDlWVTVqaXlmaEpSaEM4MW9kYVJMY3lXOENY?=
 =?utf-8?B?Q01PbzJ6Zlp1UmJsY3BoOWJFalhKeStPNnhpY2lQVENjT1R2ZStLRnk5OXdH?=
 =?utf-8?B?MnptckRWczNzRVhpTEdBNmVnalQ1K09HdmY1WGl5UmtWUGhER0RPYXFoVWRY?=
 =?utf-8?B?cjA3U3FSUS9IQTVLSm5tMmF6anZ4aytVSDA3dU9wQkRYZmN6RHFLY2Z5ZENv?=
 =?utf-8?B?azl6dFZOdFluaDFjRlVlU0Z4N0FXdTNWcXozNTRHRFFTT3d5cVhyd01MaTBj?=
 =?utf-8?B?dUFqVDIxTy9SSlpsb282anZmMEtHdHMrYVk5Y3VXTmwyRjlJK0l6YUJ5SHZL?=
 =?utf-8?B?blp1Y09XUEgyMDNyZXNpZnZER1M2U1B3cll0YmZJNVd2Mk5RelFiZXN1UkZP?=
 =?utf-8?B?ekI5ZU5leHQvQjhYN2VhQU8wTlpGejZ6aDRBNTNnQTkwZzNIZURRWGJtby9W?=
 =?utf-8?B?VEdlMVZnaEVOZjdnSHRsaEtaMmo0UjZyOUU3RXpZWUhHZUVLWnBLSEZNUVhi?=
 =?utf-8?B?eTVIbEJUMzBUUGtyUnBKVTFUYkRUTHlVU1U1QmI0RlkwQ25DZHk5aW9Dby8z?=
 =?utf-8?B?bUVBeWNlRkJLYWJXVjlKMXc4dUVGWnI3SmZtSmhkaVdSVklZZHgyeDFLclpj?=
 =?utf-8?B?bFVOZXpjb1B0S1FIcVdKdWM5eWdaWEdLaUpmVVpUKzlVdjBEZTlZWGVQcTEy?=
 =?utf-8?B?WFI0S2M4S0pXT3lBbjN2dEEzOEF5S2JRdFhpL2J0OG1pWExWZGlHYVY5ZktK?=
 =?utf-8?B?WnF0TXljOG54SHNYSk9GTTRmZVJtT3JNd1R2REZEQkx3OXh3dE5DMWRjc2w0?=
 =?utf-8?B?dkREK1pmNmxmRUs0amJERGxQbjdmcWVTRTJlTnhFWlNXc0xjSmVnclBuMnc1?=
 =?utf-8?B?R01SZk9MOXVBNnUwTWhjMmNkektUZDdoVk1wZTNLZHo0VDB6RWpHNXRKMjhD?=
 =?utf-8?B?b1ZFSGZsell0UEx5U0NXdVBBalNacjBuelhXeVVjdHp0Y0gxWkZHditPSHZF?=
 =?utf-8?B?MEsyMUJ5VlJXRmxaZlRXZmd6bGZyY0tZYTd4UlBIZVJ4dXRpTGEzRWo4Ryth?=
 =?utf-8?B?NHJVQWZTNGdCTE1iUnF5MGF5OWJlbisyKzY1MWt1ZUFaZ203ekdEdkpPQ1ZR?=
 =?utf-8?B?ZGl2bFNYT3N6VGw4dEpiTXFOMVR0eGlNeS81VTlYMk9SaGRFRXF6bW5wQVpU?=
 =?utf-8?B?YXAybTJDQmh3cGR6aHJWOVc1RnJkS3pDN29DMXRFMzl0czY0K0F4STRrU0M0?=
 =?utf-8?B?Wll1WUNiTDkwMGpieThxV0pqVGRvUUYxMTZla09xSGdaNENqWmVVT0FJQVpn?=
 =?utf-8?B?V0NrUjNrMnc2WmFWdE1hRjZ6WjcrenJzc0R3OXVYV0JySHRFS2trL3NmalQv?=
 =?utf-8?Q?MVvRt2kyszvXhciE=3D?=
X-Exchange-RoutingPolicyChecked: ht9iJ1rLmRlie5yvwW2+UhdILp3XPrqwtWWh/SMncGYQcxgjH+cEXKA2zBYqpI5a6xlKXfsAVcnd5O9asojEGe5SAkR/H9GOM9c+UwYho6wnquQ30CWRqRLlUqdfr2y54PP3Uv+9yYz6yQkmVd8qGoAKAh+PDOK/KzvWH6eVZZd+r5rxJzbS6SN6AmWuO8HH6BtBumt2VYtOSeoRLuxDRm6pH4ZSPzl8potAINo/CmYaNkwvLUNY4T/K7eVBKrXrD1SIU9joqDLL+vdoN1OYyjb485PF193Ynhp6X8WGUTocGdJgPpH08xG/9HHsbce4mkLS8C0RDuQgzyHaBHqHgg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 488fecde-d44a-4b10-a8c7-08df49f673fc
X-MS-Exchange-CrossTenant-AuthSource: LY0PR11MB357627.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 06:44:56.9817 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: niPodwiT2Gz5mujgB04qpV0WSvJKBnVaoRozYNuHZi0hGbybEdAfYxsV83xFtKwkNj1ovNa0ZM4rfFB7eBpDh9bUdN3QVZTvcREjxAvnZzw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB8092
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 11/19/2026 7:54 AM, Nautiyal, Ankit K wrote:
> 
> On 11/18/2026 6:44 PM, Eriksen Xie wrote:
>> VSC_SELECT in VIDEO_DIP_CTL is a two bit field selecting whether the
>> header and the data of the VSC SDP are generated by the hardware or
>> taken from the DIP data registers. hsw_write_infoframe() ORs
>> VSC_DIP_HW_DATA_SW_HEA into the value read back from the register
>> without clearing the field first, so a different value left in it,
>> e.g. by the firmware, isn't replaced but combined with the new one
>> (VSC_DIP_HW_HEA_SW_DATA | VSC_DIP_HW_DATA_SW_HEA results in
>> VSC_DIP_SW_HEA_DATA).
>>
>> Clear the field before setting it.
>>
>> Signed-off-by: Eriksen Xie <xiaolu.xie@intel.com>
> 
> 
> LGTM.
> 
> Sashiko suggested a 'Fixes' tag, but I don't think it's needed here, as 
> there is no known bug.
> 
> The driver doesn't accidentally change this bit, and any leftover state 
> would just be from GOP/BIOS programming, which hasn't caused issues.
> 
> Keeping the tag off avoids unnecessary stable backport churn.
> 
> Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
> 

pushed to drm-intel-next. Thank you for the patch and review.

> 
> Regards,
> 
> Ankit
> 
>> ---
>>
>> This was split out of my earlier patch [1], as suggested by Ankit in the
>> review of Chaitanya's v2 [2]. It doesn't depend on that patch and applies
>> with or without it.
>>
>> There is no report of a stale VSC_SELECT value on actual hardware, the
>> issue follows from the field being only ORed into.
>>
>> [1] https://patchwork.freedesktop.org/patch/763779/
>> [2] https://lists.freedesktop.org/archives/intel-gfx/2026- 
>> November/400881.html
>>
>>   drivers/gpu/drm/i915/display/intel_hdmi.c | 4 +++-
>>   1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/ 
>> drm/i915/display/intel_hdmi.c
>> index 4ec0db8d93..14dacbb58a 100644
>> --- a/drivers/gpu/drm/i915/display/intel_hdmi.c
>> +++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
>> @@ -552,8 +552,10 @@ void hsw_write_infoframe(struct intel_encoder 
>> *encoder,
>>             !crtc_state->has_panel_replay && type == DP_SDP_VSC))
>>           val |= hsw_infoframe_enable(type);
>> -    if (type == DP_SDP_VSC)
>> +    if (type == DP_SDP_VSC) {
>> +        val &= ~VSC_SELECT_MASK;
>>           val |= VSC_DIP_HW_DATA_SW_HEA;
>> +    }
>>       intel_de_write(display, ctl_reg, val);
>>       intel_de_posting_read(display, ctl_reg);

