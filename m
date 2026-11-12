Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4993606A321
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 11:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SU6WA0KC;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=BqM60Lr+
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6946F112063;
	Thu, 12 Nov 2026 11:52:34 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 746F5112058
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 11:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794484341; x=1826020341;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=umN6DnKDex8z0MOLw2z2TMkTQobAHR3FDtSkI6+/3sk=;
 b=SU6WA0KC1vrAYiEmo6s1GeZoHS7MTo6u22e57SLI0i6kBVYnD7bIuK8/
 uo2FGOhaJHewV/JLFe6iPtSB40CYwCIypM83Ti4lo+rTiHjUpFFX1+XwA
 TF4kwr6RkOcoR06cHTiyiKLF2lj6JvIwqkENkaDwEnpRBIuD41B08ZuZS
 Gs2SFDe8+wIZub3dQ2qL7ZpyPVE9mRBkOclwoGYVSVZe3HjwBcY3oie3e
 4VZ6aTIPSPL0qO7SpSm3RRSOGJuAceAf1iCG96vcPjweWM/+tMJnq+uvi
 QiDNTuCeb45i2iqmOrLBsik7YRhs3qOr6DeWk2JOnWgAZNECBHx294rtG Q==;
X-CSE-ConnectionGUID: 6RKeO6ksSYiCW79+eTIXVg==
X-CSE-MsgGUID: W/ux2x5ZSaKgwYnlFLriGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3132802"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3132802"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:52:21 -0800
X-CSE-ConnectionGUID: JRuFxO0tRoi3SQr3jVpA1g==
X-CSE-MsgGUID: ITGjkNykSfmTvWTcIc7iwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; d="scan'208";a="10407537"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa011.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 03:52:21 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:52:20 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 03:52:20 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.71) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 03:52:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Sc2hE+gOCY8moOTB9zZzmBMtWvU40+3+noaIVRmLimCrI+5mzw8pXy3A/5fqLrnFWIkeAKY41iDWNCNd/4kCo8R3iy+qpzxHvDedA40MXb5gcfKqBq7c1+uOpg8xjSfhUGiOAFuDBp/iNXVz50JlfqjyiLO8L9smtUvYE7D331WI1F6wEO51YWVQBw4wlu0vvRyB0VrfVGSqNl42MX5NMKlbIrL7653cn4EL1SGTmOP78lWGgaUgXejjNXRwAAFEzvol9Q728dx9pwk1gSY/9E4h+B4/dhG4Rw6zce6HXyDcdUSJjRn92Vb9QHD+O5NOsV+LBc2lJ9K95He0RyIeRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WPFNmpZ26WscB13G8y72ZwiEIZzCRwACSL0DcY5ZokY=;
 b=CFs/1GVUjgVjtHMdnHG4z35/7daNX5tq4X+G1CbD0vYaw5MYPVUSwWMBv8YhWBZPDdQKjyaqPDN+wo2nObMLi6dBwws/4zc+aQB8Hmh1Cw7lcrk2Hqpfxjan8ceVDCKVy/5Ggw5ayCJquo32Bjiw3knH/SyvrSflQ22/moGFZgo01Uhcv6yjWrwI+FlXpRE58AIiW5lgN4jCy1GjViQKDMCU7+p1JiK1x1UQUA+4ge+nOoynDKJPSYa5meJbOXbbzFK/9yVQ4tOHLRBU1dJofCsgxfor03OOFvupFS5pPuzVzztA33ZsRCmRDu4IWpAW09X9yRLsZQEwpsGVPdJ0gQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WPFNmpZ26WscB13G8y72ZwiEIZzCRwACSL0DcY5ZokY=;
 b=BqM60Lr+M/+rfoKVaCguYaJoCsZM7MGAXUjS0VPUac+w8kAlt7luKXznIpmTTHoH/M1Y4NlB66E5/WQh+0GkTEE2tDNVAeugwTLFP/J0PPIgr8S6KssPQFHFpQzeUbgxQvQQ3zaau1kof32gekAVvRXSD2t7deuOElvwyAf5aMU=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by PH0PR11MB4838.namprd11.prod.outlook.com (2603:10b6:510:40::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 11:52:18 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.008; Thu, 12 Nov 2026
 11:52:18 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Maarten Lankhorst <dev@lankhorst.se>, Tomasz Lis <tomasz.lis@intel.com>
Subject: [PATCH v8 3/5] drm/xe/ggtt: Split GGTT into usable and shareable pools
Date: Thu, 12 Nov 2026 12:51:45 +0100
Message-Id: <20261112115147.2329912-4-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112115147.2329912-1-piotr.piorkowski@intel.com>
References: <20261112115147.2329912-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BE1P281CA0387.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:80::10) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|PH0PR11MB4838:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a34cfd9-a361-4b5a-8f1f-08df40b366fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|6133799003|22082099003|261009223027099003|18002099003|261022115727099003|261022075727099003|261021130227099003|261022113327099003|261022105027099003|261021121427099003|261021135927099003|261026130827099003|261102130727099003|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021123027099003|56012099006|10067099003|11063799006;
X-Microsoft-Antispam-Message-Info: Uym6TIuwF62DUDevrgf9ErZjtpn41kclUl5chCLGkL4LXq3yYIl2SjltkziImQ8tyRgUHgyPnsixwiSO5KQz1frh6MQbQ+hjzOHiKzJYXAH4gFj2uVciBZFKAKNSSyjlVfz4pQB9WAKjUzf3u0pLAzXQ5VncfqwNUTYi/JodzADQugIYw8ZT3JjCr1nGFFp8byYIV5Z0x4ZCTWmKmj7GBTrdiU9GGHulWRZUoDyWYCgRpWdxRiCL8e/6/qf37eVVL5ZAQQjwP76hJO7lTXZVOCeUlHDzzY7sx8w4XC71JvO37METX4kuJ9qRmmZn76cIosRIJk4ftjv4a8PyafBqPsPGM3DcqlbUpsxjhYD8CjXvFPDxm4/uT8uh9T1abrl5dHbkfcZINThwc6ImvDhuq9UtYUf8gjLsiZJi9G3adOmsJ0T8OL0+NTRslZkFIWi4s5uQLBdddZxYifPDZKcgd30fSNGqBzK7UFC61v/ty3nmbmbIydzeLRdOxYjG+CfJomKpGs4f9A30T+VtdXz4sQnBiYROAIKnsMhCzRhM8WuVa9uLp3RjhxsU7zus0opnYEw+9s9pg4Tp6M+GVrf40tsWojdc0s+tIk8OQne56T5phr4PV93ucZhXHlsMEbB5jimslFlWDDJyI/8O0pTjGP1syd4kg7VUFey+dhDSP58=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(6133799003)(22082099003)(261009223027099003)(18002099003)(261022115727099003)(261022075727099003)(261021130227099003)(261022113327099003)(261022105027099003)(261021121427099003)(261021135927099003)(261026130827099003)(261102130727099003)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021123027099003)(56012099006)(10067099003)(11063799006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OUZHTUs2clE3a2ZqdCs5WU81aXBkTmRRZ3FhZ2hWUlJRWkRHbXh0R0pTa1hV?=
 =?utf-8?B?cTQ4TDVMS0hneXVEY0xmaDh6VTFCYlRBQWI3alpxb3FaRzJ5UVREVUxQc3Ir?=
 =?utf-8?B?eDREdnVxWWRmeksxQkY2KzZtSVF1Sm95UG9lTHhWZDBRM0M5YlFxdEIwbXNO?=
 =?utf-8?B?cUk4VDFUaHMvNWMwZVNqajhISGtiYWg2SjFQUW5Yemxuelc0ZS9TTnRETzNn?=
 =?utf-8?B?ZEV6UW9EU1JXRzgybkdEcjF2VjMvMnJLRHE1VEVVdkU4MWRsck1VYkR0OTZC?=
 =?utf-8?B?ckhwalF2YUxubzRDSmozUjRrak1LeGZWOEpib2VQT28xOGk4Y2Q3aDFhakJ4?=
 =?utf-8?B?cUVhM3pkQXg4bmx1TENhTTRua0VuT3M4YXAvOXBOTWl2THJ6Q2p0ZlVKc2lV?=
 =?utf-8?B?c2hqOExTSnVMQWJKdFdEZkNpcDlvNE0vcGl4WFdJNzErMDNhT3duUkFNUVl1?=
 =?utf-8?B?TkxQczRwdk9nbkNVY2t4TkFRamF4U0JRTUsyTE9WdlBzbnlEQ05uTktseDho?=
 =?utf-8?B?aGIzL2l0RlUvZCtGMU1lODNOYVl3TXptTysxTFBYNkZMSHlCT01CZXM0U3Fx?=
 =?utf-8?B?blZHWmo3Rlc5eTQvWm1kNndJdUFpS0dWc3VzUDU4UWIzWGpFNmNjV1FleWZ1?=
 =?utf-8?B?dW42ZmcxVWxYRHVDNVNtcENhYXBEVnhiajJQTVgwOE9kRXZENnZ1MzdlQ0gw?=
 =?utf-8?B?RUtMbW9yM0xod1JiV3U4azBDb0lXeldzMlljdFZadythOFUzS29sQUxpSURj?=
 =?utf-8?B?Zi9wcUY0NjFSUGtqa1VwNXpqR01OSXA3TWhOdUpIVjNLd2VOcGJIczEva3Ri?=
 =?utf-8?B?REplV0FSdjV3VTVBanE0V0txM0doZyt4bE1tV1NrM0UrL01BRE9rbnlmaTdN?=
 =?utf-8?B?TTdTNHVId2M5YnpkODFnVDJuQy9OYUNhakFpeFA2OUVlV0h1TDFhZlZtaFZV?=
 =?utf-8?B?dW1abmdwczR2U0xzcHdIMVNXSld3bUM2bFpIdHdocWQ0eEZ4TzU1N0c5RHZn?=
 =?utf-8?B?ZFplb2VyUnZJbWF3WG9tTXdNZEg3aEkwWDkzTE51czdaWStEOUtPUUd1Sng0?=
 =?utf-8?B?aE9FM0UwZWExWUNiSG81Rm01NGh3WnBwMFBTUFhYd1JMMXA5akg5S2pyTzYy?=
 =?utf-8?B?N1E0alhNcWxSQkpWeVdtL0pNczluQjJnV0FBbUU1MnV5bmhkRkRrZDVSOStY?=
 =?utf-8?B?V1hKUkhxOWc0MTBFajVNM3lpa1haVE9pYkpyenhMdTVuWDdXRlV2amhkWGgz?=
 =?utf-8?B?bEkwbEpJNkJsN3BYTHZqMDNkeFAxM0RtNDZHanFKVnZmbkIwbHVadWltRmxu?=
 =?utf-8?B?UlFmSnRlQ3NadndxckZ2VzBERHNzNTFRSW5ha1Fva3hsZ1dlcFk2STdJc25V?=
 =?utf-8?B?anUzV1lUNVdvaXVXSEFINEFsMVVCN2I3NlZ2dFIyR0FUM3k2cXZKeHFVRGlN?=
 =?utf-8?B?Ris1K0Q1MGlqSFRHdEJ5VjR3bngyZ0Z0cDlMcXd0c3NPdEw2U0hXTnZCTmRP?=
 =?utf-8?B?SmtFOTNodVRCVkdVU2kxaStoUnViZ2xYeHhVak9sUGR5bFNmRGJaV0t6ZlZD?=
 =?utf-8?B?UTVCeTdjT1dBb2Zyd21LM0F2UDV4dkNJeEhFeVVtZEgwZkdQZDVBYWtXOElO?=
 =?utf-8?B?d1JtRHh3S25yOVVXY01xU1JqeklSSDI5TUpaRk4zNUIvV2JNMTcrbTVBOW9m?=
 =?utf-8?B?N0RFK1lsSnRBUklwaXZNU3B6RHVibmkrTStxb0VJejNUa2wzNjZQRUx2V1k3?=
 =?utf-8?B?aWpVU2ZRblFscUNxUGRxSms4UndBd253ZSthdUw0b0ZQa0ZLalB3SHlsMFdH?=
 =?utf-8?B?cEFBSTJuYlJNUlVPMXdNNXJPbzlmSG5VTzkzdkc1Unp2Uk83M0VSNlN5cDhT?=
 =?utf-8?B?dTl6S2VhZ3pVZ3QxREVtL2ZZaXgrdUg0NW1tckZZRVFQWVRXYnNQOFNqODJJ?=
 =?utf-8?B?SGRLaVJPWFhTbzg3UktOaHc2dVpZVFRWMWZTbjJ1Vjl6QXNpQWllakRWbk9u?=
 =?utf-8?B?OXhlaUtCcFFkcE44UTRsSVFBODV1Nm9QckJGZGlzVWo2YlgwVWhDczM4Mm1C?=
 =?utf-8?B?V1ljanhFYmJlZk4zT0grVGdpOEswN2xoNVYzZEFuUnJDSkZrU3Y4WkNIUUdV?=
 =?utf-8?B?R2dIVXdtU3hTMldiNitxNlAwTFg0bzBOUDkraUpHQnQ3YkNHVExML29LSWNF?=
 =?utf-8?B?UjJVcUlJT1liRjBrdEZHNGZNeWZ0RVpBV0t0ZGdEMENweTJHZ2R0M0JYZ0wy?=
 =?utf-8?B?bmI5N2VsTnBtMCt4ZytOdElWTDd3dVo3cmpabitPTU1WZ2NJSzJoaDdrdEVp?=
 =?utf-8?B?Ujlzd25mOE1tcS9HSVZVK3ZWakZJcnAwWVJFOWFZaG1KaWhpY2tCOUZWcGlR?=
 =?utf-8?Q?/jJ6iQ/VFB+W8VVQ=3D?=
X-Exchange-RoutingPolicyChecked: GpPqWvTdD2zEmPLLciraWhQ5DdTvD/yGlsppr9zwfUYcr53dTVpI9QC7ZcxiD8xxeWt/7Caz+RvOdSkwg33Vxdfg7X8ijpQA5JX5O/6qnO52QdTrA9mTDo37JoSvO6Mo4gia43Q2jMkV7mq6zBBJMcNT+kd0iyBozQBw0yhcMX5oYLADvlOJMa+EFJ8AkiQVCyK3xHQ8B7NMoHCsx4c08FbiUxWEu7bI03jhgY58r8yngQ4zZWha17Op7e7ciAoCW1PuiX4vTXoD3PQlGh/72jdlwL59JlUWY4eXvWwrBuBm1nuAv/ZdNCLjU03Ner+4rWG/529BYLDAsTYgfefNVg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a34cfd9-a361-4b5a-8f1f-08df40b366fb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 11:52:18.3037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OLPCsgKyX3ILMBfwuAnHwA4UsaK/mWRcJcVPQJnMNU0hL1KX096NLbx96KQMelsMAgFEo56xMe5yKCtGdi29tiwg+m6dwH2wvqLyKTLcQ7U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4838
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Driver-owned GGTT allocations and VF provisioning currently use a single
GGTT pool. Split it into a usable pool for driver-owned allocations and a
shareable pool for VF provisioning.

The pools are separate logical ranges and may overlap, but allocations are
limited to the configured size of their corresponding pool. Allocate from
the bottom of the usable pool and from the top of the shareable pool when a
shareable pool is present.

Add separate insertion APIs for the usable and shareable pools.

v2:
 - Rename ggtt->usable_size back to ggtt->size.
 - Remove the ggtt_insert_node_in_range() helper.
v3:
 - Introduce the full_size struct field instead of the ggtt_accessible_size
   function.
v4:
 - Set the shareable pool size only for SR-IOV PF,
 - Return -ENOSPC instead of asserting when a large BO no longer fits after
   end is clamped to ggtt->size.
v5:
 - Move range initializer rename and full_size parameter here.
 - Use shareable_size and compute the shareable start on demand.
 - Constrain regular allocations to the usable pool.
v6:
 - Rename ggtt_shareable_start() to ggtt_shareable_offset(), as it returns
   an offset within the GGTT range, not a GGTT address. (Tomasz)
 - Explain why the pool sizes are checked separately. (Tomasz)
 - Drop the guard() conversion in __xe_ggtt_insert_bo_at(), so the GGTT
   lock is again released before the invalidation. (Tomasz)

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <dev@lankhorst.se>
Reviewed-by: Tomasz Lis <tomasz.lis@intel.com>
---
 drivers/gpu/drm/xe/xe_ggtt.c | 157 ++++++++++++++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_ggtt.h |   4 +
 2 files changed, 141 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_ggtt.c b/drivers/gpu/drm/xe/xe_ggtt.c
index 73c45eecae2be..607578e4080e2 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.c
+++ b/drivers/gpu/drm/xe/xe_ggtt.c
@@ -145,8 +145,19 @@ struct xe_ggtt {
 	unsigned int access_count;
 	/** @wq: Dedicated unordered work queue to process node removals */
 	struct workqueue_struct *wq;
+#ifdef CONFIG_PCI_IOV
+	/** @shareable_size: Size of the GGTT range reserved for sharing with VFs */
+	u64 shareable_size;
+#endif
 };
 
+#ifdef CONFIG_PCI_IOV
+static inline u64 ggtt_shareable_offset(struct xe_ggtt *ggtt)
+{
+	return ggtt->full_size - ggtt->shareable_size;
+}
+#endif
+
 static u64 xelp_ggtt_pte_flags(struct xe_bo *bo, u16 pat_index)
 {
 	u64 pte = XE_PAGE_PRESENT;
@@ -360,17 +371,35 @@ static const struct xe_ggtt_pt_ops xelpg_pt_wa_ops = {
 	.ggtt_get_pte = xe_ggtt_get_pte,
 };
 
-static void __xe_ggtt_init_early(struct xe_ggtt *ggtt, u64 start, u64 size)
+static void ggtt_init_ranges(struct xe_ggtt *ggtt, u64 start, u64 full_size,
+			     u64 usable_size, u64 shareable_size)
 {
+	struct xe_gt *gt = ggtt->tile->primary_gt;
+
+	xe_gt_assert(gt, full_size);
+	xe_gt_assert(gt, usable_size);
+	/*
+	 * The usable and shareable pools are separate logical ranges within the
+	 * full range and may overlap, so each is checked against the full size
+	 * on its own. drm_mm keeps the allocations from both pools apart.
+	 */
+	xe_gt_assert(gt, usable_size <= full_size);
+	xe_gt_assert(gt, shareable_size <= full_size);
+
 	ggtt->start = start;
-	ggtt->full_size = size;
-	ggtt->size = size;
-	drm_mm_init(&ggtt->mm, 0, size);
+	ggtt->full_size = full_size;
+	ggtt->size = usable_size;
+
+#ifdef CONFIG_PCI_IOV
+	if (shareable_size)
+		ggtt->shareable_size = shareable_size;
+#endif
+	drm_mm_init(&ggtt->mm, 0, ggtt->full_size);
 }
 
 int xe_ggtt_init_kunit(struct xe_ggtt *ggtt, u32 start, u32 size)
 {
-	__xe_ggtt_init_early(ggtt, start, size);
+	ggtt_init_ranges(ggtt, start, size, size, 0);
 	return 0;
 }
 EXPORT_SYMBOL_IF_KUNIT(xe_ggtt_init_kunit);
@@ -447,7 +476,8 @@ int xe_ggtt_init_early(struct xe_ggtt *ggtt)
 	if (!ggtt->wq)
 		return -ENOMEM;
 
-	__xe_ggtt_init_early(ggtt, ggtt_start, ggtt_size);
+	ggtt_init_ranges(ggtt, ggtt_start, ggtt_size, ggtt_size,
+			 IS_SRIOV_PF(xe) ? ggtt_size : 0);
 
 	err = drmm_add_action_or_reset(&xe->drm, ggtt_fini_early, ggtt);
 	if (err)
@@ -641,6 +671,11 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
 	ggtt_invalidate_gt_engine_tlb(ggtt->tile->media_gt);
 }
 
+static inline u64 xe_ggtt_bottom(struct xe_ggtt *ggtt)
+{
+	return xe_wopcm_size(tile_to_xe(ggtt->tile));
+}
+
 /**
  * xe_ggtt_shift_nodes() - Shift GGTT nodes to adjust for a change in usable address range.
  * @ggtt: the &xe_ggtt struct instance
@@ -652,24 +687,63 @@ static void xe_ggtt_invalidate_engine(struct xe_ggtt *ggtt)
  * This function may be called multiple times during recovery, but if
  * @new_start is unchanged from the current base, it's a noop.
  *
- * @new_start should be a value between xe_wopcm_size() and #GUC_GGTT_TOP.
+ * @new_start should be a value between the GGTT bottom and #GUC_GGTT_TOP.
  */
 void xe_ggtt_shift_nodes(struct xe_ggtt *ggtt, u64 new_start)
 {
 	guard(mutex)(&ggtt->lock);
 
-	xe_tile_assert(ggtt->tile, new_start >= xe_wopcm_size(tile_to_xe(ggtt->tile)));
+	xe_tile_assert(ggtt->tile, new_start >= xe_ggtt_bottom(ggtt));
 	xe_tile_assert(ggtt->tile, new_start + ggtt->size <= GUC_GGTT_TOP);
+#ifdef CONFIG_PCI_IOV
+	xe_tile_assert(ggtt->tile, ggtt->shareable_size == 0);
+#endif
 
 	/* pairs with READ_ONCE in xe_ggtt_node_addr() */
 	WRITE_ONCE(ggtt->start, new_start);
 }
 
-static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node,
-				      u32 size, u32 align, u32 mm_flags)
+static int ggtt_insert_node_in_range_locked(struct xe_ggtt_node *node, u32 size,
+					    u32 align, u64 range_start,
+					    u64 range_size, u32 mm_flags)
 {
-	return drm_mm_insert_node_generic(&node->ggtt->mm, &node->base, size, align, 0,
-					  mm_flags);
+	struct xe_ggtt *ggtt = node->ggtt;
+	u64 range_end = range_start + range_size;
+
+	lockdep_assert_held(&ggtt->lock);
+
+	if (!range_size || range_end <= range_start)
+		return -EINVAL;
+
+	if (range_end > ggtt->full_size)
+		return -ERANGE;
+
+	if (size > range_size)
+		return -ENOSPC;
+
+	return drm_mm_insert_node_in_range(&ggtt->mm, &node->base, size, align, 0,
+					  range_start, range_end, mm_flags);
+}
+
+/*
+ * When the shareable range is present, allocations start from the bottom
+ * to leave space at the top; otherwise they start from the top.
+ */
+static u32 ggtt_usable_insert_flags(struct xe_ggtt *ggtt)
+{
+#ifdef CONFIG_PCI_IOV
+	if (ggtt->shareable_size > 0)
+		return DRM_MM_INSERT_LOW;
+#endif
+	return DRM_MM_INSERT_HIGH;
+}
+
+static int xe_ggtt_insert_node_locked(struct xe_ggtt_node *node, u32 size, u32 align)
+{
+	struct xe_ggtt *ggtt = node->ggtt;
+
+	return ggtt_insert_node_in_range_locked(node, size, align, 0,
+						ggtt->size, ggtt_usable_insert_flags(ggtt));
 }
 
 static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
