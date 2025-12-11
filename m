Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE68D3E792
	for <intel-xe@archiver.kernel.org>; Thu, 11 Dec 2025 11:47:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73ADC10E2BA;
	Thu, 11 Dec 2025 11:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TPo3xlqy";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA6A10E2BA
 for <intel-xe@lists.freedesktop.org>; Thu, 11 Dec 2025 11:47:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765453629; x=1796989629;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=uWpPB5hi24h9r+nBJwxbZuuGXOlhTC8tnSG7nAVOzHE=;
 b=TPo3xlqysEiGhMbkTqGFRFM3KG6CXxqUGOgn3zeeQcTWdENWPvY/GO8u
 idobbSZhhBkQVK0uyT40HFHyW1nYOlJaKmGz3e7+w/0D2ah88+072p/8a
 wGy3wAhXnb1kgeKJKwtwctPK0hd7oxGLczd1wOWmrW5Y19cbZbU6l3x9s
 VpdNCE/F0fejtVsTmveLt5hjmwcbK9foKfu6fVkawmJDzQD/ux+2YUpow
 0r2bT97O6fCMtLHT6vCzxXKu2XOqWYQBEPisR7s1vralo6F9hJn6V9IKG
 iD0UnvQo+JQD/KCE+BX0eirgnukOUL9aIAqdMgwC8FyxnmVaQhfcJnL7e w==;
X-CSE-ConnectionGUID: OGKRUHNjT9Cmfg2GFZTvkQ==
X-CSE-MsgGUID: ZRJ58+0/T46zeh6v38FrOQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11638"; a="71299574"
X-IronPort-AV: E=Sophos;i="6.20,265,1758610800"; d="scan'208,217";a="71299574"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 03:47:08 -0800
X-CSE-ConnectionGUID: 8ytTNxvwQ/yOPNxSJAevjw==
X-CSE-MsgGUID: 1WwgfHp4TSqRegScH83n9g==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2025 03:47:08 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 03:47:07 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Thu, 11 Dec 2025 03:47:07 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.42) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Thu, 11 Dec 2025 03:47:07 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BY5V3VSabUjPtIj57eoI6umik8IlWBMKg3EcS6MD30JmtzvfywSbV/FOdIe3vbgGY1nGifyDm61mCTe8WAQrVTlUl67BO9jB4TB4o+xsVJDjPR7LqePilSw36VkLg6EOl7ebi0fQsJ5UbZ1IU5+rYxfIWnk+wGQPlOuXN0bmleC+eTFhGfxeTNbEAtMym+c4g1y0xZ+gA/gnWMzR3331yVwwowxxZfu65z1oXSixjPj4DkdY2KvNeBQNAx//G81zy1kHohnplE7ctajU4Ym4ryLCAsm7TSTFp/kkP8UAIKYmhz0T+juCPJU/7usf6Bd50m0EEgfTmKZmuLek53K0KQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6+tF1dB6wh4VLVAldvF4xoLGvCxWbcz92mTpaWfs2b0=;
 b=Znfm8XM1mEI5oCvxet7lHJ3hn2UMKGYGHseZM9uHBeJZE4MdGwwA3GCOUmZHLH6VzLU07mr/YElk9bavdZ5dH9q0ei5aZ4/RbeFDotR/G+gJDijKyCZm+EpNZ/TuhhLcxD1IAfiO/oS/OPHCveFyHMhf+8Y/cBAlqdOXQRNr2WlGIwVXUzoVHqVDL2zaONTyORvSjj6x/nlVnDrw7C8wQdGQqTISPYTXAP1bkU1QkCfOLaeg4jG4h3zLrR3eIGxhEtq6iI6y4Jnz71sjT+sdHyoHTJDTQnKZ3r6GJ0l9rumFz+8rXq7HfQotToze5A3i7VJr20IY+FWecWsRct4cfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8695.namprd11.prod.outlook.com (2603:10b6:408:211::15)
 by PH3PPF4B53DB4B3.namprd11.prod.outlook.com (2603:10b6:518:1::d1d)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.10; Thu, 11 Dec
 2025 11:47:03 +0000
Received: from LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541]) by LV3PR11MB8695.namprd11.prod.outlook.com
 ([fe80::4858:d790:3ac6:8541%2]) with mapi id 15.20.9412.005; Thu, 11 Dec 2025
 11:47:03 +0000
Content-Type: multipart/alternative;
 boundary="------------sitDL0HfEk8dg1DEDhBUxJXK"
Message-ID: <f91d84ff-8893-4e5b-ad87-26ab668e705a@intel.com>
Date: Thu, 11 Dec 2025 17:16:58 +0530
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Reset_recov?=
 =?UTF-8?Q?ery=5Fqueued_after_issuing_RESFIX=5FSTART_=28rev4=29?=
To: <intel-xe@lists.freedesktop.org>
References: <20251210052546.622809-4-satyanarayana.k.v.p@intel.com>
 <176545332752.76941.17486791803453223353@a3b018990fe9>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <176545332752.76941.17486791803453223353@a3b018990fe9>
