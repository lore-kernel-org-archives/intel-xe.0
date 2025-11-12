Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75BE2CD13DD
	for <intel-xe@archiver.kernel.org>; Wed, 12 Nov 2025 16:26:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2332610E04F;
	Wed, 12 Nov 2025 16:26:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="C5up3oon";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD2E10E04F
 for <intel-xe@lists.freedesktop.org>; Wed, 12 Nov 2025 16:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762964788; x=1794500788;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=xZ1PjW7W61+0l84uLNDX19cNbVnIpqaqs9seP+Bmq6k=;
 b=C5up3oon8ADuoRqDaUHdJRR+cMAs/AhJP+rbccwkc9lLGOHcx6hspgrM
 W2seIsPrJsLIdhNT+UsNBorycnu/1e1SJMydqhDGbQ9pQmhxsqNwrWvgS
 ha14rNHHsx5ipd/7nicr6y9Wj4dnLGgpXu3yNsUUc1uDyvfrZQUv9COr3
 1zfCxPrYlnst+EQdbNuSkG69tlaRB1evfHWQ0za/IY/uWh/9VvBdmB1XN
 FSAlj7/6h7KWOlQoyinhLZt1AjsTdbbQWv4GoPr9tzqPcSESBBzrGw44U
 hJaZMlA5xmRT8AohewL1AgkwUci44C8ITWNjL4+LZnQRe6Nsnahq6fjMF w==;
X-CSE-ConnectionGUID: +DE+E/CaS4+4C+mj5/7D4Q==
X-CSE-MsgGUID: 4hMUCWhBR0C5vNkoEqiOCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="82662717"
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="82662717"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 08:26:28 -0800
X-CSE-ConnectionGUID: tTxUPML7TAyn0CXU/O2spA==
X-CSE-MsgGUID: SKD8u+ewTqqk312CBWzTzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,299,1754982000"; d="scan'208";a="212649937"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2025 08:26:28 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 08:26:27 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 12 Nov 2025 08:26:27 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.18) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 12 Nov 2025 08:26:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GsoctiFlpTNL8IOU6dCguBxvTQj9RxNENSumNsLCBke+0/z6d9MgU5VCDuH+jxFLiXVDlDMezReXfBqw+kfybaLg0Pem7AEq98CYKJBvZQ5Get6gvTdKz2JeYlgE6+qEdUuh5H+SeLtyoqGtuzPgjrCh274g48buph8ZHSFtUugqFT1zMgd26VxAnV9P0ao+Cfv6isJmikNZz2Jx2rHisGwbKiM967H570VXy+3sueUCGoofhkiiYy2iGkN5DYwx0JIy+Zgcj0dWBnM2x3vHhceKfO4c+KcLCBeREXsfwJ9R8PXiM2H1Ulojm2gc5Rx5XZ26B046EaeZ5vMMMTTsHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xZ1PjW7W61+0l84uLNDX19cNbVnIpqaqs9seP+Bmq6k=;
 b=CWW2GBCLeQnVwb+MU4YpOa2y3dNZHzYY5tqj/RQIc4UypwHBcxiIiVGmQzLrazdnvlokBfvMMKehO73zhGKYtClfEG0+XdNU17kUe6I7vteJRsbwSXfajTVVuwZ5yzVxhU0213WW6fbxi0KLOIi/p5+U4gZ+pCwmLHHqW/PslCILcv0wc6xm1GPyR4YgzaLuR0PptGafmnivNVowRxNiWNVSIWtTVCp0aWF9NWMIN7MWYYSs7i8075MmrzTcK7oeTCQSyHsTRezvJijDdalezLJ4sZc1NxK1CpuD5C4r93JMvOTpxid2INtgcXwj7/CiCRkPRMfr+cQrC8f8+l/gdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH3PPF73E424DB7.namprd11.prod.outlook.com (2603:10b6:518:1::d2e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 16:26:25 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::b23b:735f:b015:26ad%5]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 16:26:24 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Auld, Matthew" <matthew.auld@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
