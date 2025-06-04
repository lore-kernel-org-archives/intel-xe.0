Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F812C5B549
	for <intel-xe@archiver.kernel.org>; Wed,  4 Jun 2025 23:49:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE0D010E0A2;
	Wed,  4 Jun 2025 23:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hSe+dtA4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2BA810E0A2
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Jun 2025 23:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749080970; x=1780616970;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ETz493Vc6jPQvKwlcnKx6AJ+QdEM974qHRD+KLGolZo=;
 b=hSe+dtA4nn9+HQ/Dc98F3LsPv5MW1efi40t/A0LO1jKXiGnh53mmqtOH
 jmKTXWSWADtweNU6454ayjVmNjZ2xnPS8xKrMon1vQW+1MLtFKtjB8X5B
 orF+UTOUgiX3cdD6ZTSgQG0eFptsXbPtsD3+Jnqk+knAeQZtUUqtobUIv
 ElvZCW6i4KdQMAP6kp2myeNV2PHBNgrIM6e8lH2RdcypQU2APyW0J+nA+
 Zw4pAoQnolk/NHJeV4Bk+9QkHE8MDrL6ylfoA8ovHx7CymGpbZEV23UBh
 BOF6hX9znfO9Yf7ec8JMyaG69/jRC/cQAyb8ZAZ6IOYQ2WIKu82kDvIzl Q==;
X-CSE-ConnectionGUID: CMHKxY+1R9C/zEr2Rs8p+A==
X-CSE-MsgGUID: 3ur2OMnLS+SiFKqGJ7dOrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="53815037"
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="53815037"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 16:49:30 -0700
X-CSE-ConnectionGUID: fUq8StgcQwKGW8eKIGsrQg==
X-CSE-MsgGUID: qAGUXfgmRJydN5/8kEFeeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,210,1744095600"; d="scan'208";a="145289450"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2025 16:49:31 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 16:49:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 4 Jun 2025 16:49:29 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.61)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 4 Jun 2025 16:49:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nq7IexKsigrRLjFSj12f1eWOkXx9zYVL5O/zLkulFWZ1oyl/C/fbYlPuukAt8xzuVeUXsXZ7CUmBZaX1yF2joP/bBzd+9SxzAxji1i4iAOhXl06KMCLrNEz5ai9GjQBM5Jr4jH+wSuXDuFhbeWz3SI75XraVelQ/w3tm6BV4Dp0FSC3Begi0Pr+33ZUgR2t3R3/XsjxWVr5izKe0q6arGfqsR77XwOawc9CJ0Jqc4s5UEveUipVJTS3OhUOZDSTOpyTF99ejFEPIqPgy+85f4PYptI9+DN32xFTArHHHox52uVjHejnBr6EfsyKfASSYcbvciZ1fJIU7iihAga/Wrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TRqOjbvJXXkXHmhFM6gfFgOhqh/M2N3RPB0XAYt5b4M=;
 b=iZM908YD93OnobXSy6c54jq56qmjPFq/BCA0Zu085ERQXyTK+Mmx3KoZDvL+kew6hisKVuxTe8/qmXpIgBPbvjdzLZuMd0BOEy6I17ZAGC/M06WVrbT8lgOA9V4WeY+Iqv9dDgFXVavm7mtOlDtR7w6d5BNla6y/HrkxJ/KZVcDxgR2F4LSnl9AdxTK5H3FYpYMG57Z1wj2QVVOLiY5OZolrLxzHUB76vOw0lleKklREcGI1kcOiAP+VfXXZbQt/5S04UuiMeCxbGtRHBbIGIwgVwgQvThYiebEaatscyWKbsoyanoTLEgHK+lCdiFy2WwooAiFID+VLbz3E8uGlAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by MW4PR11MB6812.namprd11.prod.outlook.com (2603:10b6:303:1ee::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Wed, 4 Jun
 2025 23:49:13 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::6387:4b73:8906:7543%4]) with mapi id 15.20.8769.035; Wed, 4 Jun 2025
 23:49:13 +0000