@@ -686,12 +760,12 @@ static struct xe_ggtt_node *ggtt_node_init(struct xe_ggtt *ggtt)
 }
 
 /**
- * xe_ggtt_insert_node - Insert a &xe_ggtt_node into the GGTT
+ * xe_ggtt_insert_node() - Insert a &xe_ggtt_node into the GGTT
  * @ggtt: the &xe_ggtt into which the node should be inserted.
  * @size: size of the node
  * @align: alignment constrain of the node
  *
- * Return: &xe_ggtt_node on success or a ERR_PTR on failure.
+ * Return: &xe_ggtt_node on success or an ERR_PTR on failure.
  */
 struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align)
 {
@@ -703,8 +777,45 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 		return node;
 
 	guard(mutex)(&ggtt->lock);
-	ret = xe_ggtt_insert_node_locked(node, size, align,
-					 DRM_MM_INSERT_HIGH);
+
+	ret = xe_ggtt_insert_node_locked(node, size, align);
+	if (ret) {
+		ggtt_node_fini(node);
+		return ERR_PTR(ret);
+	}
+
+	return node;
+}
+
+#ifdef CONFIG_PCI_IOV
+/**
+ * xe_ggtt_insert_node_shareable() - Insert a new node in the shareable GGTT range
+ * @ggtt: the &xe_ggtt into which the node should be inserted.
+ * @size: size of the node
+ * @align: alignment constrain of the node
+ *
+ * Allocations always start from the top (DRM_MM_INSERT_HIGH).
+ *
+ * Return: &xe_ggtt_node on success or an ERR_PTR on failure.
+ */
+struct xe_ggtt_node *xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align)
+{
+	struct xe_ggtt_node *node;
+	int ret;
+
+	if (!ggtt->shareable_size)
+		return ERR_PTR(-ENOSPC);
+
+	node = ggtt_node_init(ggtt);
+	if (IS_ERR(node))
+		return node;
+
+	guard(mutex)(&ggtt->lock);
+
+	ret = ggtt_insert_node_in_range_locked(node, size, align,
+					       ggtt_shareable_offset(ggtt),
+					       ggtt->shareable_size,
+					       DRM_MM_INSERT_HIGH);
 	if (ret) {
 		ggtt_node_fini(node);
 		return ERR_PTR(ret);
@@ -712,6 +823,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 ali
 
 	return node;
 }
+#endif
 
 /**
  * xe_ggtt_node_pt_size() - Get the size of page table entries needed to map a GGTT node.
@@ -795,6 +907,7 @@ void xe_ggtt_map_bo_unlocked(struct xe_ggtt *ggtt, struct xe_bo *bo)
  *
  * This function allows inserting a GGTT node with a custom transformation function.
  * This is useful for display to allow inserting rotated framebuffers to GGTT.
+ * Allocates from the usable range only.
  *
  * Return: A pointer to %xe_ggtt_node struct on success. An ERR_PTR otherwise.
  */
@@ -815,7 +928,7 @@ struct xe_ggtt_node *xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 		goto err;
 	}
 
