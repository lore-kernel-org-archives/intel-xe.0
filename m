Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D8FC4345F
	for <intel-xe@archiver.kernel.org>; Mon, 29 Apr 2024 06:47:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F9B4112AF2;
	Mon, 29 Apr 2024 06:47:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QaTmyyVE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C6B2112AF3
 for <intel-xe@lists.freedesktop.org>; Mon, 29 Apr 2024 06:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1714373222; x=1745909222;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=ramPQoJsKjCec1cxx+PPg7/l5m05G5lpVULAJrrOMqE=;
 b=QaTmyyVEGJSbuX/hgz+pUooRVkdvBOnCA9CJb1P/IUV5YfKtXmmJSiMu
 aeYWIogvpnGItmKrJ/jrXVCJ2ZGPbmom6/Jdij4FhMxK7DZO0eWl46gs/
 HpUBlKAGsVniwi9l1CJf5cI3701Z/UDG6RqkuGPAhG60yf/uYhxZxfoXs
 TTxT6n60DR8+JnoCApxYr23dgEUxFj0R1K3bwtprT25sKXBnIhJck1dQK
 E2t+0VzJi7+SrMxNxzMTFle82kAm5njmFf5p4UlgoE2Dn+3Z8JYxVbIU8
 f0mm11o59hG9PeKTzHC8ngfFSo0C9AZph4q5S5B1PKBwlCoK6/KKFOA3t w==;
X-CSE-ConnectionGUID: DwVlLMZjQxy250aTnfkUjA==
X-CSE-MsgGUID: SDbP8CdUS1C/rhokyxsI0Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11057"; a="9897538"
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; 
   d="scan'208";a="9897538"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2024 23:47:02 -0700