Subject: RE: [PATCH] drm/xe: Prevent BIT() overflow when handling invalid
 prefetch region
Thread-Topic: [PATCH] drm/xe: Prevent BIT() overflow when handling invalid
 prefetch region
Thread-Index: AQHcU2rnUodUMGxal0K9WDvQ14sw1bTu1iYAgABh6RA=
Date: Wed, 12 Nov 2025 16:26:24 +0000
Message-ID: <DM4PR11MB5456E2B0A9E44FE1603FB117EACCA@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20251112002331.1897395-2-shuicheng.lin@intel.com>
 <cc8c7cd2-8c92-422d-b6ca-ec892478fc61@intel.com>
In-Reply-To: <cc8c7cd2-8c92-422d-b6ca-ec892478fc61@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH3PPF73E424DB7:EE_
x-ms-office365-filtering-correlation-id: d5020d96-a4a6-4fe8-b0d8-08de220838f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?eVNYTVhMK1ZIWlpqdmdPREhBZVV0ekFwVXFGUGQ4cWlDbjU4RnBvdFVTemlC?=
 =?utf-8?B?RDJMOXFER2J0cktLeWdZSUJrNjV2cUdhMDBkZnNnMCs5M1JVOTIrQmgxdWdP?=
 =?utf-8?B?MElJVngrYi8zZXdFdXBESXpJS045RzQ1clU5aWVteVBaa1ovMW93WFU3WGUx?=
 =?utf-8?B?T1l4QVpvMnJqeC8rZmtzd21yd3lFMkFucVJMdE00Y2JHZ2FYQlBWWGh5NVJB?=
 =?utf-8?B?eXNWNzFMWHJiYjUvSVhQbHpkd3NNZkJtUnJVeXhtb3NIcGNXRjBaNzRrTG02?=
 =?utf-8?B?ZWpyb3BvRFdoeENHVXJtV3g3L2RYRFRaRUZmaytqUExmeEU4cEV1aDRzYkc5?=
 =?utf-8?B?N09OWWgvODNSMXNva1hodURWZDYvNWdGbWljUzErb3R4MmNISE16RmVhY2dN?=
 =?utf-8?B?SFdSazFMeWJHT3dwRTAxaUY3RU5iQlJTdTcrWFN3N3lxNXFFclluT2VwcFNn?=
 =?utf-8?B?YmRERysxYVRGYndSanFYbTRDaGVzSjRYVVFXTFJ3eTVLTlRqVVF0TE5nQW9M?=
 =?utf-8?B?ZFBrVmpIZHdMS0dzK0YxY2JjSWZVRjdoWW5ZRlMzcjlGOHlXVjNHaGRseTN5?=
 =?utf-8?B?MTk2UU1tSVJYa3BrYTdWdGludjExYW1mQ3pONDEyZW5CQ2EyNzNaRXhmd25C?=
 =?utf-8?B?eUFjNXNGelhKL0NuWUswVjFXc0NteWNweG9JdXRnTmlkMnlyM2dIdzZpL1h5?=
 =?utf-8?B?TUtXOWVoYkZIOVFUck9TQ3VWL3Uvamd3ODRBREVCU3hVN3pIZk9yZVc5UEdS?=
 =?utf-8?B?d01YdW45aHQyQkRyNWJMemdzWFJ0YUZsZjVuYnlKNVh6eUFUVmxvYVpUdW5a?=
 =?utf-8?B?Wktra0FLSk5OVFFyUTdScExpSHkwbXg5Rmo0U05QZ1BRcEMzNitDenlpSjJG?=
 =?utf-8?B?UjNYaStqakRrMXlyZXBEMGkyWmk5OWRlOEhlSE9yY0xCdTlPVWFienBGemcw?=
 =?utf-8?B?aE1lSFJYYjdvL29WZXJ4MGJkT2RZeHBaUW9uUElGSTBSU1FaMWFIMmoxc252?=
 =?utf-8?B?N0pCUUIrL2NjSTArMit3dEMycWhmT2lBelFUdDlWV1ExRzU5ZFIzU2Z1cVhX?=
 =?utf-8?B?bGsveW9JUkx0UmRQMmx4VER1SDU4RlF0VjdkSlZXVlIvMGNkOUltb3pRWHkz?=
 =?utf-8?B?bm1ad1F4ZVBlUy9yMERvYzM3a25Sc2s3U1ZKa20yc01XRVVKU2QrbmtoUlc2?=
 =?utf-8?B?TU5rdUVoblJhbTR6ZEpsRU0zK2FubUZrNmVLVVJaY1c4ZEZ3dFFGSGR3YlZq?=
 =?utf-8?B?UlNheEllaGNhS2IzeDEyUGsrR1pxbmliOGhma2t5ZjlCdmZFODl2SWhSSkdQ?=
 =?utf-8?B?aVJOeUFLUDIyWERMZk01ZFpGOFVDUkJBUmpVTlJSS1N0bkZXYXJFTHhPelox?=
 =?utf-8?B?bnU1bThMa2g2SFd0YW5yemZjN0gydk1kU2RtSWpnRnNJMEVFOFVJTmJLQUN4?=
 =?utf-8?B?Q0hjMC9lZm1laUs5SWpZUytZWWNyNkxZUGc5dCsxRDhqTlYzU3RDd3RIV2dY?=
 =?utf-8?B?RXhEcEp4L0REaTZjUEdydGdGcHFackpJL3d6WHc4NkNKWktSMHVzem9jVU1V?=
 =?utf-8?B?L0RpSjJFOWREcmpUbzdLdlpTaGlqL2ZGM04zeHFYcmFBWjhGZWZpa0ltYVRH?=
 =?utf-8?B?UUhVc1F0UGhYUTE4YXpmYVBpRzlWTkxkcHFyK29BaGJySjBqNTAweWtwUmRY?=
 =?utf-8?B?SEYvemJ1TmJ0R3ZVNStackdQdWNXdzZLaTg5NHRFdThPaGM4U2hEQytwRlB2?=
 =?utf-8?B?cTMyWWoyYlZCd2tjRWdiSldlU1A4NCtwVTBYa2ZtREVKS2p4VDN5OW1zTDlT?=
 =?utf-8?B?OFppTlRTL0RjZFZncC9PeUNkZjd0WlY4WDNhZUMwaGkvVEVkOVV6VGlxM3hX?=
 =?utf-8?B?RmR1cFpWOFJWMmxBMGdaTDhEc2dwK0xYWktXNlRSTnZPbjZPOTdSY3pyVkV0?=
 =?utf-8?B?QmxtNTFFVllQb0dyaXo1RStSTDcyTWtVOHFTc3J0bForcThkTEpvaFREaXpM?=
 =?utf-8?B?QVhOTmxtQlBRPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHRmM2o0S3R2YjFsVzBGMVlPNTk4Q0F0Lzh6ZHQ3cG4rY3hqQiszYzY0eWlS?=
 =?utf-8?B?SEZYdElTWXRlQ0NMOXpBSmg0b0hsTXp6QW1FOGxVK3FyZHIza1FmRG5OS3k1?=
 =?utf-8?B?T3ZlbnRMU3FZWkNJTG9XTjA2OGRjcmNIQytoSjZJQ0NoR1FTb29nQWxhRUI5?=
 =?utf-8?B?R1BnUVBNWFlqNGovV1pySEt0NUJaNzk0aks5dlloNmhuOUtyc1JlYjA4clRt?=
 =?utf-8?B?NjFsQnhESTJxK2I0VHlubVRaZCtqVWVleFRaZUt1NUVMUDU4MjlqY3hsOEsy?=
 =?utf-8?B?S1JzNVU2aHNqMU9LNW1wZHF1eE5EU3JWVWpmTDlRUUxKTzhqUFZ2QXNvQkJi?=
 =?utf-8?B?dmIwYlZaZGRrNlQ5SkJtWE1lYlplZzJTbStNaUNnOU5hTDBJTHc0L2pmWm9F?=
 =?utf-8?B?STc5WnExMFhBM3JjUHQvaDJld3ZHQUZYMjRGRkNLejBmWXp2Y2U5S0pPbzRT?=
 =?utf-8?B?NjV2d2hSTXkvS3E4MFYwcHZtNGgxa1YwaDJXang5V0VUUEt6QUFjbldkL0Vt?=
 =?utf-8?B?cDFoOXhwS2YrMFpEZFJqUWpXRWt1ZXF0UFBZYmcrdllZYmw5V1o4Q3VDaTFp?=
 =?utf-8?B?RlhpSjI5THBZR3NTWTBpUzNaUk9WdHN4TVorZ1l2OG9WcWtCdnBhWC9sTXQ2?=
 =?utf-8?B?cE05a3dkelMrZjkrQitTM1J5N210YUJOLyt1enFNUWJWZEIySWpRS2k2OURK?=
 =?utf-8?B?RVorZGVjTjZKTGcwMnNQSVY2OFpWN1M1VDdpbThYWG4rRlV5VnBtbFc4V0Np?=
 =?utf-8?B?eFVKb0tzK25FQVRROGxtNnhOTlo5WGJjNHdLRVNXakViN0JIcWhqemJGU0NY?=
 =?utf-8?B?RkhwenI4ejg0MFFhUnZsNEluMngrRHRXY2VGa3U3MThFZnJ0MHdrMHBIZVZH?=
 =?utf-8?B?REYvZTVzWG1xRFNaQkdjL2lpRCtNYUtLM21Yajh2WDViYU9jQ1VRV3pzYUlE?=
 =?utf-8?B?SXBaK2xJL0E0eHUxZHFBZXpPNkZnSFlnTVRXd0RBY3BqTElieHBIYmNkWFJh?=
 =?utf-8?B?ZHdYOStWN3VCWDN6a0FiVjNYT29aUWc1Wm5EcTQ1Q3d1YTk3YmFqN0Y3TUZE?=
 =?utf-8?B?U0VzeGdhalhrRWtLbHNUU0d2NkkrTWNkK3E3MVBKb2hNdCtZNkhNUVQyNUEy?=
 =?utf-8?B?aTdiNjc4VThZUWNLbGpaTHBjN1dkcE9ERTFGckh2Z0ZZVUVuVjdZY1BlaUFs?=
 =?utf-8?B?Uk5WZ1BUZDh6a3E0QVRUT2xwMlVnM3l4WjRGcFZaRTE0Tm93ZW8wSGNyUXFO?=
 =?utf-8?B?Q1VFemxyOWtBaUJsdkNyQUNEMzg5VVpJdkJhNWVNc09ablh0b0ZGOWJrcU52?=
 =?utf-8?B?RERWSjZVL1lXR0d0MEI4NVpoUytZRDUwTXZTUzNZTWxPSUxyQ0d1aEtadkVB?=
 =?utf-8?B?SWJBTkdiSWc3RUwwYUpBZW16cmVDNDU5L3pWM2dTS2NYSzJHZGYwWWFNRlVw?=
 =?utf-8?B?RUNxRmM1Qlo0c3hML3N1UHN1UUx0dXIyemJuN0RCdjBWQ0lpMVowMEd2WnhM?=
 =?utf-8?B?WjZ0WnVWR2lMd3pKUmw2K1NTSzBuS0FLbzl4Q0NKN01aQU1jejFGR2JXWUJV?=
 =?utf-8?B?SkNVcVdjSnpIc1dROU83Y0tKYXJuTks3M3NJelg3OTVaSVZiN3RGOUd2NWZp?=
 =?utf-8?B?K1FuMVdnbVdLdE9MY293bnBkd2UrTkNsWmhVYlRDM1BTbkxpOS9pWDl0Ylpr?=
 =?utf-8?B?bUt4S0VzcmVmVW9aOWFzTmNSNnRXZE4rc1VvdGExWW9tRFFEcC9KVlllUjBi?=
 =?utf-8?B?N0FYbVFLYWdyZ3lmSjdPTEFra2NkNmRZRmdqWUZmOEtBTTNsenZZZU1CNzMz?=
 =?utf-8?B?RzlPSExwVXlCb243Ti9IYmFJeDQ4cXkzOTNNZjNXR2NXNzcvZmhRYWx1RTZR?=
 =?utf-8?B?bjF3aGd2UTFYTWo2YjRhWUgySys3R1IwYWE0YTQxbk1JeEdIY1FyZFpaTEZQ?=
 =?utf-8?B?Uk50TitMVktCLyt4dHp1TktOMHlkNWxkd0FDVTRyM01MV1BGWENRc0Fad08v?=
 =?utf-8?B?RFB2SkJWRU1XRDU3U0I5K0x4UUJKb2F5T2FsT3FvNjM5OTg0UmZJNEtMK05t?=
 =?utf-8?B?cHRkc2tmRFN1ZE5CTENNbVA5TFVNb1V4amhjcnFrTnhYdisybkdiWnBGYWVp?=
 =?utf-8?Q?GmxmMFspAZGpArBkb6Nv8MS9O?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5020d96-a4a6-4fe8-b0d8-08de220838f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2025 16:26:24.3794 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QyXbBK7Ul+sKFTyZKHCPwTK4venxpDw4FG6m6qH886+P6TIL0NrWwKRdvmW44XBob6N2jXorknjiQ+xtLFNiCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF73E424DB7
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