-	ret = xe_ggtt_insert_node_locked(node, size, align, 0);
+	ret = xe_ggtt_insert_node_locked(node, size, align);
 	if (ret)
 		goto err_unlock;
 
@@ -882,10 +995,14 @@ static int __xe_ggtt_insert_bo_at(struct xe_ggtt *ggtt, struct xe_bo *bo,
 	else
 		end = 0;
 
-	xe_tile_assert(ggtt->tile, end >= start + xe_bo_size(bo));
+	end = min(end, ggtt->size);
 
-	err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
-					  xe_bo_size(bo), alignment, 0, start, end, 0);
+	if (end < start + xe_bo_size(bo))
+		err = -ENOSPC;
+	else
+		err = drm_mm_insert_node_in_range(&ggtt->mm, &bo->ggtt_node[tile_id]->base,
+						  xe_bo_size(bo), alignment, 0, start, end,
+						  ggtt_usable_insert_flags(ggtt));
 	if (err) {
 		ggtt_node_fini(bo->ggtt_node[tile_id]);
 		bo->ggtt_node[tile_id] = NULL;
diff --git a/drivers/gpu/drm/xe/xe_ggtt.h b/drivers/gpu/drm/xe/xe_ggtt.h
index c864cc975a695..59b2f02870195 100644
--- a/drivers/gpu/drm/xe/xe_ggtt.h
+++ b/drivers/gpu/drm/xe/xe_ggtt.h
@@ -24,6 +24,10 @@ u64 xe_ggtt_size(struct xe_ggtt *ggtt);
 
 struct xe_ggtt_node *
 xe_ggtt_insert_node(struct xe_ggtt *ggtt, u32 size, u32 align);
+#ifdef CONFIG_PCI_IOV
+struct xe_ggtt_node *
+xe_ggtt_insert_node_shareable(struct xe_ggtt *ggtt, u32 size, u32 align);
+#endif
 struct xe_ggtt_node *
 xe_ggtt_insert_node_transform(struct xe_ggtt *ggtt,
 			      struct xe_bo *bo, u64 pte,
-- 
2.34.1

