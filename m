Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB9BFCE7B03
	for <intel-xe@archiver.kernel.org>; Fri, 14 Nov 2025 12:34:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A182F10EA57;
	Fri, 14 Nov 2025 12:34:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bmfl09LU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BF4710EA57
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Nov 2025 12:33:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763123640; x=1794659640;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=b2PN1OtJyQLr4e3ekJd0Ka7fp5gLNW+NIfa9GQMr0TM=;
 b=Bmfl09LUqhJv2chuzpF8Lx95CR7ey3KJeRb8iVYY3SJSjmbxFRaGR5jF
 ahllChz+EA2CqP6Xw0d98GM3j1vreL4LJNqedzcdUGjM1YVEOZlmgAKcT
 e1lewcwxNJv/FEBKJcvnhz2/Pm87QxmHfElyNTxVe/NXJlcg6qA79qnA9
 n8VuSkix3slNy8jYbSf8zdORrfC0RhhVdMkEJR/gfbNHkkalFhiK0YfSo
 IoJC3ZmlvA2XlxAUPNJuF8KQjKUM7FNPztBWwcj49WSM6jtHaAKnksss6
 AyYoxYcgyMgV7ptsDSn2q0/qtBwqmGGAZeKmR7EAIgiUktYF3JJcXojDT g==;
