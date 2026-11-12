Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA21D606B3B5
	for <intel-xe@archiver.kernel.org>; Thu, 12 Nov 2026 08:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=kwYjvAjH
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ABA210FCC7;
	Thu, 12 Nov 2026 08:36:25 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E00910FCC7
 for <intel-xe@lists.freedesktop.org>; Thu, 12 Nov 2026 08:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794472579; x=1826008579;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yoy9XUgx9FuMQ4CnfYX2TU2c2Glu2Jbmbm83sWwO9CM=;
 b=kwYjvAjHDzRtjEscnD0a3hOkhCSXI/PMNamQFBIMAynsI9J+sQ7H9V/V
 0lFxg7WQGPYbNir5cixQGx6KuViBIvR1hgx85RM21QjQGdoCgER389ieE
 5XDIUcKe25TXF0sc23b5LDNddJx3XY8RBSrdkPbuZi7yRswtML0uM1b7p
 3cEoSRjiWE1hmw3+UDkBex1s3ewParSt1bnsZqJWLV6zRHJBr56uJ7mDN
 6alT1aRYvCs0djVBPBReL7D4jJQlclW8O9JPi4aTFE1G3PQtjXtDSq6C4
 bfQsq1Xy/qMHkTMUNE/mUL+A8ex/hUURQkRqD5XMuzKkLe5XHSzRLjmJN Q==;
X-CSE-ConnectionGUID: 3daFZIwlTrqdwJBAqHSuxA==
X-CSE-MsgGUID: 76HBy7xqR5CXlkxhFEqCFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11963"; a="3146306"
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="3146306"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 00:36:18 -0800
X-CSE-ConnectionGUID: Cen4S8C+RvSZUe1ojkerPA==
X-CSE-MsgGUID: 0yXKpgaHS/2wwNk3Pk607A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,209,1787036400"; 
   d="scan'208";a="8919956"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2026 00:36:17 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 00:36:15 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 12 Nov 2026 00:36:15 -0800
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.30) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 12 Nov 2026 00:36:15 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lBYXTOGIBovUiMXWHJPYubU/ry/Uj1oARIVHMFf5bdmF+PQ+irf/1USpBADeCTaguGaYOd5cMBGLznDPk8uSSLxqVDCy93fYczToCPBxyqh/sgh1HPXOO61JbEgAiZIWmURhklDN4Pdck67YcNruosRp8TSc8PYin9zVxMZaSfODaoVDEASd+SFyJC9gJYO/sI0QQVpk7VT/rdf/uEajim3VFFH+L8jSeUgImh+njoz+Gw4NHu9+ozi3r1QsC4B+/HbYgqkZV7pBI/tH+RLBgEEfxG04CvOHwqI+QAzecnNJHbFdBmAr7iv/7Zx6BmzTHmVgfdVTVZ+6p+RZpiX+/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=szqfFKW/B5qdBRcIBm9/uA49wflqwVvjtF9zNrwP2Ho=;
 b=QZsiw+Ya+KkNqz5iKbWT5WDVj0zX+rUXSs3h48DaQ4oOoxdMEv6ZxUnuvIZ1239ur52K30vBNb4nIxlwqoazIg/EOZl/Mef+80CtesZ2iB8TwALNx+kM/hJJrai0pNgckw61hERU+WWcUtr1es2jGuNlvy3nucZs3VsOQLFL8U7cFWF6ASYL9Xd2xVr5lte1KeR2qN7dF9bvyoU87WjVe7soRMeIA6/M/qH3i9xC+a3vVcp07F56/d77uy3PqFOlne8F1VFiavRrrZdwBJBf8xoRrJse5cYEODNJJxy12R8dCc6ggMnQhmFE9gVKKx/d7LJsGz8cgnPTOjVc9FiIQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MN6PR11MB8196.namprd11.prod.outlook.com (2603:10b6:208:47b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.9; Thu, 12 Nov
 2026 08:36:10 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0615.009; Thu, 12 Nov 2026
 08:36:10 +0000
Message-ID: <bd8d9453-f93d-49b1-9180-5105f5f2ab40@intel.com>
Date: Thu, 12 Nov 2026 14:06:01 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/ras: Remove unnecessary SIGID logging
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Nilawar, Badal" <badal.nilawar@intel.com>, "Jadav, Raag"
 <raag.jadav@intel.com>, "aravind.iddamsetty@linux.intel.com"
 <aravind.iddamsetty@linux.intel.com>, "Gupta, Anshuman"
 <anshuman.gupta@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>
References: <20261104090701.1748619-2-riana.tauro@intel.com>
 <avNNWgTo_tNr94Ew@intel.com> <61f1242b-c1f0-451e-8e64-8e5d93cd9efc@intel.com>
 <dcbf50b81bf7accb493bed18ed79ce9b9f9b5771.camel@intel.com>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <dcbf50b81bf7accb493bed18ed79ce9b9f9b5771.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0270.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:21d::17) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MN6PR11MB8196:EE_
