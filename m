Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66B7F606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 07:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=JkodSIgT
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3B910E855;
	Fri, 30 Oct 2026 07:37:20 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3B3110E855
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Oct 2026 07:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793345833; x=1824881833;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=hmmoiXXgkworxZGAOOLEt9DYTGFoknbijg9BrxdxcP4=;
 b=JkodSIgTybQDdWOlKhY9ZsuvA+11JYtEuvYEtxObYJ5NSPY3WefA8AM0
 lJVztd5WpQS0tCYAy1uJmmgbN48s8palVoJXlZ4HinrsKvK6Kthj50EGK
 KplYwO4M2sSsgl3YrE91MCNh6SS3iXa7kEESzCK3WvpTpGk5N5ezF5qPY
 pCzuG7EwJLpt+yHULPpv+0IQpFR+fR4aCZDUSgtrQS+1F0EMAqIj4gVB+
 jzS+Nl9M1DI35I6QTFcQdCK38k1VorhGHmiRBUPO6a6ONj8d61yaxl0Di
 S6IOXBT1lEvQ2R5Qujvfqs167QVIy+0DwZpc8o2kdHkeh/7aL4wsgex6g g==;
X-CSE-ConnectionGUID: TaDjjuJ3RwC/0LQMtzmKhA==
X-CSE-MsgGUID: xfnhVeMgTV+yoKv1n5CiTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2104259"
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; d="scan'208,217";a="2104259"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 00:37:13 -0700
X-CSE-ConnectionGUID: mA7u87rYQ2uQ5rNdgA1A6w==
X-CSE-MsgGUID: s0JoTkjaT5yv5OgsN90x7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,185,1787036400"; d="scan'208,217";a="5249849"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2026 00:37:14 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 00:37:12 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Fri, 30 Oct 2026 00:37:12 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.23) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Fri, 30 Oct 2026 00:37:12 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FM2VY3DLIr6xE3pDKiwVs/JGwcB5A7YzyluXHXPe/UW4w2+r/q9JlgvrfgRUp8erhz76tD4l1r0Gd2P9nC9Oa90zI4hhCYQnNLYbRU2WLnrh5HXOQGbHXOL0L2A8OBj3fmC+e/YMqsMJc7etBjJXAHT1SGqdBt1QSknFWqxrayhMs/SM9WEZp8XvzFPVvi3Br4k1YPZ79ZI1GXadlg6IUmILBlbpDpJ61Alq3BZEJq2XWbAxge01HNUDF9UYz0KL7ZTuauYkXL1abPyVGcqirB7WHWR9XsnLft+GLpBveGO+F8tuoj5HyAueSpp3JOwHtpu3SJFgwauvS2kXOj/fHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6q/21b+iR5dkZ+M83qVLWYB0JOLL+olB2Z83yuNkldo=;
 b=c5uo5Ix0BQBu7gtqUnqc23AqEhR3p9LoEkDWwvMDjWRApIj03ikU4O8h+n1Y9RtSFikkX/lNDHmFa97HH82IK447uCHkjmSFgnqMCM6dcKp6a1WIQ1nkiwT8J4mL4T8yOFSOwegGR5qk+qJ1FyzjhMbFcpaGPJojqpeUbiB5PACU8Xb6y8W3OdsFlvZRBe4ZhRX1e1lQFQQleKHdcAFwksBbDOk7Hu5BC6RBzUxjT9Y2KATdxtF0pPEG/4+V+EXwas2bVvwuikiYPaDNIpUjpedhUsMg4BKvvgadPn6Q9Fu+VYLhteog/trH+7em6g/ny4c4wYgmNn4lx1LQJxcQEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6463.namprd11.prod.outlook.com (2603:10b6:930:31::7)
 by CH0PR11MB5313.namprd11.prod.outlook.com (2603:10b6:610:bc::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.10; Fri, 30 Oct
 2026 07:37:10 +0000
Received: from CY5PR11MB6463.namprd11.prod.outlook.com
 ([fe80::a436:8f7d:41f2:329]) by CY5PR11MB6463.namprd11.prod.outlook.com
 ([fe80::a436:8f7d:41f2:329%6]) with mapi id 15.21.0569.009; Fri, 30 Oct 2026
 07:37:10 +0000
Content-Type: multipart/alternative;
 boundary="------------4FEr02LrgiGxzMuwpBEeQhek"
Message-ID: <12eb4f7b-c6db-4ecf-bc12-aae878367354@intel.com>
Date: Fri, 30 Oct 2026 13:07:02 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] drm/xe/vf: Move H2G CTB to VRAM on VF
To: =?UTF-8?Q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Matthew Brost <matthew.brost@intel.com>
References: <20261030073235.1419433-1-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261030073235.1419433-1-piotr.piorkowski@intel.com>
X-ClientProxiedBy: MA5PR01CA0155.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::7) To CY5PR11MB6463.namprd11.prod.outlook.com
 (2603:10b6:930:31::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6463:EE_|CH0PR11MB5313:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ed59f6d-9d51-463f-ff79-08df36589b45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|23010399003|1800799024|366016|18002099003|22082099003|5023799004|11063799006|56012099006|8096899003|261009223027099003|261026140227099003|261022105027099003|261028144727099003|261021121427099003|261021135927099003|10067099003;
X-Microsoft-Antispam-Message-Info: 2HXiIJYtdjnfL07lOD2gCZLzivCZbFQ8aGEwjBqUG5ny6byYhmxSkgIE+zDJqHQQCLK3JBCLO8Qxf2emt6nVwli8fEJbbjLszB1XyyYgrSBN9jdLybhRSqWGoEW16jRriAcvGOabYhVi/Eth3Jnl7dEFWoy5Um6+pLPjn8oXVc0V6kObCuhC7Zbq/rCU1xuKJvJnaaUMkO5tCcIoPWsf8XJGxnD0goe/1ujlpk9V8WWbUMg4ii1UgFTyvV7J+NKJ6/2JzRYRmVBUGwY5n5GDWmYGI/lYLXzL0Fvuii2wgOlTG8TIyopJFinLun1ZbczfFhzDB3wLq93qY9bC+C97viYwfv8iFSvABEsXjBqZyvYlt21VOxg1P5Ys5DLXNDtaBv/RwG8Hf6YDUBdsCZu4aTwwAGk64CLr4RcISgb9I6wmXNK06imrf5ufPBl370kafZLlvtDsvyfyXF3zRmHPAWrjhlN6K8l+b9VZ5MmjPjW8zGIfygQYtmw+WeP3+8EBg7l3W4c1zvAbld5oFHF9ivlVKGyCTCXKbKxtfw5D8sontxntnQXHESGwraPWb+H4400Kju53g9Cz7V1UJCDKDTeODJ7tUBPg4snbMGoqF5dp7G4mdAwNeDs/kTBQrpy/QUhM8NhbWvEsyi7MtE9FkUKIME72O1MgVVBVgFJAKLQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6463.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(23010399003)(1800799024)(366016)(18002099003)(22082099003)(5023799004)(11063799006)(56012099006)(8096899003)(261009223027099003)(261026140227099003)(261022105027099003)(261028144727099003)(261021121427099003)(261021135927099003)(10067099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TEZIVFZqMWwwdWQvZUdLdjNTUHA4Z3NwemlLTDViZi9kYzUyMVBEb1JiMjVV?=
 =?utf-8?B?TXlCQ0hKOGxpWVNDS0MyL2ZDaHhnSWpxSFFVVXp5aHJZSnV3NlFmbyt1UVdB?=
 =?utf-8?B?QlZZZ3A4SURGUDYrQVNIanVBVEJPOGg4c05iK0NUUmRwOXpmV1hlTXFMRlhv?=
 =?utf-8?B?MWxpbDh0Wm4xR084WkR2MjlnUEVIV1pKTU83L29OYmIxbkVvN3ptdTJUcnBz?=
 =?utf-8?B?RDZ4d1A0MVM5bzdEYnJpR2hidER0c0pnRlBDUjZPRWhUWlFFYk44NlZQRmM0?=
 =?utf-8?B?WVhOcWs0ZFpzRUJOdERMN0lXRW1OZUxJVDRMVm5jMUxOM1pheUVjMExkUzNJ?=
 =?utf-8?B?eXJLM242UVZFOXVxMDV5NWVFam5laHdxQm15TGhpRFhaenB0M1VSR2dja0Fm?=
 =?utf-8?B?UVVuN2xreEVlaklZa2ZVdFVmL2VGSk51NXZpUzR2cDl0RmpGQmMxSHM0WU1H?=
 =?utf-8?B?TlVVQXlTY0lha1ZiZ3ZKcnROVGFUOXpmTWRicTY0c1BTZ1NaRzl1eG43YWZT?=
 =?utf-8?B?L2VFYzV3SnF5YU9Tcll0OTJpb0NaV2ZYZWl0bjBSMkVrTTZBUjg5ZXFsa3J5?=
 =?utf-8?B?Mkl1STJHdUduNGFMZU9xK1RGMFRQbzhzRVVhRHlDUlJBeE50QzBQVDhDajZr?=
 =?utf-8?B?OUtQQkRQckpOZzFLUUFmSnZ0c1I0QXdJQlg2RjhMVVpLQWpLNnZ3aHkwdW9h?=
 =?utf-8?B?TGMvL2Y1SzRWY2tXc3VhUHU3akkySmFMU1VhbEFzOUpFMEV0RGRCSTdjRGpS?=
 =?utf-8?B?WTRLMzArQzlsSm5BZytvRWZNeVB6YmJvcWt0VUJ4SGo0Kzk4eDJpaExvSkpI?=
 =?utf-8?B?cmI1cDFTcjVZL1hKT25ZTXhMZkE1U3dqdW53UTdWRUtaWlF5anZMRElSNHJN?=
 =?utf-8?B?WGhLVWVRUUszaFRyb3B6ekEwNkZWem5qRWJsdmRMKyt6N2pYbkg4bFIra0dC?=
 =?utf-8?B?anAvV2xWTUpxMTExano5Qk9NTGRYQ3RBOERmbDRpYTBUVWxPdEJtVkRBVkZq?=
 =?utf-8?B?ZmwwQ3lJMUVINGkyYTRkQjBNSGtjMmhab2lXSStSUE1FUXJzWURRTjA2YkEv?=
 =?utf-8?B?YWlHRVRQR0ZoZzRmTFRCeGwvbEx5QU1QamZnUElmVFRUVDNKRE9SRDZ2QUJz?=
 =?utf-8?B?dUtrWEtJOCswdkZnUmVJRTlrNXNIMitsYkJOSDE0YXcydjRKeTI0bnNJaWRj?=
 =?utf-8?B?Y3M1QlVOa3oweW9hYzRXdkZwRW5LajFBNmxlWDAweGV4QWxNb2h1NEtGaWp3?=
 =?utf-8?B?b2NNWkd5N2F5dFpNWWVkeUE1S3hKWmxzVk9aWmVleWQ1R1pDbHhOaHJJQ0Zu?=
 =?utf-8?B?Sy9rQWcyci9TREdYWjBpMUloR3M0Q0NiVnRjS1JTSUlBMlhOaUluUEMwTy85?=
 =?utf-8?B?ZFNKNjlPeGFuQ1pUbFFnakpUMmhWb2grdXpFekVxUG94VEFTV3hCTU93bDkv?=
 =?utf-8?B?dnhuT2xDbER3a2JyajRBNHhESmhlSmZkaENsd3Rpbi9KRmx5QzBodmR5bmhh?=
 =?utf-8?B?YWR1L1doclEwWlpxczJLamhjbDR1UlV4ZjgzSmFDNmVrdWpmUFlKd09kdnZM?=
 =?utf-8?B?bVE4eEtaMDBRMWxVYWtwSlNpSHY2d25KNlZkbk1lL0xGZGhvSFhTb3haRWpl?=
 =?utf-8?B?OUl3eDNIWEpDZnBzRXB5NkROS2hGSWQ5MEV2L0JJajBIMXdGSEpJV00zMUU5?=
 =?utf-8?B?QUhwV3JKcVZmVGxqRDNkNlM3MlBFS0tJZFU3YkNnTzJmSCtYQ2FVVTdiV3JB?=
 =?utf-8?B?OFVtNzUzZGMrUFd1b2xNeU53MkJNeTBaeDl5WlpkYmlESEhDanNid3NqQnFI?=
 =?utf-8?B?RnYrZGhDSk0vb1duaGlYSGNTN1oyTW95WEU5ZHNLdkRDR09hVUVjTzRXMTJs?=
 =?utf-8?B?UW9XNmdtWmhjbmdabnhOdm8zV3laRVc4MXZlVXBXazg4MERmQ21jRXBXSGRy?=
 =?utf-8?B?RlhWVDIycGRibTE1V0JTYzNxWStKakpmNnhETnBGTlpRdDJ4U3NmYzlhMGRl?=
 =?utf-8?B?U0g1SGhSNDNKUGUrdTNubEEwcGc5cFRSeTRMalNCU2E5UmU4a0pjY0M3YXRI?=
 =?utf-8?B?OThEdnVUNFhGUDZ3bHZTNWtOdzliNUZuQU56RHVKWVdrZ0RESFBvUExEb3Iw?=
 =?utf-8?B?L2hmbEhGSkJqN3g0ODRUdC9ZMklQTjdmbGZscjAzNnU3Z1RhSm5UNXZEZVVN?=
 =?utf-8?B?SnU3aG51bWs3aS9Zb000SC9hcU9OdnFQbHEzUTRYSm5ObGY1SEtiTlhGM2ZZ?=
 =?utf-8?B?UUNVTVlCQVdHV21icExUN0ZpS1U3d1U1VUtsQXVkaC8zTWo4M2NsUHBmQXR1?=
 =?utf-8?B?cmhXeGJEeUNaVUp5Nytab2J1SkhaS3BQTkhpQ1pzeXNIbWEzN05tbXRhckF0?=
 =?utf-8?Q?HQy/KCjeDH5wQMY0=3D?=
X-Exchange-RoutingPolicyChecked: 39MkgBd5PBOMCujTs3zP7XDPcd1fFeVEY+sia9xcAj00QASSGxctqZePdSJY44eGDbygLKAKNJthZxu/ANpQ3HgClDX2PKS9RG06DFhMLIemvyksyjZJZzVQ+U45W7Q/Apqf/Ivn4t1N4CZJEPwxDU/6xhS0B0FCWsiyE0Cs1/ndjJlmQt/gTJUKeKzL+U7eandob7odznKk3WBdBiXJ3BdoUy9CECwe6V2VnEorSc8OYtO0iWv0NQ7bt7EWrZajitx7fXmTVcuc7QV+ijn3W9XIyrCL3tLoqk24jHLYkcVv5+M/sZTMjZuzLZSTQ+8sGa/pvLtx6lPI5ySp9gzmvQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ed59f6d-9d51-463f-ff79-08df36589b45
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6463.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2026 07:37:10.5300 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6wduNWZU1+EEC3KJHeVut+G8hGLArt3/iplrjWClfnn0DvbpqBJyA4bVVkRlZtaZEqkAvCnF9YSnEL9rnHMKcVqI5Z+Rds0fh4JhzB5GEc4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5313
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------4FEr02LrgiGxzMuwpBEeQhek
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 30-Oct-26 1:02 PM, Piórkowski, Piotr wrote:
> From: Piotr Piórkowski<piotr.piorkowski@intel.com>
>
> On DGFX, the PF reallocates the H2G CTB into VRAM once VRAM becomes
> available, as it is written by the CPU and read by the GuC, while the
> G2H CTB stays in system memory. The VF never takes this path, since
> xe_guc_init_post_hwconfig() returns early for VF, before calling
> xe_guc_ct_init_post_hwconfig(). This early return was meant to skip
> the PF-only GuC firmware, log and ADS reallocations, and the CTB was
> skipped only because it used to be reallocated together with them.
>
> Nothing prevents the VF from placing its H2G CTB in VRAM. VRAM is
> already initialized at this point, the CT is disabled by the preceding
> uC sanitize and the buffer is registered again with the GuC when
> communication is re-enabled in vf_uc_load_hw().
>
> Lets call xe_guc_ct_init_post_hwconfig() from vf_guc_init_post_hwconfig()
> to use the same CTB placement on VF as on PF.
>
> Signed-off-by: Piotr Piórkowski<piotr.piorkowski@intel.com>
> Cc: Satyanarayana K V P<satyanarayana.k.v.p@intel.com>
> Cc: Matthew Brost<matthew.brost@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_guc.c | 4 ++++
>   1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
> index b1f4e132fa0c..53893e9e3374 100644
> --- a/drivers/gpu/drm/xe/xe_guc.c
> +++ b/drivers/gpu/drm/xe/xe_guc.c
> @@ -853,6 +853,10 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
>   {
>   	int err;
>   
> +	err = xe_guc_ct_init_post_hwconfig(&guc->ct);
> +	if (err)
> +		return err;
> +
>   	err = xe_guc_submit_init(guc);
>   	if (err)
>   		return err;

LGTM.

Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

--------------4FEr02LrgiGxzMuwpBEeQhek
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 30-Oct-26 1:02 PM, Piórkowski, Piotr
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261030073235.1419433-1-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>

On DGFX, the PF reallocates the H2G CTB into VRAM once VRAM becomes
available, as it is written by the CPU and read by the GuC, while the
G2H CTB stays in system memory. The VF never takes this path, since
xe_guc_init_post_hwconfig() returns early for VF, before calling
xe_guc_ct_init_post_hwconfig(). This early return was meant to skip
the PF-only GuC firmware, log and ADS reallocations, and the CTB was
skipped only because it used to be reallocated together with them.

Nothing prevents the VF from placing its H2G CTB in VRAM. VRAM is
already initialized at this point, the CT is disabled by the preceding
uC sanitize and the buffer is registered again with the GuC when
communication is re-enabled in vf_uc_load_hw().

Lets call xe_guc_ct_init_post_hwconfig() from vf_guc_init_post_hwconfig()
to use the same CTB placement on VF as on PF.

Signed-off-by: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
Cc: Satyanarayana K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a>
Cc: Matthew Brost <a class="moz-txt-link-rfc2396E" href="mailto:matthew.brost@intel.com">&lt;matthew.brost@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_guc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_guc.c b/drivers/gpu/drm/xe/xe_guc.c
index b1f4e132fa0c..53893e9e3374 100644
--- a/drivers/gpu/drm/xe/xe_guc.c
+++ b/drivers/gpu/drm/xe/xe_guc.c
@@ -853,6 +853,10 @@ static int vf_guc_init_post_hwconfig(struct xe_guc *guc)
 {
 	int err;
 
+	err = xe_guc_ct_init_post_hwconfig(&amp;guc-&gt;ct);
+	if (err)
+		return err;
+
 	err = xe_guc_submit_init(guc);
 	if (err)
 		return err;</pre>
    </blockquote>
    <p>LGTM.</p>
    <p><span style="font-family:Menlo">Reviewed-by: </span><span style="font-family:Aptos">Satyanarayana
        K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20261030073235.1419433-1-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------4FEr02LrgiGxzMuwpBEeQhek--