T24gV2VkLCBOb3YgMTIsIDIwMjUgMjoyNCBBTSBNYXR0aGV3IEF1bGQgd3JvdGU6DQo+IE9uIDEy
LzExLzIwMjUgMDA6MjMsIFNodWljaGVuZyBMaW4gd3JvdGU6DQo+ID4gSWYgdXNlciBwcm92aWRl
cyBhIGxhcmdlIHZhbHVlIChzdWNoIGFzIDB4ODApIGZvciBwYXJhbWV0ZXINCj4gPiBwcmVmZXRj
aF9tZW1fcmVnaW9uX2luc3RhbmNlIGluIHZtX2JpbmQgaW9jdGwsIGl0IHdpbGwgY2F1c2UNCj4g
PiBCSVQocHJlZmV0Y2hfcmVnaW9uKSBvdmVyZmxvdyBhcyBiZWxvdzoNCj4gPiAiDQo+ID4gICAt
LS0tLS0tLS0tLS1bIGN1dCBoZXJlIF0tLS0tLS0tLS0tLS0NCj4gPiAgIFVCU0FOOiBzaGlmdC1v
dXQtb2YtYm91bmRzIGluIGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jOjM0MTQ6Nw0KPiA+ICAg
c2hpZnQgZXhwb25lbnQgMTI4IGlzIHRvbyBsYXJnZSBmb3IgNjQtYml0IHR5cGUgJ2xvbmcgdW5z
aWduZWQgaW50Jw0KPiA+ICAgQ1BVOiA4IFVJRDogMCBQSUQ6IDUzMTIwIENvbW06IHhlX2V4ZWNf
c3lzdGVtXyBUYWludGVkOiBHICAgICAgICBXDQo+IDYuMTguMC1yYzEtbGdjaS14ZS1rZXJuZWwr
ICMyMDAgUFJFRU1QVCh2b2x1bnRhcnkpDQo+ID4gICBUYWludGVkOiBbV109V0FSTg0KPiA+ICAg
SGFyZHdhcmUgbmFtZTogQVNVUyBTeXN0ZW0gUHJvZHVjdCBOYW1lL1BSSU1FIFo3OTAtUCBXSUZJ
LCBCSU9TDQo+IDA4MTIgMDIvMjQvMjAyMw0KPiA+ICAgQ2FsbCBUcmFjZToNCj4gPiAgICA8VEFT
Sz4NCj4gPiAgICBkdW1wX3N0YWNrX2x2bCsweGEwLzB4YzANCj4gPiAgICBkdW1wX3N0YWNrKzB4
MTAvMHgyMA0KPiA+ICAgIHVic2FuX2VwaWxvZ3VlKzB4OS8weDQwDQo+ID4gICAgX191YnNhbl9o
YW5kbGVfc2hpZnRfb3V0X29mX2JvdW5kcysweDEwZS8weDE3MA0KPiA+ICAgID8gbXV0ZXhfdW5s
b2NrKzB4MTIvMHgyMA0KPiA+ICAgIHhlX3ZtX2JpbmRfaW9jdGwuY29sZCsweDIwLzB4M2MgW3hl
XQ0KPiA+ICAgLi4uDQo+ID4gIg0KPiA+IEZpeCBpdCBieSB2YWxpZGF0aW5nIHByZWZldGNoX3Jl
Z2lvbiBiZWZvcmUgdGhlIEJJVCgpIHVzYWdlLg0KPiA+DQo+ID4gRml4ZXM6IGRkMDhlYmY2YzM1
MiAoImRybS94ZTogSW50cm9kdWNlIGEgbmV3IERSTSBkcml2ZXIgZm9yIEludGVsDQo+ID4gR1BV
cyIpDQo+IA0KPiBJIHRoaW5rIHNob3VsZCBiZToNCj4gDQo+IEZpeGVzOiBjMWJiNjlhMmU4ZTIg
KCJkcm0veGUvc3ZtOiBDb25zdWx0IG1hZHZpc2UgcHJlZmVycmVkIGxvY2F0aW9uIGluDQo+IHBy
ZWZldGNoIikNCg0KVGhlIFVCU0FOIHdhcm5pbmcgaXMgZm9yIHRoZSBCSVQoKSwgYW5kIHRoaXMg
QklUKCkgY2hlY2sgZXhpc3RzIHNpbmNlIGRkMDhlYmY2YzM1Mi4NClRoZSBjMWJiNjlhMmU4ZTIg
aXMgZm9yICJyZWdpb25fdG9fbWVtX3R5cGVbcHJlZmV0Y2hfcmVnaW9uXSIsIHdoaWNoIGlzIHRy
dWx5DQphbiBpc3N1ZSwgYnV0IG5vdCB0aGUgVUJTQU4gY29tcGxhaW4gYWJvdXQuIFNvIEkgcHJl
ZmVyIHRvIHVzZSBkZDA4ZWJmNmMzNTIuDQpXaGF0IGlzIHlvdXIgaWRlYSBhYm91dCBpdD8gVGhh
bmtzLg0KDQo+IA0KPiBBbmQgYWxzbzoNCj4gDQo+IENsb3NlczogaHR0cHM6Ly9naXRsYWIuZnJl
ZWRlc2t0b3Aub3JnL2RybS94ZS9rZXJuZWwvLS9pc3N1ZXMvNjQ3OA0KDQpMZXQgbWUgYWRkIGl0
LiBJIGRpZG4ndCBhZGQgaXQgYmVjYXVzZSBJIGNhbm5vdCBvcGVuIGl0Lg0KTWF5YmUgaXQgaXMg
ZHVlIHRvIHNvbWUgcGVybWlzc2lvbi4NCg0KPiANCj4gPiBDYzogTWF0dGhldyBBdWxkIDxtYXR0
aGV3LmF1bGRAaW50ZWwuY29tPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFNodWljaGVuZyBMaW4gPHNo
dWljaGVuZy5saW5AaW50ZWwuY29tPg0KPiANCj4gUmV2aWV3ZWQtYnk6IE1hdHRoZXcgQXVsZCA8
bWF0dGhldy5hdWxkQGludGVsLmNvbT4NCj4gDQo+IEFuIElHVCB0aGF0IHVzZXMgYSB0b28gbGFy
Z2UgcHJlZmV0Y2hfcmVnaW9uIHdvdWxkIGJlIGdvb2QgYWxzby4NCg0KTGV0IG1lIGltcGxlbWVu
dCBpdCBsYXRlci4NCg0KU2h1aWNoZW5nDQoNCj4gDQo+ID4gLS0tDQo+ID4gICBkcml2ZXJzL2dw
dS9kcm0veGUveGVfdm0uYyB8IDYgKysrKy0tDQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMNCj4gPiBpbmRl
eCA4ZmI1Y2M2YTY5ZWMuLjdjYWM2NDZiZGYxYyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0veGUveGVfdm0uYw0KPiA+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+
ID4gQEAgLTM0MTEsOCArMzQxMSwxMCBAQCBzdGF0aWMgaW50IHZtX2JpbmRfaW9jdGxfY2hlY2tf
YXJncyhzdHJ1Y3QNCj4geGVfZGV2aWNlICp4ZSwgc3RydWN0IHhlX3ZtICp2bSwNCj4gPiAgIAkJ
CQkgb3AgPT0gRFJNX1hFX1ZNX0JJTkRfT1BfUFJFRkVUQ0gpIHx8DQo+ID4gICAJCSAgICBYRV9J
T0NUTF9EQkcoeGUsIHByZWZldGNoX3JlZ2lvbiAmJg0KPiA+ICAgCQkJCSBvcCAhPSBEUk1fWEVf
Vk1fQklORF9PUF9QUkVGRVRDSCkgfHwNCj4gPiAtCQkgICAgWEVfSU9DVExfREJHKHhlLCAgKHBy
ZWZldGNoX3JlZ2lvbiAhPQ0KPiBEUk1fWEVfQ09OU1VMVF9NRU1fQURWSVNFX1BSRUZfTE9DICYm
DQo+ID4gLQkJCQkgICAgICAgIShCSVQocHJlZmV0Y2hfcmVnaW9uKSAmIHhlLQ0KPiA+aW5mby5t
ZW1fcmVnaW9uX21hc2spKSkgfHwNCj4gPiArCQkgICAgWEVfSU9DVExfREJHKHhlLCAocHJlZmV0
Y2hfcmVnaW9uICE9DQo+IERSTV9YRV9DT05TVUxUX01FTV9BRFZJU0VfUFJFRl9MT0MgJiYNCj4g
PiArCQkJCSAgICAgIC8qIEd1YXJkIGFnYWluc3QgdW5kZWZpbmVkIHNoaWZ0IGluDQo+IEJJVChw
cmVmZXRjaF9yZWdpb24pICovDQo+ID4gKwkJCQkgICAgICAocHJlZmV0Y2hfcmVnaW9uID49IChz
aXplb2YoeGUtDQo+ID5pbmZvLm1lbV9yZWdpb25fbWFzaykgKiA4KSB8fA0KPiA+ICsJCQkJICAg
ICAgIShCSVQocHJlZmV0Y2hfcmVnaW9uKSAmIHhlLQ0KPiA+aW5mby5tZW1fcmVnaW9uX21hc2sp
KSkpIHx8DQo+ID4gICAJCSAgICBYRV9JT0NUTF9EQkcoeGUsIG9iaiAmJg0KPiA+ICAgCQkJCSBv
cCA9PSBEUk1fWEVfVk1fQklORF9PUF9VTk1BUCkgfHwNCj4gPiAgIAkJICAgIFhFX0lPQ1RMX0RC
Ryh4ZSwgKGZsYWdzICYNCj4gPiBEUk1fWEVfVk1fQklORF9GTEFHX01BRFZJU0VfQVVUT1JFU0VU
KSAmJg0KDQo=