X-MS-Office365-Filtering-Correlation-Id: e8318b04-e27b-41f7-1860-08df4098006a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|23010399003|376014|18002099003|22082099003|261009223027099003|4143699003|261021121427099003|11063799006|261102123227099003|261028144727099003|56012099006|261022105027099003|261026140227099003|261022075727099003|10067099003|261021123027099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: c84/467J+8SLUXXFGyTxek0BzMNsEkWfGIk1pSZfAhpWGGvO2cRmD83aQhj3BeWvVvM3ZMTPZ/7rXocbj0xZoGa50rYhfZP9+tNCOWgfqlZG2urPmdnth3auJhgA/Vciqx5gXZnyKkg5CNf1GQVVRTiSYKCDdMQFlFPPTEGHiLhC7/7Hnv2RSEhgnLD6E05iwx9E1dMvLkryfQiViKxfb+vb5AXYNX21+JQ9SKkMLW4Om5IYqmEMihZqCb5cpe+ODgbJLvyhig7w+qRXF9ceSf6mO5fIhh0mN5hsfhY5Puhda8XAMahJ6p13SbbQMToMmQIMrOqvBGhm2XUJrFKbS5pNbYMuYnHKbPsvZr7gMxt8Y5DbhqP6hnExYCoWrYEVEjwiMAzKmav34pxLNpB939dpLuB424ZnNVZRQhD5Jjn8Grzj3Ft7b/e3Z/Ij5sDzolN9tpbIJRkx/zGRGSXWcLN5e0My6EE8DcC76O00rZGMkTbA4OAJEhHqHSmufPJXl0DLv7YI8Ho3s0PZpv6RfDvetrRi27vHf1bBNc6aoNhWDGnk77eLuHzmLWzRDUN/8GO+GAsh/aqMZlgJlgcY/d5b8vhjhsleLd841HugxpNac9QHF4ACrTkKa1AKAq00
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(23010399003)(376014)(18002099003)(22082099003)(261009223027099003)(4143699003)(261021121427099003)(11063799006)(261102123227099003)(261028144727099003)(56012099006)(261022105027099003)(261026140227099003)(261022075727099003)(10067099003)(261021123027099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QlhyVzlEaVVTN1hZaEsza2h3Mm5QNkE4eDRjc0U2MUZNOWlGSUN6L2xoanVj?=
 =?utf-8?B?NVlKdGJqRElUb2h3QUNwYzVyMjdjb1dZZzhpa1JTYWducmt3L01oR1Zob3pE?=
 =?utf-8?B?Q0s5Y0lzYjJjdUtrMGpzMURtTUxoMDBmK0x0bWpaQ1ladWJOcjNZRzVRZnFB?=
 =?utf-8?B?bjBDcGxrd3czbFFGNGRYR2I0RkVrLy8ya01ySjY0eU5RdVZQNjFGNVlYYmxu?=
 =?utf-8?B?VjM5eW0wLzJXZUl0cnNOMXVnVk5CVk1yWnJFMVZSVk5meFpPSlVGMGl2NThK?=
 =?utf-8?B?Tm14eW1MaUZZejFvVHpua0lYWU9TZjlldjlTRnRscEE3TjZob1pDVkYydEpR?=
 =?utf-8?B?cmdRSzg5enNOc0dySmlnaldOT1VhbnlNTDlJUUxyUzFFZmI4OEpzTEt3SEpz?=
 =?utf-8?B?Nm5zR1RYOXZsZUJ3QjFFRHZpc3h1bk5iZUJFdUJjcExzOUtxOFYyLzlRejBO?=
 =?utf-8?B?ZkNJN0ltLzJmamRicmhYNDdqNkljODl4VXBTbkVIMkl2MmhUc0FhSW5vSFZa?=
 =?utf-8?B?UGV2YXJLSmhBRzcyN3FVQ3ZuZEdneDNSUTNtamtPR2xST2NKdDJLTU44WEJj?=
 =?utf-8?B?cFpwM3J1emwvOXl3T01UM05vdVQxOEZ1YUVZNVROR0JQVG55YnNIUnowWG9n?=
 =?utf-8?B?ejJKY2lXRjJ6c3pkTUhIN21mOXdxeXVybXYzNkR5a0x5TTBBdE1QRm5yRlc0?=
 =?utf-8?B?V0lLRXZ4NGtRVkc2UVlnZy9oV1Y2MmhBRWpKKzhwSkxHSHFGbUNuVTVUQ2Jj?=
 =?utf-8?B?MG11MFdqekNUd0cwS1pwNGdicDJSVTRKRHlDa3N3WG9uUTVISUpuUDJvK2xx?=
 =?utf-8?B?ZG1mVk9pK2dnK2E2SVYzNlNkY2xYR1phcXMxTzgwZkVQekt0L2diVUlZWjVj?=
 =?utf-8?B?ckswTllQUzJVWGQ3UTJQZ1pWQ3NUM2NXeHdOU2ZVYzlqNGM2KzBaem92cm9j?=
 =?utf-8?B?bytUeVgydjRzNXFlcVJZbnFkamxVRFlGb0NLVWR6dHVuekFEYW5sRjlpcXMw?=
 =?utf-8?B?UGxlN1BDTDRBSGt0TVo4NlhYRVBWSnVSMWFXMzFaWnFFVGltMkI1MkcwdjNi?=
 =?utf-8?B?bURET3pLYWpqQWFvWkhWWHdUYTQ3YzF4Z29rcUhoc1NFRmVXYnhmdVVqU3VF?=
 =?utf-8?B?VlRaUkpnWktuSlNPdUFyZG9JZG5VWnk0bW8xN0JUQ1lLZmFjZTR0cStyekdu?=
 =?utf-8?B?aVdVTGZuWDhkNTRSQVpJc0ozRTFJcnR3bEg3ZG1yNjNlSTVRUjQvVUVGWWZu?=
 =?utf-8?B?MXFwVlVEQW1lSDN3RVZNL2xEM2RwU0xXUmNBTE95U0E3Tm1FV3EvdVc0UzZY?=
 =?utf-8?B?c3RGc0xxdWttaXFGcHFjTmV6cFpIODUxanhJUHpFeHNXcVhFOWtwWUtPSnNF?=
 =?utf-8?B?RTVJaEVGQ0VhUytQb2xqSENkekNuL0pydGFTalZUMG1BZTBySjFITUNrRHFw?=
 =?utf-8?B?eVF5NFNKaEt5Y3pPdlU0WmpHOXAwYTZCaFoycWd2cnNaOEZEcmsvcWhvMnZW?=
 =?utf-8?B?Q3IvcTk5eDZodFlWTk41M1c0ai9PUTJOREJmMExSSmJPaVBkWHBuNlc5Ri9Y?=
 =?utf-8?B?WnhuVnpPUGNZbmZ0Y3NtNnJvL09wWlM4YlZ5ZDZSTWpQSFEvdHMrQW94eGZv?=
 =?utf-8?B?ZXV0ZkRMdDJFYU4xQ2JhSnpwaUpYOUhQU1U1bnJMNFQwWlNCNkZwWGxIV3VK?=
 =?utf-8?B?OVFUQlgzcE55bW1OYzZscW82cjR3czJzcnNEV2RsTi9Ld2NmNmJYVHFXZlF5?=
 =?utf-8?B?SzdNaVBOc0s3UXVZK3IxejVnNzlPczFqMm1YaGFpYVVoTFR5UnpjSUYxM2Rm?=
 =?utf-8?B?VGVOSHJDQWE4dE9xRDVralo2UzV0dUxJVGZYQitidVNENDZBczZYT0FCUVNu?=
 =?utf-8?B?M3orbDdvR2ZESGtoMS8reDVmaVE3WjlkUU1nSEMyWUxOeFIyYmZST1U2azJK?=
 =?utf-8?B?QXltQ3pKcUxHd1JRb25LWTMrSEZlbFI2L3pLenNVd1B2dTRDNEJlOVFNcjFP?=
 =?utf-8?B?ekNDZmRjM0tST0NtV2t5V2c3WVM3cDBwWWc1TUwwQ21wTHNxZ0Jtd3lYRENB?=
 =?utf-8?B?cmRHakJORmFpMWhQSjlqSXFjNU9nWW81MHNoZ3ZtZ1dCd1FxWDZ3ZkhENDBt?=
 =?utf-8?B?dnZweWJVQzJzR2lpSkxZYk00azBJdHNOaUhTakFzZjZ6OTNrbnBwV0FsbTBo?=
 =?utf-8?B?S2xnYjNZYjdOVzhrTFRYOVM3RVR3Y0crcXN4ZlNLbTBVWWxTV2pBRmdiS3JG?=
 =?utf-8?B?QnAyT1RMWWVnWHVNS3I5TjVNc296OGRqbVUxOTVJZmRjdVRkSm1BWGtYUVU4?=
 =?utf-8?B?dWZ6ZW5vL1dMeUxaRkVGeHRZR2pSakRmQVd0MHJXbExmclE1WXBWZz09?=
X-Exchange-RoutingPolicyChecked: I3EbqA9Styg5nU0Wza0u+hJH31PaywGqQZPKawxD/960211Eeip8IRoVV4q91uBzvp2XpNYEKiRE4ctJJIT2vIXZ1OKS0jwmMvUjs6ssfm1x/5hix8I5MeaPpTU+wOa814CfYZXws4L64OGFfkoK3s+pF9XuJMOgkk93CdZmUZXE1N+WVVDIWcgpVx6ylNmgxfhUJMpucQ/rMlRA6+z6zzd2Jhf01HZ/MR6McDJbLZzY0PTIKaeh2G2AktWNWvF/OVep9ofDZ0tQEHG776TEG4gne/TstQ27F8QwdcNcsu8Fg8FcjW8ugWhA95Gjb7G3y+rEVikJcr5jRom4rk2E3Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: e8318b04-e27b-41f7-1860-08df4098006a
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2026 08:36:10.1311 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F0cOd/lZDy5HWrOnwpdw34tk9iqdba1eGEIp4HfvoZBsQsUaXHx8gcWujirmpVBoCGflkwgXrYBQ67LBIiN9/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8196
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


On 11-11-2026 21:14, Vivi, Rodrigo wrote:
> On Wed, 2026-11-11 at 09:50 +0530, Tauro, Riana wrote:
>> On 10-11-2026 22:29, Rodrigo Vivi wrote:
>>> On Wed, Nov 04, 2026 at 02:37:02PM +0530, Riana Tauro wrote:
>>>> Remove SIGID logging for all Double-bit ecc memory errors
>>> Please take a look to the commit message of my duplicated attempt:
>>> https://lore.kernel.org/intel-xe/20261109161733.3769906-2-rodrigo.vivi@intel.com/
>>>
>>> I believe we could improve this message a bit here.
>> Sure will add more details in commit message
> and please remove the 'no functional changes' below as well.
Sure.
>
>>>> No functional changes.
>>> In a way I'd say we do have some functional changes.
>>>
>>>
>>>> Fixes: 12b427cf8bb0 ("drm/xe/xe_ras: Handle page offline requests
>>>> for device memory ecc errors")
>>>> Fixes: 6d8ad0217f9d ("drm/xe/xe_ras: Add support to query page
>>>> offline queue and list")
>>>> Suggested-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
>>>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/xe/xe_ras.c | 57 ++++++++++++++----------------
>>>> -------
>>>>    1 file changed, 21 insertions(+), 36 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/xe/xe_ras.c
>>>> b/drivers/gpu/drm/xe/xe_ras.c
>>>> index 2c01c183d02b..46e2a40eee95 100644
>>>> --- a/drivers/gpu/drm/xe/xe_ras.c
>>>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>>>> @@ -269,32 +269,29 @@ static int send_page_offline_cmd(struct
>>>> xe_device *xe, u64 page_address,
>>>>    	request.action = action;
>>>>    
>>>>    	if (action == XE_RAS_PAGE_ACTION_OFFLINE)
>>>> -		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting
>>>> firmware to offline page 0x%llx\n",
>>>> -			   page_address);
>>>> +		xe_info(xe, "Requesting firmware to offline page
>>>> 0x%llx\n", page_address);
>>>>    	else
>>>> -		xe_log_err(xe, DEVICE_MEMORY, 0, "Requesting
>>>> firmware to remove page 0x%llx from queue\n",
>>>> -			   page_address);
>>>> +		xe_info(xe, "Requesting firmware to remove page
>>>> 0x%llx from queue\n", page_address);
>>> should we use info or dbg here?!
>> The only distinction between the same address causing the error is
>> this
>> log. For a duplicate address, we ask the firmware
>> to remove from the queue. It would be useful if these are seen in the
>> logs without having to enable debug logs.
> Fair enough.
>
>>
>>
>>>>    
>>>>    	xe_sysctrl_create_command(&command,
>>>> XE_SYSCTRL_GROUP_GFSP, XE_SYSCTRL_CMD_PAGE_OFFLINE,
>>>>    				  &request, sizeof(request),
>>>> &response, sizeof(response));
>>>>    
>>>>    	ret = xe_sysctrl_send_command(&xe->sc, &command, &rlen);
>>>>    	if (ret) {
>>>> -		xe_log_err(xe, SYSCTRL, ret, "failed to send
>>>> page offline command\n");
>>>> +		xe_err(xe, "sysctrl: failed to send page offline
>>>> command %d\n", ret);
>>> This err is an error pointer and should be handled differently.
>>>
>>> But, anyway...
>>> I believe we should only remove the 202 (DEVICE_MEMORY) entries and
>>> not the fw
>>> related ones (105 - SYSCTRL).
>> Since this is the only function in the file adding sigids for sysctrl
>> errors and there is ongoing discussion to only
>> have sysctrl layer logs and not outer layer. Removed it for now, this
>> can be added if needed
>> with the changes to the entire file.
> Right, I had missed that xe_sysctrl_send_command already logs the 105
> SIGID. So it looks safe to remove these as well.
>
> I'm wonder if we should split in 2 patches? but up to you. At least
> make sure the commit msg explains it a bit.

Yeah sure. Will split it. There are two fixes tag. Would be better if 
there are
two separate patches.

Thanks
Riana

>
>> Thanks
>> Riana
>>
>>
>>>>    		return ret;
>>>>    	}
>>>>    
>>>>    	if (rlen != sizeof(response)) {
>>>> -		xe_log_err(xe, SYSCTRL, -EINVAL,
>>>> -			   "unexpected page offline response
>>>> length %zu (expected %zu)\n",
>>>> -			   rlen, sizeof(response));
>>>> +		xe_err(xe, "sysctrl: unexpected page offline
>>>> response length %zu (expected %zu)\n",
>>>> +		       rlen, sizeof(response));
>>>>    		return -EINVAL;
>>>>    	}
>>>>    
>>>>    	ret = ras_status_to_errno(response.status);
>>>>    	if (ret) {
>>>> -		xe_log_err(xe, SYSCTRL, ret, "page offline
>>>> command failed with status %u\n",
>>>> -			   response.status);
>>>> +		xe_err(xe, "sysctrl: page offline command failed
>>>> with status %#x\n",
>>>> +		       response.status);
>>>>    		return ret;
>>>>    	}
>>>>    
>>>> @@ -318,15 +315,14 @@ static int handle_page_offline(struct
>>>> xe_device *xe, u64 page_address, bool noti
>>>>    	int ret;
>>>>    
>>>>    	if (!IS_ALIGNED(page_address, XE_PAGE_SIZE)) {
>>>> -		xe_log_err(xe, SYSCTRL, -EINVAL, "Unaligned
>>>> physical page address: 0x%llx\n",
>>>> -			   page_address);
>>>> +		xe_err(xe, "Unaligned physical page address:
>>>> 0x%llx\n", page_address);
>>>>    		return -EINVAL;
>>>>    	}
>>>>    
>>>>    	/* User policy set to disable page offlining */
>>>>    	if (xe_ras_get_disable_vram_page_offline(xe)) {
>>>>    		action = XE_RAS_PAGE_ACTION_REMOVE;
>>>> -		xe_log_err(xe, DEVICE_MEMORY, -EOPNOTSUPP, "User
>>>> policy set to disable page offlining\n");
>>>> +		xe_info(xe, "User policy set to disable page
>>>> offlining\n");
>>>>    		goto notify;
>>>>    	}
>>>>    
>>>> @@ -346,33 +342,24 @@ static int handle_page_offline(struct
>>>> xe_device *xe, u64 page_address, bool noti
>>>>    	switch (ret) {
>>>>    	case 0:
>>>>    		action = XE_RAS_PAGE_ACTION_REMOVE;
>>>> -		xe_log_err(xe, DEVICE_MEMORY, ret,
>>>> -			   "Poison detected at physical address
>>>> 0x%llx, page soft-offlined\n",
>>>> -			   page_address);
>>>>    		break;
>>>>    	case -EIO:
>>>> -		xe_log_err(xe, DEVICE_MEMORY, ret,
>>>> -			   "Poison detected at physical address
>>>> 0x%llx, page belongs to critical BO and cannot be soft-
>>>> offlined\n",
>>>> -			   page_address);
>>>> +		xe_err(xe, "Physical page address 0x%llx belongs
>>>> to critical BO and cannot be soft-offlined\n",
>>>> +		       page_address);
>>>>    		return ret;
>>>>    	case -EEXIST:
>>>>    		if (xa_load(&state->offlined_pages, page_address
>>>>>> XE_PTE_SHIFT))
>>>>    			action = XE_RAS_PAGE_ACTION_REMOVE;
>>>>    		else
>>>>    			action = XE_RAS_PAGE_ACTION_OFFLINE;
>>>> -
>>>> -		xe_log_err(xe, DEVICE_MEMORY, ret,
>>>> -			   "Double-bit ECC error detected at
>>>> physical address 0x%llx, page soft-offlined\n",
>>>> -			   page_address);
>>>>    		break;
>>>>    	case -ENOMEM:
>>>> -		xe_log_err(xe, DEVICE_MEMORY, ret,
>>>> -			   "Poison detected at physical address
>>>> 0x%llx, failed to soft-offline\n",
>>>> -			   page_address);
>>>> +		xe_err(xe, "Failed to soft-offline page at
>>>> physical address 0x%llx\n",
>>>> +		       page_address);
>>>>    		return ret;
>>>>    	default:
>>>> -		xe_log_err(xe, DEVICE_MEMORY, ret, "Failed to
>>>> handle address fault at physical address 0x%llx\n",
>>>> -			   page_address);
>>>> +		xe_err(xe, "Failed to handle address fault at
>>>> physical address 0x%llx\n",
>>>> +		       page_address);
>>>>    		return 0;
>>>>    	}
>>>>    
>>>> @@ -433,15 +420,14 @@ static void process_offline_pages(struct
>>>> xe_device *xe, u32 cmd, void *req, size
>>>>    
>>>>    		ret = xe_sysctrl_send_command(&xe->sc, &command,
>>>> &rlen);
>>>>    		if (ret) {
>>>> -			xe_log_err(xe, SYSCTRL, ret, "failed to
>>>> get page offline data, cmd=%#x\n",
>>>> -				   cmd);
>>>> +			xe_err(xe, "sysctrl: failed to get page
>>>> offline data for cmd %#x, ret %d\n",
>>>> +			       cmd, ret);
>>>>    			return;
>>>>    		}
>>>>    
>>>>    		if (rlen != resp_size) {
>>>> -			xe_log_err(xe, SYSCTRL, -EINVAL,
>>>> -				   "unexpected page offline
>>>> response length %zu (expected %zu), cmd=%#x\n",
>>>> -				   rlen, resp_size, cmd);
>>>> +			xe_err(xe, "sysctrl: unexpected page
>>>> offline response length %zu (expected %zu) for cmd %#x\n",
>>>> +			       rlen, resp_size, cmd);
>>>>    			return;
>>>>    		}
>>>>    
>>>> @@ -471,9 +457,8 @@ static void process_offline_pages(struct
>>>> xe_device *xe, u32 cmd, void *req, size
>>>>    			total_pages = common->total_pages;
>>>>    
>>>>    		if (count > total_pages) {
>>>> -			xe_log_err(xe, SYSCTRL, -EINVAL,
>>>> -				   "Pages returned exceed total
>>>> pages %u, returned %u, cmd=%#x\n",
>>>> -				   total_pages, count, cmd);
>>>> +			xe_err(xe, "Pages returned exceed total
>>>> pages %u, returned %u, cmd=%#x\n",
>>>> +			       total_pages, count, cmd);
>>>>    			return;
>>>>    		}
>>>>    	} while (common->additional_data);
>>>> -- 
>>>> 2.47.1
>>>>
