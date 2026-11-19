Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05318606A324
	for <intel-xe@archiver.kernel.org>; Thu, 19 Nov 2026 15:56:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CveIWIns;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=cLoSFV14
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C050A11262B;
	Thu, 19 Nov 2026 15:56:31 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB93111262B
 for <intel-xe@lists.freedesktop.org>; Thu, 19 Nov 2026 15:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795103781; x=1826639781;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=kiYeI1V8dwwY7496tEoGQHhamHleQDEeuRxqi3HkBBk=;
 b=CveIWInsbsg/YGabpIirJ4kvSnlo+N54jeAuSSBUNPbYSkWKXWfpdPM0
 86JmH/GUgVzvYfaix8Wwn8pcIsZkgK/PIpPJZRZWS4QUdu8Bfcr+UAP6N
 hrKcAOMzACI/zkEyXfioKqL3CvpiF4XkTttEQV5vs1afF73sNfm9STGhf
 TQtP2cVKeZCZa76wVHiJDekUWsxsdc4sAfP74Pu++NeRcEZRFkcojBTAr
 NH7g9AAk2G6INva7ucJ1nZbH5D6bAHEPNYxb+4eyAfPROKzRv4JyD1reX
 LzbJbm6yTHNoEYL3f09ecmlqQv0dLo357J7rmHSlO8pkB7U2Az1Lox2Nf A==;
X-CSE-ConnectionGUID: WotBVr7eTzWXzAixhBTppQ==
X-CSE-MsgGUID: cu5VQx00SFGeClrw5Y7otg==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="3849263"
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; 
   d="scan'208";a="3849263"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 07:56:21 -0800
X-CSE-ConnectionGUID: UJjWKHbCQcy2cOqMQwhKFg==
X-CSE-MsgGUID: t44IBLFhRK6c9UECGrXEjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,221,1787036400"; d="scan'208";a="10714038"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2026 07:56:21 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 07:56:19 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 19 Nov 2026 07:56:19 -0800
Received: from BN1PR04CU002.outbound.protection.outlook.com (52.101.56.3) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 19 Nov 2026 07:56:19 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ERmmsL3AZxnIHFtmmAIQWwhXrVss0otTZ+pIz45tbtdq3ebHw/D7LhBnwKlKMij+vdnUEErKYv+PfcKgFtc3QWs5DdIr/1OTgBe39ASZOyHu/fyVZSQVvyYCgY8m0BikJPPozx6rdAzXzfrzoL2zO5YBXNjnJHiGN3UZ1P5HtIIVSZumZHBADVsQiKf1EzVRmVRUNvMAUAWvKmA7Ixk/7eRsz0g7lao9OWKaBL8yXkV3jkS1ShVitXMdqbeVCM4X9KMDDLruZPEgP2IMVGf02vu9xvcFZKFAq14YcYA+S07TCjcwGjuWlTp7X9bfafBN4/aohBY079aEAQhl5AL8Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FL4hXu4r31peeaOEqzZlPhyMVqbRbygvINERF+xhtGs=;
 b=T77oikhJaTdCQ/JqbNZZzWYIU5JtdLex3hRHGdeECLLmc03quLf2iWEcNSJEkTqMb+C0vFMvqfLE14mzpnDooxQykJ9dwa1BwHAtm+/NRGl9mjcycR+yb0ifNsL3aCHrXxRW7AEt9HycXRmDLizGwRf/EwxSowBzmSfK142VdS22ecPubMlGWUhClmXMj0UQWY947PSQRCBBLzZKf9IGbFQQPo/dO86cRRfzUyYs1u9k7cFXG7ybAUpMqDcxObK+ACNRU/BJgFvZZ2sK/b10T83jX+FwNvJS16vPZBh83wOjAx+mhjq4kbPWK4VAHmtUMo5arXIqCUeZ7E65IsVv4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FL4hXu4r31peeaOEqzZlPhyMVqbRbygvINERF+xhtGs=;
 b=cLoSFV14YwWjdH/xSlSmo9wp3UoLa4sb8ioOsH19/KWkMdF0fMYkfhuwSvvfAS3PmSoMpWaIeylHlZRLwu9VXkrlTo1+WfMJD1Uh3cqQeRAOg2mBvudOHORuKyDKWsuwI8Mu7b3CZEDz2QW5+9gVi84iB0HtqXvvMFztk+y/oOs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS3PR11MB088214.namprd11.prod.outlook.com (2603:10b6:8:43e::10)
 by DS6PR11MB857830.namprd11.prod.outlook.com (2603:10b6:8:4c5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Thu, 19 Nov
 2026 15:56:12 +0000
Received: from DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3]) by DS3PR11MB088214.namprd11.prod.outlook.com
 ([fe80::ca0:ae4:8e4a:85f3%4]) with mapi id 15.21.0615.013; Thu, 19 Nov 2026
 15:56:12 +0000