Date: Wed, 4 Jun 2025 16:49:11 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Ashutosh Dixit <ashutosh.dixit@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/5] drm/xe/oa: Print hwe to OA unit mapping
Message-ID: <aEDbdycz-I9vVzje@unerlige-desk.amr.corp.intel.com>
References: <20250603202133.2713863-1-ashutosh.dixit@intel.com>
 <20250603202133.2713863-3-ashutosh.dixit@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250603202133.2713863-3-ashutosh.dixit@intel.com>
X-ClientProxiedBy: BY3PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:254::33) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|MW4PR11MB6812:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d7234d9-2be9-4ef2-ce1a-08dda3c268fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b2FWRjh2OGcwcnY0WDlKbzRxZWhETHVkSW5xb2szZ25sUnhRdCtvanFXeDdv?=
 =?utf-8?B?cVJDSXRoZTlHck9hVUlVR2lwSWxxZ0hXaXJGK0l2L2hua051cU1kcmVvUVk2?=
 =?utf-8?B?SzNnY3lacTJwV3g3ZklORU1SK0l5Ryt1b0NzaFFDZjZxd0RCNVdJNXlEWTRZ?=
 =?utf-8?B?OVRhcFR4VEtRcVVFZEMrcWxQSmVQaTI5U1pid2FnVTNEb0o5Qjk3clRaR2Ir?=
 =?utf-8?B?Q0tXQVNJanpURVZCMjY2TFJlLzZMUVNuMzN0Q0FSWm9CTThZWGVid0l1U2pQ?=
 =?utf-8?B?NjlzSXBCS1pROWhSWlFCYllyVTJOdEtnUXBic1RZOU5FVU40cFFTUjdjWVh3?=
 =?utf-8?B?TFdxeUIzaFFBN3NlcnhSS0Z3dWgvaUlKaG1KQktCam9LaHRDaE53YkplNXpE?=
 =?utf-8?B?UmR6U24rNWxidXdGYVl1TzU1cDRVQlAxSnRacmMwOHdLbHpiamZkajc1R1gy?=
 =?utf-8?B?ODVXQmJjZGtuR25HMi9uV0pJaDZMTTVkYUtQOXlxclM3eFkrR0xOVDF5aFUv?=
 =?utf-8?B?MWhwNS82Mk5FUExHQU9zbElBS1ExeGhiNGVlNFo2STg5YjA4SFM4Y2xYdWNo?=
 =?utf-8?B?MHRsYTY1RWdPNmdWQjZGczBYMWdQY1dHYWdkNi9RTjNsSkc4aEJCdmdsd0pU?=
 =?utf-8?B?V0lPSmhxTmVoWGdQaDQySlo3SksyRzN4WjVpZkdGRkg3ZVRCYzlTNDJINGFF?=
 =?utf-8?B?cXBkOUpVQktwZFp1S25jMUVmSXRMYlBMbVJDak42bkdIQXdnMHdaVXRHVU9k?=
 =?utf-8?B?Um1rSzdEa0xDdm5scXd3bzNzUG1mTUxiUkQ1bFZQenJHeHhFM2IxV0orUU1i?=
 =?utf-8?B?b3NQSnlSZFE3OExWRkRZUUZmV09PUGhzcjk4MWN5My84Y1ZSOUZHR0lEa3p1?=
 =?utf-8?B?dSthTjh3RmNrdG1wRTV0NkxtSHZZMWV5SG10aGc0QnhEdEhvZ0JWNU95dm15?=
 =?utf-8?B?WjhyeE9rRHdmOHp1QTdramNyajM4ZzlWUHo5d2VJb2E3SVNaMnNJbnhmay9a?=
 =?utf-8?B?dkphSExmN2w5V0FnQUJ2ZmErMys0WWs4cml3K01tRktoMG9XRmNod29DNS9N?=
 =?utf-8?B?ZFNYNllUUFUvNVlkNlp2eDFmaksxVDhRTzRrdXlEc3Y5bXN1TkxSOHBRMWlz?=
 =?utf-8?B?eExIdW4zQnhJWkttYmJmT0pIN21TQ0FPbHZKNW92VkpFbEsvMjllVEE5TUM1?=
 =?utf-8?B?cnRLcTlMV3cvN3RmNjR6a2Y0ZGUzT3BmMGZyODVoZlpmRVlqVndpbml2anFu?=
 =?utf-8?B?ZFZobSs4cVRYUkswNUlJMlRDdHN4enc4YzJXWnk2dmU3NnhWYjJpOWVUYWdE?=
 =?utf-8?B?WXFyWDVZT2VSR3MvZUhUcGZiMTkrcUk4aWJKakMrT3NBRi9zOHZVdkhMNjgv?=
 =?utf-8?B?ZXF0U2pnWnVRVHpwNURWclRVNGZoZUljSnczZnVRUHoyL1R2bytONEhON3Fs?=
 =?utf-8?B?ZGcrK1lORm1LWnB6ZHM5UXh2cmVKeTBlRTYzN2dDcDRWZkhzc2NKYm1scTJK?=
 =?utf-8?B?Mm5nNHNjV0FacWZ3Uk93Mm9Dcy8yTklPbHFWVUJCbE9UT1RpenR5c1JPeVlt?=
 =?utf-8?B?VVd4R0cyV0RsVjRMTE5yYmZvODRZVUhkWk5VSHM2ZG5TNXFJVE5KZ2tPT2l0?=
 =?utf-8?B?bzRONWtKTkRqZlJxSUo3aFd6Z3NXTFJUU3p2SkZNVlFqSVZVNUt0MlNHYm1Y?=
 =?utf-8?B?aEM3OXp0ZUpXVHhFVGRjTXFMdzhtczlSS1dNQVFhVWNOM1d5MjlyMUwvSVpW?=
 =?utf-8?B?Q0t5VWFpWkJhMkoyNkg1Y1BMa3NMU2FJUmlOZDE4ZVdlWEFiRlhUVHB4NEZ0?=
 =?utf-8?B?QUpYREI0K3B0a0drOWJWaVF0c2hrWFN4WlFaMVFwL1RUUzVKMFkwZ0lSVkFZ?=
 =?utf-8?B?cFE3V3FTZ1lQWjBQYStiVE9qT2l6UVhGYW1QTEV4NW9QZEIwNUhGSkVhNlhT?=
 =?utf-8?Q?Pn39e14seE4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZzNzMUJCTHhqdEZYZVFqTFFLSE9nMTRKRVRwNWxKZHNvZ3dDemxwMnJyWGFn?=
 =?utf-8?B?TjNsN2dYM2Z2YkZnNTZ1RldFZ1ZTbkpqODVZMlFIUU5VNUp0SHZCTkF6ckVY?=
 =?utf-8?B?eEZVbStGdG9Fb29uRWh3ZWd1UDBVZDJrRzFqZGxRMXdkaURQSjlIY25NS1NY?=
 =?utf-8?B?QUdwNDlPZjFQVVFBRkZBVDVaanVoRUxTUHI5OGhpZzZLcXhWYlFkd3N6Sjk5?=
 =?utf-8?B?WlVJK3RjcnZpc2FrMXpEQ0h0YVg1Y3cwNUYwaDhMNnpXQi9ja2hrNXBZT0dN?=
 =?utf-8?B?N05YNlBhbjlGVWF4NGR0MUsycU1qSHJXeWh6ZXhuakZaTzhrTzFyZVRPaW1s?=
 =?utf-8?B?TzF1TndiMmdiemdqMldkRG5BNzZYNCtOZm9zVzFOVnNaTlZuWURHQkNlSHBG?=
 =?utf-8?B?Nkh0SHU5SzFHb2c0NjJsOTByeXJxWXdxTVRCYlNzV2Z5Q3JsUW1SbEE0SFNr?=
 =?utf-8?B?RlJyeGNGUWRVNFpOV2hQSEgxRE9veGgrTEhmUERWYzlnUVdDUmlTVGU5czN4?=
 =?utf-8?B?R1VXNXlZYmJNTTNMZFNNSWxwdlc2b2NmUEt1VytnNStycWZObnp3Tlc5bVFG?=
 =?utf-8?B?WFFTTUxnR2xLOGtSNm14R3ptQkcxWXYxZjM5WlRoSStXdzNiNFFBdWgrc2U5?=
 =?utf-8?B?ZHVXcEtyQ0gvWW5jenVnUmVpbHR2dExwSEFuREYvWExRMVFzb2h0RXhScXhW?=
 =?utf-8?B?OUFXWFprc3ovd2QxRnZTTVpYa1ZBK1F1UFV6MFRNcDNCZ2RNRTNBNmhVWjNF?=
 =?utf-8?B?UDlvcnIwQ0NteHI1UnN4eS9wczlQWDV1aUtOdW0veFpoR3RieEhnTzRKK1Vu?=
 =?utf-8?B?Z2FhVy9NVDdUUnFxSjZ1M0srYTZMZmJ0YlJhZ3BCbzc3MFNQV1NBM09aRE8w?=
 =?utf-8?B?MEJkdS8vTHRNY1NCTGMzYSt6SFhvWU1YWGFFdjVoeGRDeHdDVjdKeXZSZXdQ?=
 =?utf-8?B?S3VJeUZ4QmxieWpqb09vSVVoRVBJZERtQ25CeXM3WmZPNVBaRndhYlJSL2dP?=
 =?utf-8?B?VUtFWUJzczZUdTBWWXczcE96NVczRmoxS0pEbDJQMHNQcXJYNUY3YmJlVFNr?=
 =?utf-8?B?Vit4U1VmMHhHNkhqNTB6Q0VyVE5oUUtYOWIwZ3Y1WFBLTkhLcmdHL0s3YXJi?=
 =?utf-8?B?K0NkUDFENGt5OTRQblNxcFZhTzhIVENSSGFhSFdQWE1RQWZtNEJvdmoxTFk3?=
 =?utf-8?B?aEpwVzZjb0htcEUwU2c2YlJjVGdOeG9qeDhlQjFZQkNhQjU5aUM4T3NLQk5l?=
 =?utf-8?B?TkJNYko1RFM2TEZWZE1SeVZMdVFEQlZuUmp1YWpSUXl2Y3RSOTE4RkFraHh5?=
 =?utf-8?B?QncvQWgwMjY4aWwrWXIxbG9zUmk0UjVRR0RROU91Q0hjQjdKSEJxSUhteFBs?=
 =?utf-8?B?U1lJUVJUQlVOY0tGVEtsaGZJY3N4dlJzQzVPNGFsSVVEbndzZ1lhaStaTG5V?=
 =?utf-8?B?ZCtsNDBNWExxS3FLNHM4ck1ZSFNyRTVSelZLcGY1M2hMVlpYQURXSXlUWkFu?=
 =?utf-8?B?S05xU2kzdzZraFVCMERLZE14Q2F4d2ZUaVVKako4OUFXalBPdG5tbmJWQWg3?=
 =?utf-8?B?VUJlZmpGdVNXK2NNUS9OL3Y0UHJXNEZGU0pTaUhMS0FodDFxeUkyMTU3YXBF?=
 =?utf-8?B?THo0dExuN1E5V1Nwb1ZmTGY2eHRhNk5MdHowVTdEbENmUUM2dHBWd3RRYmZT?=
 =?utf-8?B?OVZqam9sYnV6YzN2ZW9aZHJhcHIzc3VMS1FvNldRZ3p0VXlvSzVLUDhuQUFD?=
 =?utf-8?B?SWN0c2ZxcnFZT1g3aHR4dEVHQ1duMVozSGFnVEgrcURvcDRENUZlMTFjV0J5?=
 =?utf-8?B?V0FRS2VobWNydWlZZTBLY2tIREVrWXhYWUNOVk93bnhyblZoQlJBZnBKNUJq?=
 =?utf-8?B?VDdkVGRETDM1bFc2aThPVGpBRXNHTy9lTmdlVUM5WE1oUytOVE1FMTZUeEJC?=
 =?utf-8?B?NGxjbG9RdXp6eThLdnd3TWd2NGp5c0pCbUNiUDdJUlJjaWg2RTBIZmpWaEl3?=
 =?utf-8?B?Wk1aN3RZZ1paanFRcVdZRU1La0RBU2V5RExDT0U1MWIwRDBqRTJ1b0ZRQ1Vx?=
 =?utf-8?B?LzJOT25SZnFFSTE2T2NNM1ZtaWhKODVmVGZrSEI1S2ZvTHV0c0dtM2JlWnVm?=
 =?utf-8?B?NjU2djBPU0h1VWs5TWNzVmdUQVJzS0x0NXNDa0dIVEV4NjE4OS9BZE5QUkYw?=
 =?utf-8?Q?++LUr8SIUZyE0uMJhpa5fgI=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7234d9-2be9-4ef2-ce1a-08dda3c268fe
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jun 2025 23:49:13.8472 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LK0OOEY9fOgwnR8kOABBgM4qq0oeUKkmrmi+1nfhWlp44iP0Hu0WFbRZlnL3cEpSUxofq/M9PVCpyHsg+XKvzYiWX/bY/SQkd/kNixi5SIw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6812
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