X-CSE-ConnectionGUID: bAi7NvLmSS6jNQ14nYBiGQ==
X-CSE-MsgGUID: DrFvdVd0S+GcdimFSz3Q5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,239,1708416000"; d="scan'208";a="57205046"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Apr 2024 23:47:02 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 28 Apr 2024 23:47:01 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 28 Apr 2024 23:47:01 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 28 Apr 2024 23:47:01 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (104.47.73.40) by
 edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Sun, 28 Apr 2024 23:47:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l2rbNzahmFxg0wghvmKx3wnQyqu4zZHkWmwqYPdm3/nLBGoukqm9vw+IOcF7INVubflZI4/njOJWszlCCA/4LwjOvz11ivJBwlDeAcFHEk3shx1LL6RccOQQOhqmiMkOLl6dkkL64mYDeE5bJ8A5+h9tjS/2lAvvMJvGaZMi7EaWZuKkuJGE8/bPDp0julaiDYyJKgWZeQ5pzDsP/s4XD+7y8bLLrbSHL1iNgUr6T/taiBjgG/DADsEiC8JkC6ReUgOdkbKYE7btZk2w0mxzUaOp9igRKKdMwMjs25qZUHTAlcEr+njELH9O2pbYSttUXniPzxNc9tCW9E42X25ing==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ramPQoJsKjCec1cxx+PPg7/l5m05G5lpVULAJrrOMqE=;
 b=MVNC82wpxWGS2y39rYrwFWgAYboxXcRT4qPXcW8ifMphYwwW0si4ocGUWPmjKHDULAPqMkqM/vc+sXPM+CBkIWK8ZUeBQRqjHBpBfuEPypahJntI9YkFU0rQliWGJ5V47Pw0kWAPZR6VJ8dqP4O+L8IyNTVgwMNQAECoeeHQArnzG2xyBPT16vsa7IbzEGNYBZUE8Ij/Hzn1KhE0n250cnpsYULQKsh5a1zuqzM3YsTVyDajhOInLoeLKvVpsBgmg0XU7FzYi9r9X3pcmB35bgJaIpSMSKSDXebnyFzZ+G5iBnGJHd1S2v3vaQcJWhS6Prep1vz9iRJjDGGrNEOSfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from MW3PR11MB4748.namprd11.prod.outlook.com (2603:10b6:303:2e::9)
 by DM6PR11MB4659.namprd11.prod.outlook.com (2603:10b6:5:2a5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 06:46:59 +0000
Received: from MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea]) by MW3PR11MB4748.namprd11.prod.outlook.com
 ([fe80::6c91:5b36:e5b7:6ea%5]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 06:46:59 +0000
From: "Kumar, Janga Rahul" <janga.rahul.kumar@intel.com>
To: "De Marchi, Lucas" <lucas.demarchi@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: =?utf-8?B?UkU6IOKclyBDSS5LVW5pdDogZmFpbHVyZSBmb3IgZHJtL3hlL21vY3M6IEFk?=
 =?utf-8?Q?d_debugfs_node_to_dump_mocs_(rev3)?=
Thread-Topic: =?utf-8?B?4pyXIENJLktVbml0OiBmYWlsdXJlIGZvciBkcm0veGUvbW9jczogQWRkIGRl?=
 =?utf-8?Q?bugfs_node_to_dump_mocs_(rev3)?=
Thread-Index: AQHalYWgYnR9A3nTvEuHMDLd7aTIirF5I5sAgAWyl3A=
Date: Mon, 29 Apr 2024 06:46:58 +0000
Message-ID: <MW3PR11MB47486AEEA858A5A71E3BFE1AAE1B2@MW3PR11MB4748.namprd11.prod.outlook.com>
References: <20240422100550.1088856-1-janga.rahul.kumar@intel.com>
 <171388040608.1608578.16411915126041051402@8e613ede5ea5>
 <h2k4ge4ub2mb5qajpsm2ztbkd66jehfjgu6fgs4ie4smlhzout@waysj345xm47>
In-Reply-To: <h2k4ge4ub2mb5qajpsm2ztbkd66jehfjgu6fgs4ie4smlhzout@waysj345xm47>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MW3PR11MB4748:EE_|DM6PR11MB4659:EE_
x-ms-office365-filtering-correlation-id: c5f6682b-d593-47e7-98ca-08dc68182b03
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|376005|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?Y09OdUszbFV6eEEyZnVSWVdndC9hTGtJM0VUY0tkcW9oQnUxMlFLeFRVa3Zo?=
 =?utf-8?B?b1pIR0JOeGFJRzhpMnNkdVB2Sk83dXdSTzdHVDc4N0pleTl4WkdqeXYrdDg5?=
 =?utf-8?B?N003OUxxd0xld2ZmUnExaTJlTHU5MkxCWVpjZzZrRTZoWFpWRjd4Tk03anp3?=
 =?utf-8?B?Mnh1MktOMnVBdzc3OTRvd25xdWZsWUFhdkFhbUtDRnNXdVBLeUFoYlRaVXVw?=
 =?utf-8?B?TDFDNUxuN1F3cm40U0FQRVlSZ3k2SVpIWC9hSEhqNkdETkM1L1hkbE9XeXBT?=
 =?utf-8?B?ajBLWURkSFJoQ09DNldzYTRlc2IxUDA2UERSSEtQdXdYcFRKbjYxTHZwSld2?=
 =?utf-8?B?RFBpSVhzOER2NkxEb05RNVYvM09vMk42bmZrTDhDYWFsODZ4ODZqcVBRUXBE?=
 =?utf-8?B?VUtWeXg1R1ZpMkUvOTh5YTBSeTl3L0ZTcGg4cEpNUGJFS0VuV0pTWWdpdXkw?=
 =?utf-8?B?ckF4cndUWXdFYytCRzQ0Njd4Z3NFVXNBMS9CWndRdUpMTTBOamZCdCtzd1ph?=
 =?utf-8?B?enppVzJMckJlcGdJSFA2bXk0MkZKbnB3VlNMWnFCUndTQ1IxbzlpdlRTQTRy?=
 =?utf-8?B?QWc1WG5IYzc3YTR5UC8yR0ZDc2tEZ0trREZhdlFPM2xQeUdiR0VMNlkzdnV3?=
 =?utf-8?B?OUNONHZJTWhzZlpqK3NSSFlhYjJxUVZuVG5GYnpvNjRzTTRQaXFFWFNpUzZC?=
 =?utf-8?B?b0tqNTJCcFo4TURHT3FuUm1oNVBmNUhlL0tvdGw5U0JqOVB3YVU2UCs3VXhX?=
 =?utf-8?B?eGhUc3RHSGJBMjRoUzh1SHRaZXg0cjRBeStWZVo5dHlzSnZuNXh6LysweDY5?=
 =?utf-8?B?WG5jZXhZV3dmMkFWOXlPQ1RpRG5lV1RocWdPSmZjR01tblJFdXRkNElQTjlt?=
 =?utf-8?B?Y2JwMm1zbFRkTlZhaEVjOXVhYTV5ZlpDRDF5elZrQUtGSThZQXBkNE1aa0hv?=
 =?utf-8?B?cWpyUkhzS3ZpNmgwMFo4dnRoWXA4eDlhYVE2OG5UM3FJeStYQStreTQ4cGtQ?=
 =?utf-8?B?TlBPYlU4MkloVk5uREVaMjdNVzZJMUMreXQ4MG4vc1cvQjc4MXY4bmgzNDFs?=
 =?utf-8?B?WUdianJXeHpmUzZwbXd1bHY0QmgzYXhhMllzMDhEMEpBTWZkRGU5YVJiSXJx?=
 =?utf-8?B?QTAwcVc5bFpNOG5mZmdtSk52OG1vNjZyaVVHclhxdW52N3dVamFrL0ZxQmM4?=
 =?utf-8?B?OHo3VWdmc0lxbGxJMVYxbHZ1azBmdUZlcHY2bVhJNEdxOFVBNXZLelViRDhp?=
 =?utf-8?B?T2JXZ05jQUN3RG40K24vTXpwWnA5ZThTNk1ubXdEL0xxWDdsU3F3MWVIRSsx?=
 =?utf-8?B?b2I4L0hGK0R4aXlmcW9STUFnd1VDenZxcjU3dStnc0o0VkdZT1BRVytyZFNF?=
 =?utf-8?B?WWJzV1BsU01YamRGQStSQ0pPZGRwVE1kZlpYamFESmFGTmRySDh6YjZCMEFM?=
 =?utf-8?B?a1h2cnBCTFRlWHloVzBEK3U4b01NTGhlOEEwOXRqYmFNcFNjMXlyR1V4T2th?=
 =?utf-8?B?VTI4THV4V3JzRWNaWUpQS2ZpRDY5WFIvRUhTUVVNRStjUFpLMCtiOVNYeksy?=
 =?utf-8?B?UklTVCtvTHBMOHlKcDJlRTJncnFhdzVoRWZTK1phZTFMemZkUm9iaTFlV1ZT?=
 =?utf-8?B?NzhmOUFma2hYOGlENysvc1FDdlZXT2pReFpYUFFFVitIUW13STB5TldGTFlI?=
 =?utf-8?B?Zjl5ZFJDb0dxdDNNa1pQaFhjVWtpQWF3U3dFODl5KzlDOGd4ZEhmZm93PT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW3PR11MB4748.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emkyVVkxdG9VMUdISnA4R1BEdGZOb0NWeVVzZVdkcEJ6dHNHSjVSNVREZ1VK?=
 =?utf-8?B?VjZtVk9XUjJNRDJUQVZFRXFVSnFoZkk0NGtiL2JadE1RWXpOTWxmQ3lpTnJz?=
 =?utf-8?B?aWdpd1E4UHZNUVZPYkMyUjdPTHVBQ1dPLzJLZ295YmJGRElhUjdudnRLOEtU?=
 =?utf-8?B?Y1Q1UEhNcTh1Q0wzYzVOS3NwMXVjbXQ4QnptZW41Z2kzeldsNFZMYU41dWZR?=
 =?utf-8?B?YlFkNWE3WG0wejRhL29oVjNGUUFqSW5CUnA0QVk0RXYzS05Td1hnTEhrN1Zh?=
 =?utf-8?B?TmtKVTRLWnlrT1VZSzV4cTVzTFFtM05YRFl6UEJ5SWRLY2ZnblNyVUlya3VD?=
 =?utf-8?B?WXhidlRzMjlqMnRlblNqazB1UWIwaCtRMllVWlVIeStNalhoVUVkZml2bXhv?=
 =?utf-8?B?cThUUTZCazVEV1ltbUZ3cVBCZlpuRFR0Njl2c2hmWDFnaERQZVJVa1JBYXRm?=
 =?utf-8?B?TlNWek14cExIU2ZlUE81SzBoT1UxbjRoRzF0QmtwR3ZKcXQ1UHZHalJFeXo5?=
 =?utf-8?B?TmRIdzgybTJSSTl3QWVJUmZ3bGV1QWJ3NjFlV1RHN3c4TUt0WE5MZ2NITTMw?=
 =?utf-8?B?ZUdiN0N4dmZUVi9NbktNSmNFSEkvUkhZY3lwM2dYb0U5T1NEbkIzdFYvQ1dE?=
 =?utf-8?B?NHIwdUxvQVRrYTgxZXUyRDNoVFlPVGd1SlAyQWt2ZTlROTBIRndLbTVSeVY2?=
 =?utf-8?B?R1lSMXlEK1BGa2FUWE0vWEh4YVJaeGdHSDZGUGt3b29MYzFlTk9TcEZjMzdL?=
 =?utf-8?B?QmN3eXY5RXB3U1BhOCtPQkxFbG51ckorcmQxcGRkVDJ0clRIWXplZlVhWEd5?=
 =?utf-8?B?MUtSM2dBWXFLK2VVdTVjZjUvaXN0Zm44c2NPSG5hd1daTHZyN1FkOGxseGh3?=
 =?utf-8?B?UllFUlVpTkxiNEVITHdlYm5ZYmxnRVI1SXlndUVoREJaWnByWEVVa1VoTlBW?=
 =?utf-8?B?OUdsbWhLK2dxQk1KM25wTEcydkdZNnJVZ2czU21qaVIrZlU0OURCUVBTZk9T?=
 =?utf-8?B?R3VzZE5rTmZvWjEraGNiOEFrYi9POWRVNVhrNTMwWlZZSXNqd1E1WjFzaVRG?=
 =?utf-8?B?cXdsa1VwSDBDQTRYTUE3VjY0c2poalZqQTNJOG9lOWdVVFppRFMrMHY2RTJV?=
 =?utf-8?B?UG9Qc3lHVmZCT1ZlV09icXJaQ3ZiRGpKYnMxc2tiM09HUlowYWxrR2JmYi82?=
 =?utf-8?B?ck11VWw4Y0x3R2JuTDNGMzM4TmlJYlZaT2VYdWc3OEpGUXpqakUvZ3JhOVpu?=
 =?utf-8?B?TUV0STN1WUdEQkdNSmRYVk0wTi9ya1YxbVE5d21ZRUh0M0xpMkRleDFKWXcv?=
 =?utf-8?B?YUt6OFgvTVNONHRaNnA5TTcxUmtJR05jVCtNUXRTdmVlc0pLY0JGclp0YkN2?=
 =?utf-8?B?cy8xSWJTeFN5SmY2ckxLMDF2MCtyVVZLUll1UlgxNlA1T253ZGhQUUdZRitm?=
 =?utf-8?B?NGxwQm9iSEMvcURyc0UrZldFMW5VNk04SkVwR2xxMFpwSzJ3WkxPM3VqK0dJ?=
 =?utf-8?B?eDB1OVplRUplWjl6SjRabm1jS0ZlNGhROTVSeDhZNEpSUCtaaGgvNll1L08x?=
 =?utf-8?B?b0IvSi96RmhQbGNKYkpDVXVkaCt5bFFveGllQTFEYzNEY3NRK0szY2xva2Vt?=
 =?utf-8?B?dkcvT2RnSUpRdG9sRTljdU9YaG0xaHRXcjlCKzlXNjVUMFZJV1RxODlUMmo0?=
 =?utf-8?B?WUw0eWoyY01PQ0VJalRVNVNIUUtyeGk4N2orTVYydnBuR2F1V0pLMVQrbUt2?=
 =?utf-8?B?Q0tYbXlNa0w2bmFMcDQ2ZXRuM0RpSjVjUVpWZEY0ZDZ1d0taaThzRDhJNVR5?=
 =?utf-8?B?ME9Lc3NPbXlBV0hvVWtIWkppL0gyS29tSzd0OEQ4c2ZScWZKWlRwWURLc3RW?=
 =?utf-8?B?elJDUHoyUmZ0R2VIOEJNMkY3QnB5M20xOEpDY3FpNWFRWGlDK0V5aW4xcy9U?=
 =?utf-8?B?dVQ5SFJUMmFQRGlYNkhsZjdhYnc2SHBtUEU5RUljTmpGRVlmeUMzZzJhTjRl?=
 =?utf-8?B?MHNxZnFTbUI0aFBnYXRHTVI0WmNJQUUwRjUwenhiR0l1QTFoNmVON1dZRm1X?=
 =?utf-8?B?OUhUZXIxc2tVd0doblhtZ1BkMGhFaitMS01HODQ3bUxubzUyYUdmemlXTEh0?=
 =?utf-8?B?U3o3dHJRVE10M0FTc2JJNGVyMjluTE50SjVHS3JiU2gyR2xwVDFCRjdhZlVT?=
 =?utf-8?B?Ync9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW3PR11MB4748.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f6682b-d593-47e7-98ca-08dc68182b03
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2024 06:46:58.9300 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 9LN02M6BIPUufurDYR3oa13uj52OGf/LmmUoyPOQ8399cosJbT2GU4NdL1fVMHZe5xlrd04qkIz9ATGcSm4LBdA9g/i9f7o+fReg0GDgaU8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4659
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogRGUgTWFyY2hpLCBMdWNh
cyA8bHVjYXMuZGVtYXJjaGlAaW50ZWwuY29tPg0KPiBTZW50OiBUaHVyc2RheSwgQXByaWwgMjUs
IDIwMjQgOToxNCBQTQ0KPiBUbzogaW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENj
OiBLdW1hciwgSmFuZ2EgUmFodWwgPGphbmdhLnJhaHVsLmt1bWFyQGludGVsLmNvbT4NCj4gU3Vi
amVjdDogUmU6IOKclyBDSS5LVW5pdDogZmFpbHVyZSBmb3IgZHJtL3hlL21vY3M6IEFkZCBkZWJ1
Z2ZzIG5vZGUgdG8gZHVtcA0KPiBtb2NzIChyZXYzKQ0KPiANCj4gT24gVHVlLCBBcHIgMjMsIDIw
MjQgYXQgMDE6NTM6MjZQTSBHTVQsIFBhdGNod29yayB3cm90ZToNCj4gPi4uL2RyaXZlcnMvZ3B1
L2RybS94ZS94ZV9tb2NzLmM6IEluIGZ1bmN0aW9uIOKAmHhlX21vY3NfZHVtcOKAmToNCj4gPi4u
L2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9tb2NzLmM6ODIwOjI6IGVycm9yOiBpbXBsaWNpdCBkZWNs
YXJhdGlvbiBvZg0KPiBmdW5jdGlvbiDigJh4ZV9kZXZpY2VfbWVtX2FjY2Vzc19nZXTigJkgWy1X
ZXJyb3I9aW1wbGljaXQtZnVuY3Rpb24tDQo+IGRlY2xhcmF0aW9uXQ0KPiA+ICA4MjAgfCAgeGVf
ZGV2aWNlX21lbV9hY2Nlc3NfZ2V0KHhlKTsNCj4gPiAgICAgIHwgIF5+fn5+fn5+fn5+fn5+fn5+
fn5+fn5+fg0KPiA+Li4vZHJpdmVycy9ncHUvZHJtL3hlL3hlX21vY3MuYzo4MzI6MjogZXJyb3I6
IGltcGxpY2l0IGRlY2xhcmF0aW9uIG9mDQo+IGZ1bmN0aW9uIOKAmHhlX2RldmljZV9tZW1fYWNj
ZXNzX3B1dOKAmSBbLVdlcnJvcj1pbXBsaWNpdC1mdW5jdGlvbi0NCj4gZGVjbGFyYXRpb25dDQo+
ID4gIDgzMiB8ICB4ZV9kZXZpY2VfbWVtX2FjY2Vzc19wdXQoeGUpOw0KPiA+ICAgICAgfCAgXn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IA0KPiBsb29rcyBsaWtlIHlvdSdyZSBtaXNzaW5nIGEg
aW5jbHVkZT8NCkJ1aWxkIGZhaWxlZCBkdWUgdG8gYmVsb3cgcGF0Y2ggd2hpY2ggIGdvdCBtZXJn
ZWQgd2hpbGUgdGhpcyBwYXRjaCB3YXMgaW4gcmV2aWV3IHN0YXRlLg0KaHR0cHM6Ly9wYXRjaHdv
cmsuZnJlZWRlc2t0b3Aub3JnL3BhdGNoLzU5MDIyNy8/c2VyaWVzPTEzMjYwMSZyZXY9Mg0KDQoJ
ImRybS94ZTogS2lsbCB4ZV9kZXZpY2VfbWVtX2FjY2Vzc197Z2V0KixwdXR9Ig0KDQpXaWxsIHJl
YmFzZSBhbmQgbWFrZSBjaGFuZ2VzIGlubGluZSB3aXRoIGFib3ZlIHBhdGNoLg0KDQpKYW5nYSBS
YWh1bCBLdW1hcg0KDQo+IA0KPiBMdWNhcyBEZSBNYXJjaGkNCj4gDQo+ID5jYzE6IHNvbWUgd2Fy
bmluZ3MgYmVpbmcgdHJlYXRlZCBhcyBlcnJvcnMNCj4gPm1ha2VbN106ICoqKiBbLi4vc2NyaXB0
cy9NYWtlZmlsZS5idWlsZDoyNDQ6DQo+IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9tb2NzLm9dIEVy
cm9yIDENCj4gPm1ha2VbN106ICoqKiBXYWl0aW5nIGZvciB1bmZpbmlzaGVkIGpvYnMuLi4uDQo+
ID5tYWtlWzZdOiAqKiogWy4uL3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6NDg1OiBkcml2ZXJzL2dw
dS9kcm0veGVdIEVycm9yIDINCj4gPm1ha2VbNV06ICoqKiBbLi4vc2NyaXB0cy9NYWtlZmlsZS5i
dWlsZDo0ODU6IGRyaXZlcnMvZ3B1L2RybV0gRXJyb3IgMg0KPiA+bWFrZVs0XTogKioqIFsuLi9z
Y3JpcHRzL01ha2VmaWxlLmJ1aWxkOjQ4NTogZHJpdmVycy9ncHVdIEVycm9yIDINCj4gPm1ha2Vb
M106ICoqKiBbLi4vc2NyaXB0cy9NYWtlZmlsZS5idWlsZDo0ODU6IGRyaXZlcnNdIEVycm9yIDIN
Cj4gPm1ha2VbMl06ICoqKiBbL2tlcm5lbC9NYWtlZmlsZToxOTE5OiAuXSBFcnJvciAyDQo+ID5t
YWtlWzFdOiAqKiogWy9rZXJuZWwvTWFrZWZpbGU6MjQwOiBfX3N1Yi1tYWtlXSBFcnJvciAyDQo+
ID5tYWtlOiAqKiogW01ha2VmaWxlOjI0MDogX19zdWItbWFrZV0gRXJyb3IgMg0KPiA+DQo+ID5b
MTM6NTI6NTddIENvbmZpZ3VyaW5nIEtVbml0IEtlcm5lbCAuLi4NCj4gPkdlbmVyYXRpbmcgLmNv
bmZpZyAuLi4NCj4gPlBvcHVsYXRpbmcgY29uZmlnIHdpdGg6DQo+ID4kIG1ha2UgQVJDSD11bSBP
PS5rdW5pdCBvbGRkZWZjb25maWcNCj4gPlsxMzo1MzowMV0gQnVpbGRpbmcgS1VuaXQgS2VybmVs
IC4uLg0KPiA+UG9wdWxhdGluZyBjb25maWcgd2l0aDoNCj4gPiQgbWFrZSBBUkNIPXVtIE89Lmt1
bml0IG9sZGRlZmNvbmZpZw0KPiA+QnVpbGRpbmcgd2l0aDoNCj4gPiQgbWFrZSBBUkNIPXVtIE89
Lmt1bml0IC0tam9icz00OA0KPiA+KyBjbGVhbnVwDQo+ID4rKyBzdGF0IC1jICV1OiVnIC9rZXJu
ZWwNCj4gPisgY2hvd24gLVIgMTAwMzoxMDAzIC9rZXJuZWwNCj4gPg0KPiA+DQo=