X-CSE-ConnectionGUID: iOegju+yTP2ymK5BN5K4pQ==
X-CSE-MsgGUID: aD6IsdCRSz2y8h/KNwHPSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11612"; a="75897901"
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="75897901"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 04:33:59 -0800
X-CSE-ConnectionGUID: IZsKxYiXSxuUEqOmWa59Mw==
X-CSE-MsgGUID: tIBrBW+pQdymJfcwgQeKag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; d="scan'208";a="190189856"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2025 04:34:00 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 04:33:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 14 Nov 2025 04:33:58 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.16) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 14 Nov 2025 04:33:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k5i8UAz/jaejd72AFH9Rw1D1qKhSLWA1bUk+IaerkvXcb32yGaEGwbt4LVkUTI9KU4rUHvV0rpIO3/+Hw5NXNTlw90ovK3ZOHRXAtROEo6zP00ez5yI4DKSFb7Xzy7AOLLFjR3sg9S9HSLCWA9wLKazc9/HPmdGpZWzLY2zstEZNVi/Htc2rIIEWyxc7Nlk5Hq1Pmrbw3kLr1PMhybXaEHM4q4y3zV5mDbhQQf6IuHCxvET2GBDbP57DEBFB0XvE6t/lLXjIb7GMnWOxpqpOpSIkO1Rjk/D7Gmvxwxo/M+h5b+aZWY5uhAvCYJVLfoFSTIV5llqwrGqirL3/KxmjMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nYynQLsylAf0KkAGrFvID+vxNyH8p1NTTrz8zS9YJ3o=;
 b=tTEwou5e6HLtyeGRkO0lLnLXY+vpuZDRSU3wMBrp2h25Z4vUIqIBAn1qZtW6kVYi3UbziqtBbopPQpErEdD+DbsawQdt7B96NPRzQpldYTYQ5Boxgg5vmBZrpk9OJkM7XMjuGIb4eKRGzQruF6PrUrhvvLaHnzyWg6+oLwX1l5wqs3ndfgegkq9f5UR+QOgXTPeQU3LGUBErf0O17Ykl55QvNivifDxniCqI4+al3tpSPN2pTbXcomFCFRlYefBhFJLGrg3+LMzCdzCy8H3u0AeOnwR1qh9J/4kPmcJIZmbplhQsG02b6rtSraFaqtHPA8c9RPaC8ekLK115cKoVCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by CY5PR11MB6089.namprd11.prod.outlook.com (2603:10b6:930:2f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Fri, 14 Nov
 2025 12:33:56 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 12:33:56 +0000
Message-ID: <1743e057-8d15-4a15-b144-46b85ec1985e@intel.com>
Date: Fri, 14 Nov 2025 13:33:52 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/pf: Check for fence error on VRAM save/restore
To: =?UTF-8?Q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Rodrigo Vivi" <rodrigo.vivi@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lukasz Laguna <lukasz.laguna@intel.com>, Matthew
 Auld <matthew.auld@intel.com>
References: <20251114122339.1791026-1-michal.winiarski@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20251114122339.1791026-1-michal.winiarski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: WA2P291CA0001.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::20) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|CY5PR11MB6089:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cdd8a97-e4e1-4d1c-098b-08de237a142f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2xTdEdaSUZDbk5zampRZEFOZTlEQnNoWXYzY0VsWVhvWHBMemUzRTllbGY0?=
 =?utf-8?B?eEUwZTZtQ2trUERtQk8rZlhGdlQ4Sm5taHlCTFFVRVVLRThrblMySmVNVzZm?=
 =?utf-8?B?K3loN1hJY0srZjdVWEJwOW9tazJqNW1LOGU1YndLYzZVS2xTd2d4cll4M2lQ?=
 =?utf-8?B?azBSVjEzZ3pLcnB6MnlnREFwYXJubEVXdWhMUDVzRnBmR1ltSjdoQkpJMUVt?=
 =?utf-8?B?WVBxK0NUT3o2Y0g2ZVFBM1dpQmJzb2lEVTdvUzhoSEN0S0wwV2Rtays1QWtS?=
 =?utf-8?B?YkRaakZubUxTWkg5dEN2NTl4bGk0OEpjdVdsQlRYMzEvODdPZ1BkNkNRb243?=
 =?utf-8?B?YjlzSDhPUzBWbU1nQ25oa0hDZ2h6bnNSYUpVN0JGdGh1QzFiUlVxWTJHYjdt?=
 =?utf-8?B?Tm1hSUJWVnl0T21XQ3NMMVcyRE1BcThQTFhtWFhCVERuQjJpcHdVSFdnTC9J?=
 =?utf-8?B?cXRFQmRmeUpoN0J0UDA1anN4S08zOTVuRUtYNUN0dDQ2SVlsTk9ncEZDQmxj?=
 =?utf-8?B?SS96ZnZLbjNhZld2SVRxODhpL2JNVkRzenM5d3NiZDFWekcrR1B6R2U3WmN1?=
 =?utf-8?B?RVFJMXcrTE1oQ203RnlKNk5Na0hXb1pKVmQ3STRMd2k5YldmU0drQmI5NFl6?=
 =?utf-8?B?cjBSNlhYbUJGUWtuVWFkL25yREl2N0FHeTlUd0VxMXRBV1hGL2Q3SURLMlNB?=
 =?utf-8?B?aDlOMmlvaEg2a1dhOXhNTENtb0FaOVRsRitMR2NoczM4aWJkTytIMmtabUdq?=
 =?utf-8?B?WGRJYlFZWmhkMkYxWE1rWVcvcWFoNng4YnZWSkFVT3czWmNqK25QQWNtekxT?=
 =?utf-8?B?b01IdGNJT1FoaFJWc2VJRXUxNFFZdFRHMlBTa2xPK0lIdXBTNDNCK2hCc2Zl?=
 =?utf-8?B?ZUxuOFNjTG1Ma1J3TDZWUE41MGdvTVdnL2Z5enZla1ZDR2dUMk5uOVZydWU4?=
 =?utf-8?B?d3VEZ3hvc1BpNXdWQ1ZrUFBhTlJDcEpVNnQ4Ni9MaUovUEdrRnpYY2hwaDFr?=
 =?utf-8?B?QVJwaHp6VjdWY2hiWkZRQUt0dHgyM1NaUWtiem0zNFA5dWNSUEFQVW5uenZ4?=
 =?utf-8?B?Q1NKTThvZlA0ZGE2NExBZzJIMEZkZmNHOWczOGNhUTZqb1B3Smo4MFhsS3Z2?=
 =?utf-8?B?cGtDVXJYamdRSUJEdWVUdXc2OGZiSzRBa2pkTE1FR3NPZG9MdHUza3YrYVM1?=
 =?utf-8?B?SWE5dmJCSHc4aUREem5ReTZndnltR2h4bUlYZlRLZ0FraXhXc1hrYnl6SDBs?=
 =?utf-8?B?REF1R1htUTZmRE5TenhSOHFoU3BtOTNhQTdZQjRVYmJwdDArclhRUGd5bStt?=
 =?utf-8?B?czIrOWlVSnhtdUxhZExXei9yYysxeVBzTUxFQzNiWnAwWG9jbjlXMFVPR1ZR?=
 =?utf-8?B?U05pYVpnM283cVA5cXJ4cGdzMVZSN093d28vNHNENUphd1lPeWtPOFBEdmJl?=
 =?utf-8?B?ekRIR2c2dFQ5SlpJMmZCRnRNblZNT0RBUC9FNnA4UVZRNjk1aThERWQ2MTFw?=
 =?utf-8?B?QjltNGdpVW8wZ1J3dWJVbzhGRFhMVHE2VlhaZWJSNDd0Z0hVazhBdEViUHBH?=
 =?utf-8?B?WjkxVWxSdDYxWnhwREZoOVFwT3pMWmNtdVJHeGNkdkFRdndsSEttd2RQMnIx?=
 =?utf-8?B?MmxNUzZlVmdzcnZLcTY3eEJYcmZPWCtndFMxZldiNlpMSEo3SC94bU5qZ25V?=
 =?utf-8?B?YitjMUZ6a3VjU3JmTGFqYjZBWDFtODk0ZWwxUEtOaHRrZ3hCS2JFNTZEQzJY?=
 =?utf-8?B?Zm1sWDBRZnljallCUG9aSTEvTU1RZ3FUVlFGVlE1aTl1RzI2MHZPQUpGZ2l6?=
 =?utf-8?B?WVJ1RGd1amdiTHQ5OXlpcnVzTnhCMGxCRzVwTlRoRHp6d0llaTNXUU5yQk9J?=
 =?utf-8?B?Wjl6ZUEvdmFDRFdZRkg0bWNUYlVSNnVCei85NEMwS2kvMzBWTktnYlNlTDh4?=
 =?utf-8?Q?7ZMWQ8Qo3qvCjJ0TKx2NRgyToj5AQr/r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDFRaVFPODc0UElNNnEzcTRZNG8zWUJnMUpoT09KSWZZSVVvWDBTRkVpSnZl?=
 =?utf-8?B?VFpLdFFwRFVBSG5WYTltSDVUMUdDdGpXUjVDejZDd0p2bVFpTTZNcDNFZTVz?=
 =?utf-8?B?eEhTcnpWOWV5RWRlK21Vakt0cHcxQTRLaHhlM0FleE5kODUwOGhXS1p1QjFK?=
 =?utf-8?B?MDNvclk2ZzVxK1VMZWtOclp6UU04YWNTNFdxMWVFeTRFWWVHVi9IRnJONnBr?=
 =?utf-8?B?bmhSTllKZDNDSk1scVo5dXpRWlpCMGtkOTg0bGpwOG9hTm5QaXlQRExkT21I?=
 =?utf-8?B?aUVWWTNPTHNIMFhKd0dqNDlzTEJka25aRlI2QUg1Z3hYRUh4ZVg5d0xzcXhn?=
 =?utf-8?B?UVIrZTRMQndraUdhRnJPaTJPUk1pczBkK3NuQlNVa2trY0FrYmkwRkpTMTdt?=
 =?utf-8?B?MVlRVkJQS2I3WDNNOWp6aktQQVJKcHRYVGduSUQyTTZhckRhakZnNDRkS1Y5?=
 =?utf-8?B?Y0ZxTmVUZWduNlFjOUxkdFFOWmw1b3lVaFhnYkJNZ0hzcHh1OU5yektDQ1Bx?=
 =?utf-8?B?SFdkM3ppMXFneVBuSXZwQTBHNUhyRk9BZitxV1o2bDNpdXZlaGRBSDdnRkxr?=
 =?utf-8?B?YzFFRHpkcUl1Yk9tbm5POEJldnk0MllqYk9ub25CZ1pyczVxWGtsSE1aU2ZK?=
 =?utf-8?B?OUU2OFVIYUthMUh4bVlMMjc1Ty9hQm5WOU9IV3puYnlEbG02YXllMEtXWGdS?=
 =?utf-8?B?eUZJVmE4YWxQNnhBclVmVmZCempJdmpodE9mTy81T1N6SWllVFJISllFRXZo?=
 =?utf-8?B?ZVZiYUZYZ1hSQzh6RWxwNjF0UXdFOFBmU0xQNXJIYzdCeGhPZHh1YnhMc2wy?=
 =?utf-8?B?M2ViSll1akhSMnRHMDcxUlhZMnV0SUdhR21Jd0RZTUppajFTUDJIbndUK2dL?=
 =?utf-8?B?elV1TzZHZHhrV0gzdjlsem1VNS92bXpSZ09zQjJnbUxIZEk5VGtQNXZkUVlL?=
 =?utf-8?B?SHNaRmlkaUYzTUVCTUltUlEyaVU2M0ZNMmpNRDB5OEdrc3hwV2ErY2hpR0tS?=
 =?utf-8?B?aDR0WEhWRXM5NUJEcUNFRGlXWmtKVHNHMkw3VE04VDA4NjJzZU5pTWF1WGx1?=
 =?utf-8?B?Vk54R3VFKytZNjhEM25NOUorT3FLOUMrUWVhcHpweEVyc3BKV2w2K0E2b0h4?=
 =?utf-8?B?ek10TTA1NDNaZkJ6R1J2d25LTUhVL294Tm5aMkozZnQ2SzA5SUlUejZ4aDRM?=
 =?utf-8?B?WnJjVkdmRUxSeGhXV0RDTWZkdEJpMG1rN3VNMHdMK01XbWFkT0dxbXlRVlJm?=
 =?utf-8?B?SWFBS1Y4RjhSVUEvc3F3anMzdURvaVlzNWlyOG1ZZEZuYTVCY3RvcGF4VnpX?=
 =?utf-8?B?ak1vZkU0RGtDQ2kxRzNkVmZwbWNTYTFxN0VNdmlsM05lY3N6Vlp0WFlxMGdx?=
 =?utf-8?B?SE5lbVhnUWRCdmhmQ2FsZysxalRINjZTdUQybm52SmtIMkdlVkJwaGNmMXlC?=
 =?utf-8?B?MkV5M2lZVWRLYWFCbi9UdWo5KytKVzROMVh6YlRMeUhlT1lieTRYSkNTRTZL?=
 =?utf-8?B?WWZOa1dvTTQzTGtDRUJJN1g4MlFaM1U1OUkza3ZQWXdkZldMNnUxYXBuUmUv?=
 =?utf-8?B?MHEyd2x1TUxQdlpCNzEzSElib2NDYVpoODVPVUMvRGhoSk1JMlpVaGVUMVNr?=
 =?utf-8?B?Z3ZkY3c4QWcxVDNkcmJXRDROUUJGT2hTR0dLckRuZTVlaXA2WmM5bmluakJY?=
 =?utf-8?B?UDIzUkdhYWNvWnFXY2VWMkFUVFl1UnNrQkpNQ0dRY2ZWYkE4Q2daQlpLaU1l?=
 =?utf-8?B?Y1kzcEsxVVBmd29GZDZRTG9ZQjN2N1RqNnpPZFlmWWNJbmFCZ3UrMjNkSndW?=
 =?utf-8?B?d2taMU5zeWJKMk1NaHNqaDN1ZzdrNVNFNnZRbC9kRDAyQk5iSVBqRzNLalF0?=
 =?utf-8?B?SmlGNTdvalhTdzJ6OVFDYXNOeXJKZ0JHYzlwU21maFVvR1FYSzBwdjhUazZR?=
 =?utf-8?B?Umdya29WWXhiNE9UNHh1bXhHUHlsS3lRZFRUdE92eXdJalRGQnFMd3ZTVnVT?=
 =?utf-8?B?dHZTNnY2WUxSeGhYTXp4ZWVaR01pay9Yd08zRGwxemJiNmhGTWw1azB2Yjhj?=
 =?utf-8?B?bGRJNWxabGNUN2drRVNPV1duVHFqT3VVdC8xbk1qQkMvV00rTGN4dHl2QWx4?=
 =?utf-8?B?MzQwTEwzM2p5NkRvdStzZEYyWHNRUG5LNG9JdmlLa3c4Tm8vQ3RDdTFYNjl6?=
 =?utf-8?B?OVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cdd8a97-e4e1-4d1c-098b-08de237a142f
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 12:33:56.7057 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RaWzATvQPXbmFt70SohOKj5bv6Tv1hYsr0dKjH/y9fSMTUa64Z5qAkLYECGYqlfgptnwI3fdcKwiDgS94czzotWzagLjPClA329XP3OGrvE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6089
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