X-ClientProxiedBy: MA5PR01CA0006.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::10) To LV3PR11MB8695.namprd11.prod.outlook.com
 (2603:10b6:408:211::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8695:EE_|PH3PPF4B53DB4B3:EE_
X-MS-Office365-Filtering-Correlation-Id: 879e12a4-0a11-402c-4fb1-08de38ab006b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|13003099007|8096899003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q05oOWRGUmZ0SjJOcFUvbmZWVkRUSXhyRUZhUGY1MVVWYXFJV3JMbGpNdCs4?=
 =?utf-8?B?bVBJVktJSS9weHJVUHhiQ0VPNmo3T0hzWUVLdFBJRWdVYXlXOVI4VlFJb055?=
 =?utf-8?B?K0IrVHpCVEMyYzhnK0tCTlBncForcDVJMmF1NGxyR0ZoTnJFZG5RRFdwYldE?=
 =?utf-8?B?ck1KMmVIWmJFczFZQXFpSnJlcmlhN2Y4Si9JT1Ewd3JGMG42UC9qRVdzVGt0?=
 =?utf-8?B?TFhDc2VZQXd5TzJjb2ZzMkxlTnRuZ3YwREFHSTJzQXBEUExOLzRXc0owK3Bi?=
 =?utf-8?B?cmd5bDBkYUJJcE9UUnllOGdNNjdob2RtNFlERkttZWoraVhxeDBpMGpHNDBG?=
 =?utf-8?B?bTBWMzliVHp1MHV4T2RUbnFMSWE3THR1enRIOHhsRmR3N0tIbDM2UWtLdEV1?=
 =?utf-8?B?RFBBNVpQWEorOXlHTzN0TGR1UnBKVVQwYVlWYnpGQWdJMDB6Z2k3ajN4bGg3?=
 =?utf-8?B?dlFWT1FiRHRtdDNzKzV6bVpuK0lJcWthV1pCb25QY3hlWjBGNmRiZGVPdER0?=
 =?utf-8?B?MmhJQ1NSYlAwUURjVVYvZlJZc2c0S3ZkZzk5V093N2Q0TmRteHVBczZsVXpO?=
 =?utf-8?B?eW9CSCtMOE9KbTQ4VUcvRTJKWEtTeTZGZ043QUlqRUp5aDVXVzVkdi9DU1dh?=
 =?utf-8?B?UmQxaDlJb0FPZUxkNzlMN24yY0w1RnJiV1Fid3NMVFJsVVFjODE5dWxuOUl0?=
 =?utf-8?B?eTFVUVRKUVRlNW9aeGIrWUVNSTk3SG5SbUlGRVk2d0ZBamMxeWcvR0g4RCtG?=
 =?utf-8?B?OUg0Qk0yQllnV1Q1US96MDlCb3ZRUnV3YWNlSTVOQXRGUnIxWHhQaEJXQ1ND?=
 =?utf-8?B?M2F1Q21mV1I0YVdwcEdLYXJkTVYybDV4NEZmandDODJFNzdjdGNoNDc0Ly9i?=
 =?utf-8?B?Y1hGZ3FwZkVBN0E3S3lQeTFqczNNU01uRlMxQlQreUM5RkMrR05Uc01pYXdS?=
 =?utf-8?B?aEFnaGVLK010OGZ6WTFCQ1NZZkI5NkpnN1g4RmxhbkI5dDFUeUh5VVg2aUVt?=
 =?utf-8?B?cCtJRzIvcGhVUXRFYWwrSkZZR0xueVBzbmdzSU0wODFHbVY1dFNoWDNoZCt6?=
 =?utf-8?B?bXRZbXdwLzVhaURPa0F6bG1kYndiaS83aktQOHgyN2Y0bDRUTm4yRm55K1hP?=
 =?utf-8?B?c0JQMWIyMC93RVRFcXhkeGFUakdOQ0RjN2o5TkU2Um13aVpYZkNjQ0FaNmZo?=
 =?utf-8?B?cVhPWTBHRWNYcUdNODFkRTlybEV5bU53UkM3Tzh0RVRXTk1LNU1MK3ExQ3Jx?=
 =?utf-8?B?UVhrcC9zMG5ZM0U4VkRKdFEzVjdQcmQzTGpWMWtscmZFdExJazNNTkJ4RmN5?=
 =?utf-8?B?N3YzdGRidUhEeTVBNHZXSHlWVytXVHFQaDR2RWE4QXVnUWdUNjhsby9lSlFz?=
 =?utf-8?B?SHhTeFUraThHOEtzT0M3VGdSalhiQTZJZlJjZnVmdENtcENNU1M2cGZYVWNo?=
 =?utf-8?B?azlab1FYUTlIektwR2JITjNzVHhGSnE4REs2dTJOSkFWc2JUUXVZYlh6MHVD?=
 =?utf-8?B?bmZDUDJqdDZkQmV5LzBKTXkxVUdzZnphN2FOcDN2aTVHaEEvTEczSkFsaG4r?=
 =?utf-8?B?U3AzMk03QWtWa0J2d0tJTUlxMjl5MG9vUSsvYkFHSmlSMEo4UmZ4RWtjakV5?=
 =?utf-8?B?SjBvOUt6T2JWMEZZYTErWHdsK3lDb3k2OTFvTDBhWTF6OGJja3FQR3h5bXZ3?=
 =?utf-8?B?U3JUUHp0SklacjYvSVNPdTMzbE93bUljeUtoczZpdDgwM3lENmFOZ0pqNVRC?=
 =?utf-8?B?ZStCYXk3UjkyK0RaYXdwajhOVjlNMFhaR2szZmN3MENoZ0thcGhObE9UY3Iv?=
 =?utf-8?B?SEFEcy96ZVdmSXlFUU9jaGZPZUM4ZjBBT0Z4dDluRVpsNSswVmJmSTV0ZmpW?=
 =?utf-8?B?Vi8vU2xSc0FCOTU4M3lzUllqYVFEcjBnNE93K0VNNWZUQXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8695.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(13003099007)(8096899003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c2VXQzlEU0lFUkdMdTJRZHFXK0Q2dzFjaTlCcHJkMzZ5ekZWRjIwWUNFUlpD?=
 =?utf-8?B?K3d3MVJxWFU0MnlHTVBRVXQyVG1jbnVnUEVwV0NSTkNld0RISWFNZXpHVnFa?=
 =?utf-8?B?Mjh2Qk11NEZCMXZRVk5MeWhTNG1mR2RqWTBHVnNoNTkvdE5LeVVaNUZicVc3?=
 =?utf-8?B?RDNpaG1OZ0MvbTFPWGM2UkQ3ZTErcHVHck83RVpSekFUNGdlNFpSYk40TGJl?=
 =?utf-8?B?TFpXVTFqRStHcWo4VWNkc2lTVlZxQWpkTFM2Z0w0NFdaSmFzUzBCcUJjYy9B?=
 =?utf-8?B?TWNFYnhNaGNGSnJSMDJmZ1ROWlR5RnQ5cmo1WGRnUEM3MWtxRFM4V3grQ0hz?=
 =?utf-8?B?WlQ0cHp6czdpYjNVRGlmOEdLOHM3SFovNTlGai83YTIzNDl5MERzQ3pkbWx2?=
 =?utf-8?B?d3lGUlh2OWxSZThyQ3NYZXpNVjlDMlRjOGI4ZjFzcDd6dHlUOUJyUjV3NTdT?=
 =?utf-8?B?c1crRCtqVGJaZXE2NFBWc0RNRGZReWRxN0lRc3RQcnlueGdRblhTZnQ5cHo1?=
 =?utf-8?B?dnJxWHYxN3cxeTFmWG5BdUl2aVBnUnRXaXp2Wk4ydG9QdUdwTk00c1VTODVX?=
 =?utf-8?B?V0s5NHQ5TFhrMWlqWDBkQ2ZmNnhOZ3RGUjBYbzhSclZpVlByMkRqRENkNGhC?=
 =?utf-8?B?TGdCSm5pdUpvdUx4L0l5NW0rR1hJVXYrY0RpYmhMbXpjNzRaUFVORG1IdzY5?=
 =?utf-8?B?Y2Fuc0pKbmNwK01xTmU2MlZOKzNZWlBWTnEwVkIwMlk0U1JWN0VubGxJM0lJ?=
 =?utf-8?B?VHl4UkJXWDliaDV3VDl2MS8wRHdaaGhBYXZGcFZLRTNXVTRJWmZmd25XRmlT?=
 =?utf-8?B?cm5lb2dDNHppQXRRanV6R3NGV3BpYk4zV3FlS3lKTmVHbWFGaU1td2pURUlW?=
 =?utf-8?B?RTJhWUkrM1BNN0hpMVVjSlBHR21zbnFRQnZLS1ZLbWl6RFlwcGs3YUNIWXFo?=
 =?utf-8?B?OVZZak5sL2VES3JsZk9yUCtXZU1pY3RtUGkrcmtvdGNWNGVlRFVuSHRhU01V?=
 =?utf-8?B?aTEvMFVId3pwQ0thWFZ5K2M5SlNrVU4zd1JiaVpjTXFIRUJmaHpScFFuWjVm?=
 =?utf-8?B?bFRNaUVrdmZLRFlVNTJ6T2xLU1FDcmRWNEtKVnZGY0lMTGlTQjhvYk5oTVBW?=
 =?utf-8?B?U3RvRDF0V0pXYmJ1Q0NEVU9QWG8vanpDRmJVSHFTTTdOMHZhL3Z0ZnZrTEhB?=
 =?utf-8?B?dEZFU1NRQ3BHNUE2Q0FESHhkUm92SUQ2N2dmQld4ZTl6bkpNajl3RmdWTndH?=
 =?utf-8?B?K1V5MTRJZ2IxZ05ESjdSS3Q4US9JQzlrR0ZCM0hwYmt2V1dRQ0t2ZC80VTI1?=
 =?utf-8?B?b2M0MUpvSHNLUER4RlZJeGpOL2VScTlzRGU0cFR1Tk1xcm9VaHF0MzNPQS94?=
 =?utf-8?B?ck0yV2JiU1Y0ZGlwS2tseE9UV1lVZWRwR3NWWHpXcEx0VHc4N3FsS25TY1FD?=
 =?utf-8?B?T2MxOWlNZEE5SW1jYmZCRFdscDBILzhPSUxaT2M3Sk5NRnlFTGxOM2RlZFFv?=
 =?utf-8?B?WWx4RDVDRkwvS2RpYWtiOVdzYnpRZW5FNGtVT1pYM0FWTEV4MGtlQWNlSXBt?=
 =?utf-8?B?b2t6eVVNSXo2OGtwTXNBT1RJald0UDdoa2wxam4yYStGOUxrK1plam9MTkNa?=
 =?utf-8?B?V1FCYXE5WmJtaE1jQVZIM2dnK2RwWkRoUCtlQnRMNGJ5NHNoSm8yZTl6TzJN?=
 =?utf-8?B?ZGhEd1phTWZMclNGS3ZsWkZqYmNpVDBuSWtNbkFsYVlkVzdjYm9QRVdROTU4?=
 =?utf-8?B?MVZ3alRRVDhLNThXNlR3SXZjQk1uMHJ4Z3lIZmZFUThac1hRUWpNdU0xcWZW?=
 =?utf-8?B?MFdNL3BFNXNLUHA4N0RnOTd2WjJhdFV1WElKdXlmK05pQVdXVFZFYVZUeWsv?=
 =?utf-8?B?T0dYMytESVJYRm52bVMxSi9kSlFiM2FTZlpQU0NRb3loWnZjUlVhUWdQZDdG?=
 =?utf-8?B?TEY3YWNpRVo0TDlhQ2JTN2U3bjR6d2N4Q1dXejhYQ09TS1FETS91SWNLcVFi?=
 =?utf-8?B?WTZhd0IyR2RoMUJkMVozRUpmTXNWNnB4RW9tN1hXZGU4V0lucExxNWNxY0xr?=
 =?utf-8?B?YVd6b1M3cGVlZUUvU0gyMjRPODJ4U09hSkZRZ0pKbE9lNjR4U3loaHhsRDBN?=
 =?utf-8?B?NUhCMm1hTzZOMnBTS2xDSGtxQitpNy9ZRWZqVlgvaVpmWUR1N1lWKzczTzBS?=
 =?utf-8?B?Z3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 879e12a4-0a11-402c-4fb1-08de38ab006b
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8695.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2025 11:47:03.3896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mWiBjeEPWfdq1d6a+zcAu4vCvR47FVxclFKfobahzO7snyI1QLjPVTcfvNorXnmVufmQhpenr8562fpfHaJfL0iFCE8G1FoD87953iZ2dRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF4B53DB4B3
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

--------------sitDL0HfEk8dg1DEDhBUxJXK
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 11-Dec-25 5:12 PM, Patchwork wrote:
> Project List - Patchwork *Patch Details*
> *Series:* 	Reset recovery_queued after issuing RESFIX_START (rev4)
> *URL:* 	https://patchwork.freedesktop.org/series/158541/
> *State:* 	failure
> *Details:* 
> https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/index.html
>
>
>   CI Bug Log - changes from
>   xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b_FULL ->
>   xe-pw-158541v4_FULL
>
>
>     Summary
>
> *FAILURE*
>
> Serious unknown changes coming with xe-pw-158541v4_FULL absolutely 
> need to be
> verified manually.
>
> If you think the reported changes have nothing to do with the changes
> introduced in xe-pw-158541v4_FULL, please notify your bug team 
> (I915-ci-infra@lists.freedesktop.org) to allow them
> to document this new failure mode, which will reduce false positives 
> in CI.
>
>
>     Participating hosts (2 -> 2)
>
> No changes in participating hosts
>
>
>     Possible new issues
>
> Here are the unknown changes that may have been introduced in 
> xe-pw-158541v4_FULL:
>
>
>       IGT changes
>
>
>         Possible regressions
>
>   * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ac-dp2-hdmi-a3:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ac-dp2-hdmi-a3.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ac-dp2-hdmi-a3.html>
>
The proposed change does not affect display and the failure is not 
related to this proposed change.

Please help to merge this series.

>  *
>
>
>     Known issues
>
> Here are the changes found in xe-pw-158541v4_FULL that come from known 
> issues:
>
>
>       IGT changes
>
>
>         Issues hit
>
>  *
>
>     igt@kms_big_fb@linear-8bpp-rotate-270:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rotate-270.html>
>         (Intel XE#2327
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327>) +1
>         other test skip
>  *
>
>     igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html>
>         (Intel XE#1124
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124>) +3
>         other tests skip
>  *
>
>     igt@kms_bw@linear-tiling-2-displays-2160x1440p:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html>
>         (Intel XE#367
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/367>) +1
>         other test skip
>  *
>
>     igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs.html>
>         (Intel XE#2887
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887>) +2
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp-2.html>
>         (Intel XE#2652
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652> /
>         Intel XE#787
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/787>) +17
>         other tests skip
>  *
>
>     igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         -> INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html>
>         (Intel XE#3862
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862>) +1
>         other test incomplete
>  *
>
>     igt@kms_cdclk@mode-transition-all-outputs:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-3/igt@kms_cdclk@mode-transition-all-outputs.html>
>         (Intel XE#2724
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724>)
>  *
>
>     igt@kms_chamelium_color@ctm-red-to-blue:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_chamelium_color@ctm-red-to-blue.html>
>         (Intel XE#2325
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325>)
>  *
>
>     igt@kms_chamelium_frames@hdmi-crc-fast:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_chamelium_frames@hdmi-crc-fast.html>
>         (Intel XE#2252
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252>)
>  *
>
>     igt@kms_cursor_crc@cursor-sliding-max-size:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_cursor_crc@cursor-sliding-max-size.html>
>         (Intel XE#2320
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320>)
>  *
>
>     igt@kms_dsc@dsc-with-output-formats:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats.html>
>         (Intel XE#2244
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244>)
>  *
>
>     igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html>
>         (Intel XE#3149
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149> /
>         Intel XE#3650
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3650>) +1
>         other test fail
>  *
>
>     igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3.html>
>         (Intel XE#3650
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3650>) +2
>         other tests fail
>  *
>
>     igt@kms_flip@flip-vs-expired-vblank@a-edp1:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html>
>         (Intel XE#301
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/301>) +2
>         other tests fail
>  *
>
>     igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-blt.html>
>         (Intel XE#4141
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141>) +2
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-onoff.html>
>         (Intel XE#2311
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311>) +6
>         other tests skip
>  *
>
>     igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-blt.html>
>         (Intel XE#2313
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313>)
>         +10 other tests skip
>  *
>
>     igt@kms_hdr@bpc-switch@pipe-a-dp-2:
>
>       o shard-bmg: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-2/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html>
>         -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-8/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html>
>         (Intel XE#6740
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740>) +3
>         other tests abort
>  *
>
>     igt@kms_pm_backlight@bad-brightness:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_pm_backlight@bad-brightness.html>
>         (Intel XE#870
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/870>)
>  *
>
>     igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#1489
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489>)
>  *
>
>     igt@kms_psr@fbc-pr-primary-page-flip:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_psr@fbc-pr-primary-page-flip.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234> /
>         Intel XE#2850
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850>) +1
>         other test skip
>  *
>
>     igt@kms_psr@psr2-primary-render:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_psr@psr2-primary-render.html>
>         (Intel XE#1406
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406> /
>         Intel XE#2234
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234>)
>  *
>
>     igt@kms_rotation_crc@sprite-rotation-90:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html>
>         (Intel XE#3414
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414> /
>         Intel XE#3904
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904>) +1
>         other test skip
>  *
>
>     igt@kms_sharpness_filter@filter-scaler-upscale:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_sharpness_filter@filter-scaler-upscale.html>
>         (Intel XE#6503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503>)
>  *
>
>     igt@xe_eudebug@discovery-empty:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@xe_eudebug@discovery-empty.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837>) +1
>         other test skip
>  *
>
>     igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram.html>
>         (Intel XE#4837
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837> /
>         Intel XE#6665
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6665>)
>  *
>
>     igt@xe_exec_basic@multigpu-once-basic:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@xe_exec_basic@multigpu-once-basic.html>
>         (Intel XE#2322
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322>)
>  *
>
>     igt@xe_exec_system_allocator@many-64k-mmap-free-huge:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@xe_exec_system_allocator@many-64k-mmap-free-huge.html>
>         (Intel XE#5007
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007>)
>  *
>
>     igt@xe_exec_system_allocator@process-many-mmap-free-huge:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-3/igt@xe_exec_system_allocator@process-many-mmap-free-huge.html>
>         (Intel XE#4943
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943>) +6
>         other tests skip
>  *
>
>     igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
>
>       o shard-bmg: NOTRUN -> ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html>
>         (Intel XE#5466
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466> /
>         Intel XE#5530
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/5530>)
>  *
>
>     igt@xe_module_load@load:
>
>       o shard-bmg: (PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-6/igt@xe_module_load@load.html>)
>         -> (SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-6/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-5/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-2/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-3/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-1/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-8/igt@xe_module_load@load.html>,
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-8/igt@xe_module_load@load.html>)
>         (Intel XE#2457
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457>)
>  *
>
>     igt@xe_pm@s3-d3cold-basic-exec:
>
>       o shard-bmg: NOTRUN -> SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@xe_pm@s3-d3cold-basic-exec.html>
>         (Intel XE#2284
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284>)
>  *
>
>     igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0:
>
>       o shard-lnl: PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-lnl-5/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0.html>
>         -> FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-lnl-4/igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0.html>
>         (Intel XE#6251
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6251>)
>
>
>         Possible fixes
>
>  *
>
>     igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-2/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html>
>         -> PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-8/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html>
>         +1 other test pass
>  *
>
>     igt@kms_cursor_legacy@flip-vs-cursor-legacy:
>
>       o shard-bmg: FAIL
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>         (Intel XE#4633
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html>
>  *
>
>     igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
>
>       o shard-bmg: INCOMPLETE
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-2/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html>
>         (Intel XE#2049
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049> /
>         Intel XE#2597
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html>
>         +1 other test pass
>  *
>
>     igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-3/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html>
>         (Intel XE#6740
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740>) ->
>         PASS
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2.html>
>         +1 other test pass
>
>
>         Warnings
>
>  *
>
>     igt@kms_hdr@brightness-with-hdr:
>
>       o shard-bmg: SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-5/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3374
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374> /
>         Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html>
>         (Intel XE#3544
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544>)
>  *
>
>     igt@kms_hdr@invalid-hdr:
>
>       o shard-bmg: ABORT
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-5/igt@kms_hdr@invalid-hdr.html>
>         (Intel XE#6740
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740>) ->
>         SKIP
>         <https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-6/igt@kms_hdr@invalid-hdr.html>
>         (Intel XE#1503
>         <https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503>)
>
>
>     Build changes
>
>   * Linux: xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b ->
>     xe-pw-158541v4
>
> IGT_8663: aca02d1cc9804e5f1868b0ebfba6426e2d1244fc @ 
> https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
> xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b: 
> 3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b
> xe-pw-158541v4: 158541v4
>
--------------sitDL0HfEk8dg1DEDhBUxJXK
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class=3D"moz-cite-prefix">On 11-Dec-25 5:12 PM, Patchwork wrote:<b=
r>
    </div>
    <blockquote type=3D"cite" cite=3D"mid:176545332752.76941.17486791803453=
223353@a3b018990fe9">
     =20
      <title>Project List - Patchwork</title>
      <style id=3D"css-table-select" type=3D"text/css">td { padding: 2pt; }=
</style>
      <b>Patch Details</b>
      <table>
        <tbody>
          <tr>
            <td><b>Series:</b></td>
            <td>Reset recovery_queued after issuing RESFIX_START (rev4)</td=
>
          </tr>
          <tr>
            <td><b>URL:</b></td>
            <td><a href=3D"https://patchwork.freedesktop.org/series/158541/=
" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">https://patchwor=
k.freedesktop.org/series/158541/</a></td>
          </tr>
          <tr>
            <td><b>State:</b></td>
            <td>failure</td>
          </tr>
          <tr>
            <td><b>Details:</b></td>
            <td><a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
158541v4/index.html" moz-do-not-send=3D"true" class=3D"moz-txt-link-freetex=
t">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/index.html</a><=
/td>
          </tr>
        </tbody>
      </table>
      <h1>CI Bug Log - changes from
        xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b_FULL -&gt;
        xe-pw-158541v4_FULL</h1>
      <h2>Summary</h2>
      <p><strong>FAILURE</strong></p>
      <p>Serious unknown changes coming with xe-pw-158541v4_FULL
        absolutely need to be<br>
        verified manually.</p>
      <p>If you think the reported changes have nothing to do with the
        changes<br>
        introduced in xe-pw-158541v4_FULL, please notify your bug team
        (<a class=3D"moz-txt-link-abbreviated" href=3D"mailto:I915-ci-infra=
@lists.freedesktop.org">I915-ci-infra@lists.freedesktop.org</a>) to allow t=
hem<br>
        to document this new failure mode, which will reduce false
        positives in CI.</p>
      <h2>Participating hosts (2 -&gt; 2)</h2>
      <p>No changes in participating hosts</p>
      <h2>Possible new issues</h2>
      <p>Here are the unknown changes that may have been introduced in
        xe-pw-158541v4_FULL:</p>
      <h3>IGT changes</h3>
      <h4>Possible regressions</h4>
      <ul>
        <li>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-inter=
ruptible@ac-dp2-hdmi-a3:
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-8/igt@kms_f=
lip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ac-dp2-hdmi-=
a3.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-6/igt@kms_flip@2x-singl=
e-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ac-dp2-hdmi-a3.html" moz=
-do-not-send=3D"true">FAIL</a></li>
          </ul>
        </li>
      </ul>
    </blockquote>
    <p>The proposed change does not affect display and the failure is
      not related to this proposed change.</p>
    <p>Please help to merge this series.</p>
    <blockquote type=3D"cite" cite=3D"mid:176545332752.76941.17486791803453=
223353@a3b018990fe9">
      <ul>
        <li>
          <ul>
          </ul>
          <br>
        </li>
      </ul>
      <h2>Known issues</h2>
      <p>Here are the changes found in xe-pw-158541v4_FULL that come
        from known issues:</p>
      <h3>IGT changes</h3>
      <h4>Issues hit</h4>
      <ul>
        <li>
          <p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_big_fb@linear-8bpp-rot=
ate-270.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2327" moz-do-not-send=3D"true">Intel X=
E#2327</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p=
>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw=
-stride-64bpp-rotate-0-hflip.html" moz-do-not-send=3D"true">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124" moz-do-not-=
send=3D"true">Intel XE#1124</a>) +3 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_bw@linear-tiling-2-dis=
plays-2160x1440p.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/367" moz-do-not-send=3D"true"=
>Intel XE#367</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-mc-ccs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-3/igt@kms_ccs@ccs-on-another-bo-=
y-tiled-gen12-mc-ccs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2887" moz-do-not-send=3D"=
true">Intel XE#2887</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs@pipe-c-dp=
-2:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_ccs@crc-primary-rotati=
on-180-4-tiled-lnl-ccs@pipe-c-dp-2.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652" moz-d=
o-not-send=3D"true">Intel XE#2652</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787" moz-do-not-send=3D"true">Intel XE#787</a>)=
 +17 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-3/igt@kms_c=
cs@crc-primary-suspend-4-tiled-bmg-ccs.html" moz-do-not-send=3D"true">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541=
v4/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html" moz-do=
-not-send=3D"true">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3862" moz-do-not-send=3D"true">Intel XE#3862</a>) +1=
 other test
              incomplete</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cdclk@mode-transition-all-outputs:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-3/igt@kms_cdclk@mode-transition-=
all-outputs.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2724" moz-do-not-send=3D"true">Int=
el XE#2724</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_chamelium_color@ctm-re=
d-to-blue.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2325" moz-do-not-send=3D"true">Intel=
 XE#2325</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_chamelium_frames@hdmi-=
crc-fast.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2252" moz-do-not-send=3D"true">Intel =
XE#2252</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_cursor_crc@cursor-slid=
ing-max-size.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2320" moz-do-not-send=3D"true">In=
tel XE#2320</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_dsc@dsc-with-output-formats:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_dsc@dsc-with-output-fo=
rmats.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2244" moz-do-not-send=3D"true">Intel XE#=
2244</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-inte=
rruptible:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-8/igt@kms_f=
lip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html" moz-do=
-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-158541v4/shard-bmg-6/igt@kms_flip@2x-single-buffer-flip-v=
s-dpms-off-vs-modeset-interruptible.html" moz-do-not-send=3D"true">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149" moz-=
do-not-send=3D"true">Intel XE#3149</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3650" moz-do-not-send=3D"true">Intel XE#3650</=
a>) +1 other test
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-inte=
rruptible@ad-dp2-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-8/igt@kms_f=
lip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-=
a3.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-6/igt@kms_flip@2x-singl=
e-buffer-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp2-hdmi-a3.html" moz=
-do-not-send=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3650" moz-do-not-send=3D"true">Intel XE#3650</a>) +2 ot=
her tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-lnl-1/igt@kms_f=
lip@flip-vs-expired-vblank@a-edp1.html" moz-do-not-send=3D"true">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/sh=
ard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html" moz-do-not-send=
=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/301" moz-do-not-send=3D"true">Intel XE#301</a>) +2 other tests
              fail</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbc-1p-offscreen-pri-indfb-draw-b=
lt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_frontbuffer_tracking@f=
bc-1p-offscreen-pri-indfb-draw-blt.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141" moz-d=
o-not-send=3D"true">Intel XE#4141</a>) +2 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-ono=
ff:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-3/igt@kms_frontbuffer_tracking@f=
bcdrrs-2p-scndscrn-cur-indfb-onoff.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311" moz-d=
o-not-send=3D"true">Intel XE#2311</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-shrfb-pgflip-b=
lt:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_frontbuffer_tracking@f=
bcpsr-2p-primscrn-shrfb-pgflip-blt.html" moz-do-not-send=3D"true">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313" moz-d=
o-not-send=3D"true">Intel XE#2313</a>) +10 other
              tests skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-2/igt@kms_h=
dr@bpc-switch@pipe-a-dp-2.html" moz-do-not-send=3D"true">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-=
8/igt@kms_hdr@bpc-switch@pipe-a-dp-2.html" moz-do-not-send=3D"true">ABORT</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740" mo=
z-do-not-send=3D"true">Intel XE#6740</a>) +3 other tests
              abort</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_pm_backlight@bad-brightness:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_pm_backlight@bad-brigh=
tness.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/870" moz-do-not-send=3D"true">Intel XE#8=
70</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-3/igt@kms_psr2_sf@fbc-pr-plane-m=
ove-sf-dmg-area.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true"=
>Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1489" moz-do-not-send=3D"true">Intel XE#1489</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_psr@fbc-pr-primary-pag=
e-flip.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE=
#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234" moz-do-not-send=3D"true">Intel XE#2234</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2850" moz-do-not-send=3D"true">Intel=
 XE#2850</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_psr@psr2-primary-render:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_psr@psr2-primary-rende=
r.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1406" moz-do-not-send=3D"true">Intel XE#1406=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234"=
 moz-do-not-send=3D"true">Intel XE#2234</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_rotation_crc@sprite-rotation-90:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_rotation_crc@sprite-ro=
tation-90.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3414" moz-do-not-send=3D"true">Intel=
 XE#3414</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3904" moz-do-not-send=3D"true">Intel XE#3904</a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_sharpness_filter@filter-scaler-upscale:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_sharpness_filter@filte=
r-scaler-upscale.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/6503" moz-do-not-send=3D"true=
">Intel XE#6503</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug@discovery-empty:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@xe_eudebug@discovery-empty=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4837" moz-do-not-send=3D"true">Intel XE#4837<=
/a>) +1 other test
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_eudebug_online@writes-caching-vram-bb-vram-target-sram:=
</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@xe_eudebug_online@writes-c=
aching-vram-bb-vram-target-sram.html" moz-do-not-send=3D"true">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837" moz-do-n=
ot-send=3D"true">Intel XE#4837</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/6665" moz-do-not-send=3D"true">Intel XE#6665</a>)<=
/li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_basic@multigpu-once-basic:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@xe_exec_basic@multigpu-onc=
e-basic.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2322" moz-do-not-send=3D"true">Intel X=
E#2322</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@many-64k-mmap-free-huge:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@xe_exec_system_allocator@m=
any-64k-mmap-free-huge.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5007" moz-do-not-send=
=3D"true">Intel XE#5007</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_exec_system_allocator@process-many-mmap-free-huge:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-3/igt@xe_exec_system_allocator@p=
rocess-many-mmap-free-huge.html" moz-do-not-send=3D"true">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943" moz-do-not-se=
nd=3D"true">Intel XE#4943</a>) +6 other tests
              skip</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@xe_fault_injection@probe-f=
ail-guc-xe_guc_ct_send_recv.html" moz-do-not-send=3D"true">ABORT</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466" moz-do-not-=
send=3D"true">Intel XE#5466</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5530" moz-do-not-send=3D"true">Intel XE#5530</a>)</li=
>
          </ul>
        </li>
        <li>
          <p>igt@xe_module_load@load:</p>
          <ul>
            <li>shard-bmg: (<a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-6/igt@xe_m=
odule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b74=
0e3ab40b/shard-bmg-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3ad=
b3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-3/igt@xe_module_load@load.h=
tml" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bm=
g-4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1=
f6e137827b740e3ab40b/shard-bmg-5/igt@xe_module_load@load.html" moz-do-not-s=
end=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-5/igt@xe_module=
_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab=
40b/shard-bmg-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4a=
a5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-3/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-3/i=
gt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e13=
7827b740e3ab40b/shard-bmg-3/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-4/igt@xe_module_lo=
ad@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b=
/shard-bmg-2/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a=
8563ee9c1f6e137827b740e3ab40b/shard-bmg-8/igt@xe_module_load@load.html" moz=
-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-8/igt@=
xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e13782=
7b740e3ab40b/shard-bmg-2/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220=
-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-4/igt@xe_module_load@lo=
ad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shar=
d-bmg-8/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563e=
e9c1f6e137827b740e3ab40b/shard-bmg-8/igt@xe_module_load@load.html" moz-do-n=
ot-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-1/igt@xe_mo=
dule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740=
e3ab40b/shard-bmg-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb=
3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-2/igt@xe_module_load@load.ht=
ml" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg=
-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f=
6e137827b740e3ab40b/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not-se=
nd=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-6/igt@xe_module_=
load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab4=
0b/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS<=
/a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1585=
41v4/shard-bmg-4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">SKI=
P</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/=
shard-bmg-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard=
-bmg-1/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-=
3/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-6/ig=
t@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-5/igt@xe_=
module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-6/igt@xe_modul=
e_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-8/igt@xe_module_loa=
d@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-8/igt@xe_module_load@loa=
d.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-3/igt@xe_module_load@load.htm=
l" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-158541v4/shard-bmg-6/igt@xe_module_load@load.html" mo=
z-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-158541v4/shard-bmg-1/igt@xe_module_load@load.html" moz-do-=
not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-158541v4/shard-bmg-6/igt@xe_module_load@load.html" moz-do-not-s=
end=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-158541v4/shard-bmg-2/igt@xe_module_load@load.html" moz-do-not-send=
=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-158541v4/shard-bmg-2/igt@xe_module_load@load.html" moz-do-not-send=3D"t=
rue">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
58541v4/shard-bmg-5/igt@xe_module_load@load.html" moz-do-not-send=3D"true">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541=
v4/shard-bmg-4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/sh=
ard-bmg-4/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-b=
mg-2/igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-3/=
igt@xe_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@x=
e_module_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-1/igt@xe_mod=
ule_load@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-1/igt@xe_module_l=
oad@load.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-1/igt@xe_module_load@l=
oad.html" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-8/igt@xe_module_load@load.h=
tml" moz-do-not-send=3D"true">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-8/igt@xe_module_load@load.html" =
moz-do-not-send=3D"true">PASS</a>) (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2457" moz-do-not-send=3D"true">Intel XE#2457</a>)</=
li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pm@s3-d3cold-basic-exec:</p>
          <ul>
            <li>shard-bmg: NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@xe_pm@s3-d3cold-basic-exec=
.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2284" moz-do-not-send=3D"true">Intel XE#2284<=
/a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@xe_pmu@engine-activity-accuracy-50@engine-drm_xe_engine_cl=
ass_video_enhance0:</p>
          <ul>
            <li>shard-lnl: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-lnl-5/igt@xe_pm=
u@engine-activity-accuracy-50@engine-drm_xe_engine_class_video_enhance0.htm=
l" moz-do-not-send=3D"true">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-158541v4/shard-lnl-4/igt@xe_pmu@engine-activity-=
accuracy-50@engine-drm_xe_engine_class_video_enhance0.html" moz-do-not-send=
=3D"true">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/6251" moz-do-not-send=3D"true">Intel XE#6251</a>)</li>
          </ul>
        </li>
      </ul>
      <h4>Possible fixes</h4>
      <ul>
        <li>
          <p>igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-2/igt@kms_c=
ursor_edge_walk@256x256-top-edge@pipe-d-dp-2.html" moz-do-not-send=3D"true"=
>FAIL</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
158541v4/shard-bmg-8/igt@kms_cursor_edge_walk@256x256-top-edge@pipe-d-dp-2.=
html" moz-do-not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-8/igt@kms_c=
ursor_legacy@flip-vs-cursor-legacy.html" moz-do-not-send=3D"true">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633" moz-d=
o-not-send=3D"true">Intel XE#4633</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-1/igt@kms_cursor_legacy@fli=
p-vs-cursor-legacy.html" moz-do-not-send=3D"true">PASS</a></li>
          </ul>
        </li>
        <li>
          <p>igt@kms_flip@flip-vs-suspend@c-hdmi-a3:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-2/igt@kms_f=
lip@flip-vs-suspend@c-hdmi-a3.html" moz-do-not-send=3D"true">INCOMPLETE</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049" moz-=
do-not-send=3D"true">Intel XE#2049</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2597" moz-do-not-send=3D"true">Intel XE#2597</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541=
v4/shard-bmg-3/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html" moz-do-not-send=
=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@bpc-switch-dpms@pipe-a-dp-2:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-3/igt@kms_h=
dr@bpc-switch-dpms@pipe-a-dp-2.html" moz-do-not-send=3D"true">ABORT</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6740" moz-do-n=
ot-send=3D"true">Intel XE#6740</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-158541v4/shard-bmg-4/igt@kms_hdr@bpc-switch-dpms@=
pipe-a-dp-2.html" moz-do-not-send=3D"true">PASS</a> +1 other test pass</li>
          </ul>
        </li>
      </ul>
      <h4>Warnings</h4>
      <ul>
        <li>
          <p>igt@kms_hdr@brightness-with-hdr:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-5/igt@kms_h=
dr@brightness-with-hdr.html" moz-do-not-send=3D"true">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374" moz-do-not-send=
=3D"true">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3544" moz-do-not-send=3D"true">Intel XE#3544</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158541v4/shard-bm=
g-4/igt@kms_hdr@brightness-with-hdr.html" moz-do-not-send=3D"true">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544" moz-=
do-not-send=3D"true">Intel XE#3544</a>)</li>
          </ul>
        </li>
        <li>
          <p>igt@kms_hdr@invalid-hdr:</p>
          <ul>
            <li>shard-bmg: <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b/shard-bmg-5/igt@kms_h=
dr@invalid-hdr.html" moz-do-not-send=3D"true">ABORT</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/6740" moz-do-not-send=3D"true"=
>Intel XE#6740</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-158541v4/shard-bmg-6/igt@kms_hdr@invalid-hdr.html" moz-do-not-sen=
d=3D"true">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1503" moz-do-not-send=3D"true">Intel XE#1503</a>)</li>
          </ul>
        </li>
      </ul>
      <h2>Build changes</h2>
      <ul>
        <li>Linux: xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b
          -&gt; xe-pw-158541v4</li>
      </ul>
      <p>IGT_8663: aca02d1cc9804e5f1868b0ebfba6426e2d1244fc @
        <a class=3D"moz-txt-link-freetext" href=3D"https://gitlab.freedeskt=
op.org/drm/igt-gpu-tools.git">https://gitlab.freedesktop.org/drm/igt-gpu-to=
ols.git</a><br>
        xe-4220-3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b:
        3adb3f4aa5a8563ee9c1f6e137827b740e3ab40b<br>
        xe-pw-158541v4: 158541v4</p>
    </blockquote>
  </body>
</html>

--------------sitDL0HfEk8dg1DEDhBUxJXK--