On Tue, Jun 03, 2025 at 01:21:30PM -0700, Ashutosh Dixit wrote:
>Print hwe to OA unit mapping to dmesg, to help debug for current and new
>platforms.
>
>Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
>---
> drivers/gpu/drm/xe/xe_oa.c | 27 +++++++++++++++++++++++++++
> 1 file changed, 27 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index 0de0d5a18df74..94faa4ed2012f 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -2603,6 +2603,31 @@ static int xe_oa_init_gt(struct xe_gt *gt)
> 	return 0;
> }
>
>+static void xe_oa_print_oa_units(struct xe_oa *oa)
>+{
>+	enum xe_hw_engine_id hwe_id;
>+	struct xe_hw_engine *hwe;
>+	struct xe_oa_unit *u;
>+	struct xe_gt *gt;
>+	int gt_id, i, n;
>+	char buf[256];
>+
>+	for_each_gt(gt, oa->xe, gt_id) {
>+		for (i = 0; i < gt->oa.num_oa_units; i++) {
>+			u = &gt->oa.oa_unit[i];
>+			buf[0] = '\0';
>+			n = 0;
>+
>+			for_each_hw_engine(hwe, gt, hwe_id)
>+				if (xe_oa_unit_id(hwe) == u->oa_unit_id)
>+					n += scnprintf(buf + n, sizeof(buf) - n, "%s ", hwe->name);
>+
>+			xe_gt_dbg(gt, "oa_unit %d, type %d, Engines: %s\n",
>+				  u->oa_unit_id, u->type, buf);
>+		}
>+	}
>+}
>+

nit: I would at least move one of the inner for loops outside to a 
separate helper.

otherwise, LGTM

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh

> static int xe_oa_init_oa_units(struct xe_oa *oa)
> {
> 	struct xe_gt *gt;
>@@ -2619,6 +2644,8 @@ static int xe_oa_init_oa_units(struct xe_oa *oa)
> 			return ret;
> 	}
>
>+	xe_oa_print_oa_units(oa);
>+
> 	return 0;
> }
>
>-- 
>2.48.1
>