On 11/14/2025 1:23 PM, Michał Winiarski wrote:
> The code incorrectly assumes that the VRAM save/restore fence is valid.
> Fix it by checking for error.
> 
> Fixes: 49cf1b9b609fe ("drm/xe/pf: Handle VRAM migration data as part of PF control")
> Suggested-by: Matthew Auld <matthew.auld@intel.com>
> Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> index 6deb4835eb44f..037d48159dc87 100644
> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c
> @@ -572,6 +572,11 @@ static int pf_save_vram_chunk(struct xe_gt *gt, unsigned int vfid,
>  	fence = __pf_save_restore_vram(gt, vfid,
>  				       src_vram, src_vram_offset,
>  				       data->bo, 0, size, true);
> +	if (IS_ERR(fence)) {
> +		ret = PTR_ERR(fence);
> +		goto fail;
> +	}
> +

extra \n

>  
>  	ret = dma_fence_wait_timeout(fence, false, PF_VRAM_SAVE_RESTORE_TIMEOUT);
>  	dma_fence_put(fence);
> @@ -655,6 +660,11 @@ static int pf_restore_vf_vram_mig_data(struct xe_gt *gt, unsigned int vfid,
>  
>  	fence = __pf_save_restore_vram(gt, vfid, vram, data->hdr.offset,
>  				       data->bo, 0, data->hdr.size, false);
> +	if (IS_ERR(fence)) {
> +		ret = PTR_ERR(fence);
> +		goto err;
> +	}
> +
>  	ret = dma_fence_wait_timeout(fence, false, PF_VRAM_SAVE_RESTORE_TIMEOUT);
>  	dma_fence_put(fence);
>  	if (!ret) {

Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>