Message-ID: <35f34587-ba42-4adf-9d1b-ac6ecb7e06e0@intel.com>
Date: Thu, 19 Nov 2026 21:26:06 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/xe: Add sysfs to disable RPe
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20261118012453.626087-3-vinay.belgaumkar@intel.com>
 <20261118012453.626087-4-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Anirban, Sk" <sk.anirban@intel.com>
In-Reply-To: <20261118012453.626087-4-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0110.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1b5::10) To DS3PR11MB088214.namprd11.prod.outlook.com
 (2603:10b6:8:43e::10)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PR11MB088214:EE_|DS6PR11MB857830:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb9f62f-f34e-4092-2d9b-08df4655a250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|56012099006|261022105027099003|261021121427099003|4143699003|11063799006|10067099003|261026140227099003|261021123027099003|261028144727099003|261102123227099003|261009223027099003|18002099003|22082099003|6133799003|3023799007;
X-Microsoft-Antispam-Message-Info: 1moTDrPMQF150TIeuLbB7Mw1ulCd0F4y6ZGBTNpdc8CEMJKtqHC3rw7/8/dEUjO3MaE8yidNftaqYQ9NQ1dE9Cfuab5uzIInlNpkQjxOOFb06JXWNQAJMA+wV5FIK+GWcTzzUAExe3YXLbkEt33CyN0v16uYqkpm/OJfiCThn8WsX7PVW+/owGQno6ETN/IeSxECEWn53dWYkmCFBT5v3bzZlrTQsUkHhA++ErKbm7EkY28fmVYmDfz4klNa0imw5JWBR7Zbiy/Dpxrcf+sxdeP5tFT7CKQlTfLaYiH2D/agdq8s38LD9fE8WO6ThVepRWi2rRSkFzA4y5y9Y8oEcrPKTMlwbL9bEF6SDL5Jg9adtp5c8Jb7/bBCMY07G1+Fh4laf1ggeTU0SDs+fKb/G6okJmeprSYiSc3hvTlTjWvQ3u04lTbLSFJa+3YIKliqOTmomdPliAP/JOv7Pn4ahh4p7m7lh0yHUl7Qj2qikJ9wBnRYn/Ygzs7NlteKVMugI6DKSMtoBHzQkdB2eL5fGsAw8SL23QhfCT+5c0Cxg0EoCCSdfBpRyZ7K03+1lKHzEE7K7bDrN7dWuMqLjy0gGjSZIErkVFwQq+J7PwHGxxZdLgesTnyR5kaju1HcU1giNxH75Ck+t1HqZZtYjVbsXTlgpaq/tA1eEkvWZBxFP6U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS3PR11MB088214.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(56012099006)(261022105027099003)(261021121427099003)(4143699003)(11063799006)(10067099003)(261026140227099003)(261021123027099003)(261028144727099003)(261102123227099003)(261009223027099003)(18002099003)(22082099003)(6133799003)(3023799007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RXQ5bzRMRi9JL3FORDYrTzF1ZkFkVHNXQmtrK3hKZ0NWYVJFcDNFZHV6SWVh?=
 =?utf-8?B?MGR6RXkzSnZQWUZwRUx4dVBoYmZ2a2lWeG9mOXF4MTVhRlBDMGNiTVk4RG8z?=
 =?utf-8?B?WTljcG9YbGxuaUN3QTB0d0hnYVZjUUdUQzVyRFdWMkdvTFVER1NZTmlqU1lQ?=
 =?utf-8?B?RTNib3ExT1dGcU9xcU5DMjRsQ0wwYk9UYUlSTHRMTzFVRzZNQkZ5c0NIVEZR?=
 =?utf-8?B?ZzlhdFRDaUtUR3loTnMyQmJlM3lsVkcwWTFHYS9uMnpReGQ2UVdWOTZWWjBx?=
 =?utf-8?B?ZllWbTBEYjhCZWQ5ejd3ZWtpUU9NcnZ1RDlrZUJpeWdmTVRVZm9SL1hYMmxX?=
 =?utf-8?B?QlFFRC9rNlBSVTh2SDZJOFV6WXV0RFl2RzE3NHl5VFJKRHUrY3VYMFZ2T1Vw?=
 =?utf-8?B?Rk5VOUhOb2haTVBlRTV3eCtDUU1NVnVPcmptRStGNUdvWm1mRWtWV29tZk84?=
 =?utf-8?B?SjhmWDdpZ2l1ajcyaTRYSGlHcGt6RVlVcnRpN1lVdjdEUitjNm1HSGgrQUxK?=
 =?utf-8?B?T2NiNE1HV1VkbDA4QlFXTk5nazkraFJ3TUI0aGxGOVloV0ZSd0JjUGVJaHEr?=
 =?utf-8?B?UGJrZS9MYUIxTVVNMHdHcHVBWlpRakpRM0RPQ0lXcTluM2NCSEtGckRFaFpU?=
 =?utf-8?B?b2NJYnhycGFVbHZkSkhDVEhZZE9vUjFacHROSlQwZ3dQa2VRazB5OXFxdnh3?=
 =?utf-8?B?VE1jS1ZraHp3N1dJM2tpYUFrL3FLUktGbm9TZmtsTXFLWXR4dHUxT3RFUHVq?=
 =?utf-8?B?MkxPYno0QWN4WlhZS2g2bGlmazJ6a1dtbjg4RTFyeXNGN3plTjc2WDdYK05t?=
 =?utf-8?B?NCsvWUJxcjJKanJCQkRmV0NkTUpSZlNqU1JmTXE3U3YxeUF3UlljVlFaUkQ5?=
 =?utf-8?B?bHcyRnBZMlcyRUk5clc3REZCamtFTEdIM3hGR0Vla0xzckpkWVc3V21Vekxv?=
 =?utf-8?B?aC83TTNIZjZZeUUxWlVlNEE0UmJYRXlnLzJnNkZpNjdDYnV2eWVNaUVWWHp0?=
 =?utf-8?B?ZFczcDFGRHlaWGhITnNHYlYxSHRXdS9xMUNnRDZjczQ4MzNxUCtLZWoxU0E1?=
 =?utf-8?B?Z0lDYVVJWHI2d3NEUUJpK21Cb3FMNFUzcmRFZ2V0Zzg4b1FyZHRiUklsU3VE?=
 =?utf-8?B?N0U1RGxtaXFqQ3BIY0FiSmh0SVprTDhEMkZsY2tNa2F1TWl0ZmpSOWgrK3ZN?=
 =?utf-8?B?K0ErRFk2RCsxejVJdVJRNWozRlBlaUd3TWVvd3A5RXVhY0M0RTMrTnZRUEZT?=
 =?utf-8?B?QmFWN3RFZmg1QkltWHBDYU9CQmxsUDFaWXBkR21KbTdTZndPK3kvNm0wU2Jm?=
 =?utf-8?B?eG96RE9QTUdScENFbjBGZngzZlJYMWEzU2dxb0IrbTF2WVU2WCt5blozSmpa?=
 =?utf-8?B?Y2NGaDl4bXdGb082Q25YRnJtRnVzRUd1cjlwamZpL3Y0SHdUQXJQOWxRQVhL?=
 =?utf-8?B?cTRKVU5TVmVhb3RXS2xwRTZXcURpekhYZ2ZTaWdoMmxTbVh2NkFFaTJKSmVq?=
 =?utf-8?B?R0JPeVpvS3dtUmdBU3I0ZU5VNFptSVYybnpDZ3hPeUtRdlg2UTdTN3hrZFA2?=
 =?utf-8?B?TmRqUVZnV0NqL0daTEVXcDRnbGFUTzEweDZFYjRnRWFXZTB3eVlnUWFwK3ht?=
 =?utf-8?B?ZE5xZ0FlU2k1L0ZicHJCbElmVktrelZ4eEx4UFpFRG9HWWlmc3gwSjVRSUNx?=
 =?utf-8?B?dTd5WEVGdndzeTNuYmFmMHJjTm9uNFNFSW9zZ2l3MHNIaVpaTW1xbXRYOGx2?=
 =?utf-8?B?NE5XcHNzU2RWUFppQzJsa1l2VkduenQ3VUJJVUpGUkJOZGFCSitxZ3YrRVpm?=
 =?utf-8?B?dTRZdC9JZnlDcHBsSHliaXFweW0xQ3JlbW5YZnBFNTVGZTAzd0tRWDNqcTBM?=
 =?utf-8?B?YzdYZ1dKZ0VoM2g4NHE2UjlXSUdXQU9xZ0Y1andCTDhLL1BRajhidmEzWWtT?=
 =?utf-8?B?NW1RbnBKR1E5Ty81WFFDMkVEMjYydk5UT2FaOWxvZnV2RDNsSzMxWi82d0p4?=
 =?utf-8?B?ZWZpbFNScjhpTTBteHZjZkg1alhNYUlxSXNEdWlQSFdXam1GUFpFbEgrVkRU?=
 =?utf-8?B?cXVMcmcxVnhCbExsaEtMQk42bnJDMkpYWkdESjlvNEpRckxXdytGdnFFYlFr?=
 =?utf-8?B?VlQxMFdJNHlXOTNNSXl2RzFGUndQUWtiNW9hVXB0SEVKaXJzV3dsQmtmc2Rr?=
 =?utf-8?B?d2VudWtRNTFJRzRBVjdWL205d1orbTJyQTBocHVTUm9YTVhMWVk5RGJEWGhZ?=
 =?utf-8?B?b29ZK1ByMUFVRlZTQ0tlQWlHQzVGRkpwRk9vWFoxbURlemJXWU1Gb2RuWUlI?=
 =?utf-8?B?c0NqaFVXdmhTUXNRRHlReTVGcEhhTTBOUC8rODNLczVEMFVLL0tFZz09?=
X-Exchange-RoutingPolicyChecked: zOjcs9R5Mf0hRgxJFUw+WqecdfncFlve83Wxxrf2Dm5EXPSq0EKnqcxUNqNpKWcMwyh5YOXakJED3J9n8o/w4auoTGKMiG52kb/pM+o2Iylt7Y35wv4HMUhteu8wxaJlwpaVYZVaZblLcrsatFc67evl1P2TMwNklF4HrvzvOvMGnrNiNE5gT6glvaOJFdTvt14O/myUZPH4MkkKYvXgq3g94UZt1xcf/QMqN1A7UGNjFQIbGQ4gkOAg2zc8bVIQf9hJzXSXlsXzXFv9OEirivgqPCLMyoUSWkA47n5audKOmUzcbk7kQHk4rVCpM2ZM7V+BLCEERnK+LEbjm+2kuw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb9f62f-f34e-4092-2d9b-08df4655a250
X-MS-Exchange-CrossTenant-AuthSource: DS3PR11MB088214.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 15:56:12.0320 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zmqgyj2QUT8MLcGAiX7nms+YaVPqpTBtIDVNEbr7MrUzKbMWLmptTUf3u4zW1nZot3DWz5fIXI/zGXE8GYaYVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS6PR11MB857830
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

Hi Vinay,


On 18-11-2026 06:54, Vinay Belgaumkar wrote:
> When SLPC is initialized, GuC sets the GT min freq to RPe(efficient) by
> default. This frequency is desgined for optimal perf/power ratio. However,
> certain use cases may want to run at lower frequencies. This sysfs allows
> user to disable use of default RPe behavior.
>
> Efficient frequency will now be controlled by this interface alone. Setting
> min_freq < efficient will not disable RPe. When RPe is enabled, GuC raises
> min to RPe and lowers it back when disabled.
>
> Update pc_set_mert_freq_cap() to now disable RPe before stashing min freq.
> This ensures we are saving the real min freq instead of the elevated one.
>
> $ cat /sys/class/drm/card0/device/tile0/gt1/freq0/use_rpe
> 1
>
> v2: Address Sashiko comments.
> v3: Disable RPe before stashing freq before mert cap (Sashiko)
>
> Cc: Sk Anirban <sk.anirban@intel.com>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_freq.c      | 35 +++++++++++++
>   drivers/gpu/drm/xe/xe_guc_pc.c       | 76 ++++++++++++++++++++++++----
>   drivers/gpu/drm/xe/xe_guc_pc.h       |  1 +
>   drivers/gpu/drm/xe/xe_guc_pc_types.h |  2 +
>   4 files changed, 105 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_freq.c b/drivers/gpu/drm/xe/xe_gt_freq.c
> index a40dd074106f..38c4f17ba99c 100644
> --- a/drivers/gpu/drm/xe/xe_gt_freq.c
> +++ b/drivers/gpu/drm/xe/xe_gt_freq.c
> @@ -242,6 +242,40 @@ static ssize_t power_profile_store(struct kobject *kobj,
>   }
>   static struct kobj_attribute attr_power_profile = __ATTR_RW(power_profile);
>   
> +static ssize_t use_rpe_show(struct kobject *kobj,
> +			    struct kobj_attribute *attr,
> +			    char *buff)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +
> +	return sysfs_emit(buff, "%u\n", pc->use_rpe);
> +}
> +
> +static ssize_t use_rpe_store(struct kobject *kobj,
> +			     struct kobj_attribute *attr,
> +			     const char *buff, size_t count)
> +{
> +	struct device *dev = kobj_to_dev(kobj);
> +	struct xe_guc_pc *pc = dev_to_pc(dev);
> +	int err;
> +	u32 val;
> +
> +	err = kstrtou32(buff, 0, &val);
> +	if (err)
> +		return err;
> +
> +	if (val > 1)
> +		return -EINVAL;
> +
> +	guard(xe_pm_runtime)(dev_to_xe(dev));
> +	err = xe_guc_pc_set_use_rpe(pc, val);
> +
> +	return err ?: count;
> +}
> +
> +static struct kobj_attribute attr_use_rpe = __ATTR_RW(use_rpe);
> +
>   static const struct attribute *freq_attrs[] = {
>   	&attr_act_freq.attr,
>   	&attr_cur_freq.attr,
> @@ -252,6 +286,7 @@ static const struct attribute *freq_attrs[] = {
>   	&attr_min_freq.attr,
>   	&attr_max_freq.attr,
>   	&attr_power_profile.attr,
> +	&attr_use_rpe.attr,
>   	NULL
>   };
>   
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.c b/drivers/gpu/drm/xe/xe_guc_pc.c
> index ea47b0ded83a..5ff3df99464b 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.c
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.c
> @@ -344,6 +344,21 @@ static void pc_set_cur_freq(struct xe_guc_pc *pc, u32 freq)
>   	pc_set_manual_rp_ctrl(pc, false);
>   }
>   
> +static int pc_set_ignore_eff_freq(struct xe_guc_pc *pc, u32 val)
> +{
> +	struct xe_gt *gt = pc_to_gt(pc);
> +	int ret;
> +
> +	xe_device_assert_mem_access(pc_to_xe(pc));
> +
> +	ret = pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY, val);
> +	if (ret)
> +		xe_gt_err_once(gt, "Failed to set ignore_eff_freq to %u, %pe\n",
> +			       val, ERR_PTR(ret));
> +
> +	return ret;
> +}
> +
>   static bool pc_freq_in_range(struct xe_guc_pc *pc, u32 freq)
>   {
>   	/*
> @@ -358,13 +373,6 @@ static int pc_set_min_freq(struct xe_guc_pc *pc, u32 freq)
>   	if (!pc_freq_in_range(pc, freq))
>   		return -EINVAL;
>   
> -	/*
> -	 * GuC policy is to elevate minimum frequency to the efficient levels
> -	 * Our goal is to have the admin choices respected.
> -	 */
> -	pc_action_set_param(pc, SLPC_PARAM_IGNORE_EFFICIENT_FREQUENCY,
> -			    freq < xe_guc_pc_get_rpe_freq(pc));
> -
>   	return pc_action_set_param(pc,
>   				   SLPC_PARAM_GLOBAL_MIN_GT_UNSLICE_FREQ_MHZ,
>   				   freq);
> @@ -1091,12 +1099,23 @@ void xe_guc_pc_remove_flush_freq_limit(struct xe_guc_pc *pc)
>   static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>   {
>   	int ret;
> +	u32 mert_freq_cap;
>   
>   	if (!XE_GT_WA(pc_to_gt(pc), 22019338487))
>   		return 0;
>   
>   	guard(mutex)(&pc->freq_lock);
>   
> +	/*
> +	 * Disable the RPe floor so the min queried below reflects the real
> +	 * underlying minimum (RPn or user_requested_min) instead of a value
> +	 * GuC may have elevated to RPe. This stays disabled until
> +	 * xe_guc_pc_restore_stashed_freq() reinstates it.
> +	 */
> +	ret = pc_set_ignore_eff_freq(pc, 1);
> +	if (ret)
> +		return ret;
> +
>   	/*
>   	 * Get updated min/max and stash them.
>   	 */
> @@ -1109,7 +1128,9 @@ static int pc_set_mert_freq_cap(struct xe_guc_pc *pc)
>   	/*
>   	 * Ensure min and max are bound by MERT_FREQ_CAP until driver loads.
>   	 */
> -	ret = pc_set_min_freq(pc, min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc)));
> +	mert_freq_cap = min(xe_guc_pc_get_rpe_freq(pc), pc_max_freq_cap(pc));
> +
> +	ret = pc_set_min_freq(pc, mert_freq_cap);
>   	if (!ret)
>   		ret = pc_set_max_freq(pc, min(pc->rp0_freq, pc_max_freq_cap(pc)));
>   
> @@ -1136,9 +1157,11 @@ int xe_guc_pc_restore_stashed_freq(struct xe_guc_pc *pc)
>   	mutex_lock(&pc->freq_lock);
>   	/* Apply any user min/max request made while the cap was active, else the stash. */
>   	ret = pc_set_max_freq(pc, pc->user_requested_max ?: pc->stashed_max_freq);
> -
>   	if (!ret)
>   		ret = pc_set_min_freq(pc, pc->user_requested_min ?: pc->stashed_min_freq);
> +	/* Restore ignore_eff_freq override from pc_set_mert_freq_cap(). */
> +	if (!ret)
> +		ret = pc_set_ignore_eff_freq(pc, !pc->use_rpe);
>   	if (!ret)
>   		pc->mert_freq_cap_active = false;
>   	mutex_unlock(&pc->freq_lock);
> @@ -1192,6 +1215,36 @@ static int pc_action_set_strategy(struct xe_guc_pc *pc, u32 val)
>   	return ret;
>   }
>   
> +int xe_guc_pc_set_use_rpe(struct xe_guc_pc *pc, u32 val)
as this is not a static function, better to add description like it's 
neighbours.
> +{
> +	int ret = 0;
> +
> +	guard(mutex)(&pc->freq_lock);
> +
> +	/* Might be in the middle of a gt reset */
> +	if (!pc->freq_ready)
> +		return -EAGAIN;
> +
> +	/*
> +	 * While the Wa_22019338487 cap is active, ignore_eff_freq must stay
> +	 * forced off. xe_guc_pc_restore_stashed_freq() will apply this value
In pc_set_mert_freq_cap() we are enabling ignore_eff_freq , so here 
looks like better to refactor the sentence.
> +	 * once the cap is lifted.
> +	 */
> +	if (!pc->mert_freq_cap_active) {
> +		/**
/* as it's inside function body.
> +		 * If use_rpe == 1, ignore_eff_freq = false. GuC elevates min_freq to
> +		 * RPe when enabled, and resets it back to the previously set min
> +		 * when disabled, so no explicit set_min_freq request is needed here.
> +		 */
> +		ret = pc_set_ignore_eff_freq(pc, !val);
> +	}
> +
> +	if (!ret)
> +		pc->use_rpe = val;
> +
> +	return ret;
> +}
> +
>   static const char *power_profile_to_string(struct xe_guc_pc *pc)
>   {
>   	switch (pc->power_profile) {
> @@ -1340,6 +1393,10 @@ int xe_guc_pc_start(struct xe_guc_pc *pc)
>   	if (ret)
>   		return ret;
>   
> +	ret = pc_set_ignore_eff_freq(pc, !pc->use_rpe);
> +	if (unlikely(ret))
> +		return ret;
If we return from here in that case the pc_init_freqs() will never be 
called, Imo better to just print error message here.
> +
>   	ret = pc_init_freqs(pc);
>   	if (ret)
>   		return ret;
> @@ -1426,6 +1483,7 @@ int xe_guc_pc_init(struct xe_guc_pc *pc)
>   	pc->bo = bo;
>   
>   	pc->power_profile = SLPC_POWER_PROFILE_BASE;
> +	pc->use_rpe = true;

use_rpe is u32 in the struct, maybe we can use this is bool everywhere.

Thanks,
Anirban

>   
>   	return devm_add_action_or_reset(xe->drm.dev, xe_guc_pc_fini_hw, pc);
>   }
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc.h b/drivers/gpu/drm/xe/xe_guc_pc.h
> index 1025a2b15f5f..dc52f349a6a2 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc.h
> @@ -31,6 +31,7 @@ int xe_guc_pc_get_max_freq(struct xe_guc_pc *pc, u32 *freq);
>   int xe_guc_pc_set_max_freq(struct xe_guc_pc *pc, u32 freq);
>   int xe_guc_pc_set_power_profile(struct xe_guc_pc *pc, const char *buf);
>   void xe_guc_pc_get_power_profile(struct xe_guc_pc *pc, char *profile);
> +int xe_guc_pc_set_use_rpe(struct xe_guc_pc *pc, u32 val);
>   
>   enum xe_gt_idle_state xe_guc_pc_c_status(struct xe_guc_pc *pc);
>   u64 xe_guc_pc_rc6_residency(struct xe_guc_pc *pc);
> diff --git a/drivers/gpu/drm/xe/xe_guc_pc_types.h b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> index 9a6ea2904e33..36bc25fc6753 100644
> --- a/drivers/gpu/drm/xe/xe_guc_pc_types.h
> +++ b/drivers/gpu/drm/xe/xe_guc_pc_types.h
> @@ -37,6 +37,8 @@ struct xe_guc_pc {
>   	u32 power_profile;
>   	/** @mert_freq_cap_active: Wa_22019338487 min/max cap is currently in force */
>   	bool mert_freq_cap_active;
> +	/** @use_rpe: Toggle use of efficient frequency */
> +	u32 use_rpe;
>   };
>   
>   #endif	/* _XE_GUC_PC_TYPES_H_ */
