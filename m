Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E33CCCA0FED
	for <intel-xe@archiver.kernel.org>; Wed, 27 Aug 2025 21:31:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DFBD10E8BB;
	Wed, 27 Aug 2025 21:31:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="oB2GuFPn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0188210E8BB
 for <intel-xe@lists.freedesktop.org>; Wed, 27 Aug 2025 21:31:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1756330271; x=1787866271;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=t1szicG3j/dErInOYyoJtWMaG9Uh0CoRwuNGOzYqzAo=;
 b=oB2GuFPnlnhIf52jViz0eI0OeQJ0/KTVapeVYQD+cONt7yuGfiKGetj0
 Vta7lbNa0EdAe6CjKbCRIXXlhrDPTFmOl9ObcAMUKpLjsz2ugzqByA8OT
 MhMxdYbkjzyHujOco1EKzfrCkTUxskmMizHZG9VwBuKUMo+iw5jjS9f68
 To0b3soO61zGuXxSbUIAuekx36R4GL3mi5HDZ+LhJt5KhHWUrhzLuPTAz
 /ARkHH3SXXXivJxkwtgRJFu9IO6BNhSQ82AzjaeULxCyzW4g9jze/P4kC
 gCXQQQWw+MWMvb0Y92+gnY0DKgsJyVae26umjTwYoE3VYD4c+PtEHN6iv g==;
X-CSE-ConnectionGUID: WcyCXQSmTGWYMqz0fPyATQ==
X-CSE-MsgGUID: hQMqjRb8TPCbsC1zROO9Cg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="58533909"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="58533909"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 14:31:11 -0700
X-CSE-ConnectionGUID: CUJMSJh9SrWeEP2MjX9g3Q==
X-CSE-MsgGUID: JWGqRFipSz+Bf7n0daAyQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; d="scan'208";a="169460160"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Aug 2025 14:31:10 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 14:31:09 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 27 Aug 2025 14:31:09 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 27 Aug 2025 14:31:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Rj8WRz3c1iS2KabDtLEBowVTvXPyW6g292MQhvhRNbV2TTp1/+mg9pI5BiJ9qHPSjXBcpZyoI5uHTsSTqO1GthD5FGH6Yg6VCxsQ+IKbcTGX802Q/Xs4Gx7livqv3JjWLy2NP057fuC+fOzyopRQ8pgt7GwrBqv5MMWy6jyoHgQae3ALIv5FgsfhMxTPBx7WIAqX0OqR/0D0oF/DdEhcDygDtSoj8QzXgDB7+qos+FlyyEVao5D6j7T1oh0U5Y2Aff/PpJdxVso5IuQn5E7ANQT35usPBCDWZ+QeBcDQOX3oWxNa++LrfleBIzYq69SAMqs1/IadfYcM5zIakCX1Hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBtwHYZkDNFxr38vynQbTC//0ZAq6fJhTvlqh71lh14=;
 b=RbebjYqLBUuLJgjrVowBLze4zu+DHTwMSvH3W/l255SKDV3olL6u5ShfPLka0DnapDdxSaIHGnKdU+bZLP9t/X3rDWwVbiVHAyLEKOHh5d07CG2JtPJD2Gbv7j+nPm8omkiJS7eYIN0eIfB9amhwtKSzg1CNx6gu2iy+OUcDUrzlK0V37muJoYBZslaRbC8v5JS+EWHQWP7BT9Nb50NjlPeumcs2dp0hSKfoJNUgR/6yC3Ivgc5+VE6nWgT/Y8kr7bKkJuK/qOE+iyspyIlc770TQu4PbqK3ssh39ouYCWiBJCru1OQrXQ4xXyxYPZZAiU3WbpT73Y5026m2BE75HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by PH0PR11MB4776.namprd11.prod.outlook.com (2603:10b6:510:30::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 21:31:07 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%4]) with mapi id 15.20.9052.019; Wed, 27 Aug 2025
 21:31:07 +0000
Message-ID: <f093b734-3af7-4ecb-8def-e71aeda7a2e7@intel.com>
Date: Wed, 27 Aug 2025 17:31:04 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fixup! drm/xe/guc: Add capture size check in GuC log
 buffer
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <alan.previn.teres.alexis@intel.com>
References: <20250826233035.860363-1-zhanjun.dong@intel.com>
 <tqw3kju4valjd5lfj565ls6q4jchtjq3iljtac6kp2i42cpugf@qq76skwywzcv>
Content-Language: en-US
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <tqw3kju4valjd5lfj565ls6q4jchtjq3iljtac6kp2i42cpugf@qq76skwywzcv>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0208.namprd03.prod.outlook.com
 (2603:10b6:303:b8::33) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|PH0PR11MB4776:EE_
X-MS-Office365-Filtering-Correlation-Id: 99e3f88d-a875-4a4f-f329-08dde5b10883
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzBOczIvQ3VNcmFVekYxRlJuczlBUnZ0ckZhOVkybWZlQmc5L0VDai9GT09D?=
 =?utf-8?B?WnRGWkNPcG9ob0NTT0N6MnVhL0cwZW0yQ2s0cnBNTmwwMm11UGtacVlNM0tp?=
 =?utf-8?B?TFBBS3VFeHRuaUZFa1FkYzBUMzV3enFVMVROMWRobXNOL3dCdlFuNHZtY1do?=
 =?utf-8?B?bWJ1dDlydWp5eFlOa2hTamxCKytxR0g0SzBxbjMrSVdRMDFuUEtSR21nUXlt?=
 =?utf-8?B?UnovUUdxZmNYUmVja281alBrWDBaRHIxSzhkcnpuVDFWdGQ0R2lvOTk4QThx?=
 =?utf-8?B?UDRMcjZwSmFNZWNYbk92aFBsMDcvRW5xYS9CQzlHSTNtNXh2K3NVTXEvNE5Z?=
 =?utf-8?B?NUZvYTlBeXUvRWh1MUZiQVcweDF5b1ZFamQ5Kzg1cXp4VnBVeG5sZ0YrOFVF?=
 =?utf-8?B?WTN1SEF1cnpNVzVYanE2ZlVucWpkSXNhbEdWeFp3ODM3ZmloVFdOWHdoeG91?=
 =?utf-8?B?d2hPWXhubzR3Vkt6SEcvZnYvUzBpQ1dPZWNNT2RkY0xxaVF1MmRYSzA0SExn?=
 =?utf-8?B?dnliL0NLRGg0OUtlczJmM29VV1JmeFp1Zk1Yb1VHZG5PU0V0Z1B1SmlEdWJy?=
 =?utf-8?B?d3VhNTB3R2JHTzdMcW5WbDZ6L1hqK2dhdk4wUGs5TWs3VVp0Y29hZzA3TTRR?=
 =?utf-8?B?aE1xM0hOTTRUUU5YUmxoVXhxRUwwU2tjRi9RSHpnREZDZHRRWlpmSkdqYkQw?=
 =?utf-8?B?MldKWEhNeFRrVWtkemsrTmprK1IwOEFiRnFXUmo3bjJNSUNFY2k4bXpNVWg1?=
 =?utf-8?B?TzVWb0JuS0lzUDJPbThnRWMwY2t3eVBudG5nRHBJY1lZL1JGOEZhVDJuYW53?=
 =?utf-8?B?UytEeFNnNkEyaWZaQVpsUVl5anhFVGNlc2E4WHNZRHhVaEdjQmFRNTdhMEJL?=
 =?utf-8?B?WkcyZkFST0FzRVNjc2FqRTBNYzhXSjBrRm9iTUpuUWUybFNzelpPZTlqRWJs?=
 =?utf-8?B?bXBocUxPaVFhQVpYYW4vTmZQTnpyZVFVUnFSQm1ROFZtaExydmhSRFJJT3JZ?=
 =?utf-8?B?N3dzZjM0NUlyOVBNKzhFcGt6QmJETER0VkkyRFVwVkRjeHA5bW1YQm5Sb0tn?=
 =?utf-8?B?eUdUK2RVeS90c0RkM2hMQWxqakwyeWUzVi9mU1R5SFk3dWlLWGg3cU5jWVV2?=
 =?utf-8?B?bGxmcVZxaXh2RFdGelZXWnNDMG5aWTRwaXplT3BjYU5EemExWTVvUlZOWkVz?=
 =?utf-8?B?N3hsaktoYjd1Sys4R2pVU1pCdXZ4SGQ0c0gzS2Z6Z1JTeVAyOWgwSWdncks3?=
 =?utf-8?B?NEc3NnFXaGR3Y0MyTlRrdUVKY2dwNjVWTXJ4bk1zbTBNbXJGbXNIS2UyaGlF?=
 =?utf-8?B?cloyaHV6cHVHRFBWVE5pc2ZyajN5ZG5RMHZ1NGtIK0xkRVAxeGtmQVlSZERs?=
 =?utf-8?B?TmZXRjhmRUpQWktiYUVSQXRZMUF6RmJZYzNnaVkxd3lwc0h0aE90TTI5L1pr?=
 =?utf-8?B?eFVqSlQwcmQ5c3dhOS9iYXpLVUhveTJjekVZM0swK3VIMS9tYjJmQk5RM051?=
 =?utf-8?B?eTFINVBEUERJUnd4ZFhTc0l4ZmFKTlUzbkY5cGVTYUNzVitRQ3pkSFI1dUFY?=
 =?utf-8?B?UmhaMXVPZ28rOVdud2h2QVhCQUptZ08xcXVkWW9aNEN5R0pSOWVndzBVZUxF?=
 =?utf-8?B?T21xcyt6V0dTK1pKUElyT1R3UGQwTUZ3SzJOaUdvRkVsTDdTM1JtQ3R6emg0?=
 =?utf-8?B?YjUzb3hrY1ArZDAydmxhaFZsUWZ2ODZyL2VhMFM5bmthZ2lvbDJibXNEa3dF?=
 =?utf-8?B?UnhKYStjY3pOSlg1ZWpIbjNWYW9LVm44RUVmUkRIU1BkdFloMzAvUXFyS1Nr?=
 =?utf-8?B?M2ZLZlFqUlBBTzZuYUNnMUVZVXZjU0FEOVNkTHJ1M2pqMFp6ZkprY3ZEbWZk?=
 =?utf-8?B?N1MvekVobzB1MzI2K3hiV0RCb1pTZXdzdUtlQ29ycDVpQ0pTbWkrWjFzdkp5?=
 =?utf-8?Q?YO2VAf6lia4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cmM2Ynd4THhOM0xndTByUzhxbUQ2NFJsRFhCY215Zlkwcmk5bFBBMnlBRkhj?=
 =?utf-8?B?WUZXcmJuQWxzZnd2WU56NFd6RkdTalh3dE1teGk4SEg2T0pvUVNzWTdPL3pw?=
 =?utf-8?B?aFNnSkVLZjZDejBCbU53VW1NdW0rckpZY2dRV2Z6ZmNKZzI5RFQ5d1BobVg1?=
 =?utf-8?B?NCtCcjlHZmpkQzVvK0h6dVh5aExHR2pzZEVaOTZ0eHAxNUc5U1NqWnprOTNu?=
 =?utf-8?B?SjJnSXhUQXYvSGhwbEtjbVdIN0ZOUE5vdHNVbXFKcWhvc25uUHdhU3IxdktY?=
 =?utf-8?B?QUJaZExMUjhzcmpUK3U3TFA0UCtWamZseHJIbEd1SnVkTVZRRDhoQVVLK3VM?=
 =?utf-8?B?VjBhZGlWZnp6dUlxMUE1Wm1hNzRUQkVrYU9aR2RvbGQxQ0lOQkc0eFczTkQz?=
 =?utf-8?B?V3pjYzl4bGJxT0xnZ3BWUHVUM2kzMVhLbmtMcHlXS1pnLzErY0JsMmZOU3NZ?=
 =?utf-8?B?V3VydnVYK3BUZ01VUitXcUNDM054ZDZuSFJieW1lYmxuVUgwRHpFbTBpUHZp?=
 =?utf-8?B?YkJIK2xBQUEwVlRnL29sa2FjY0VKR1JEODYyakxPSCtVSnh2OUJycm40SUUv?=
 =?utf-8?B?MEduMDg0SDJXejF4N0ZCVHQ1aXhaRUxUa085cXFpK2l5K0luQ25zbWljMkdy?=
 =?utf-8?B?RlhPUHFKVUttWkJjTlM3QU9FQVlmNlcyNFg0RzFmVmRHdVBXS0tXR0dEb0Zu?=
 =?utf-8?B?U2g2cjdEa00rUTFnblNtblh0K3NRTXVWdTdDOTNhbDVQNlQwWUJBRytCTEho?=
 =?utf-8?B?bjlnWUUvbDlMekZHVzFKZnJWcW1pME5SUjFqMDAvN3pqM25yR2trWllZM2t5?=
 =?utf-8?B?eFpRazZJUDc3QytJQ2tEV3hyMHV6bW9xQnRPLzUwby9ZZ0VxN2doeUtmbzBE?=
 =?utf-8?B?bUVBNjN3aU1RdlZ6ZUdGR3E2d2hkZzdOREhwM3VQZ3ZIREF5SzBmeWZoeWdm?=
 =?utf-8?B?VXZoVXZDWExjb2tNN01lYkYvbTJzdXR1aWFzOXpIKzZaQ3hjdW50bEdUM2N3?=
 =?utf-8?B?R0lzVWlVV08vRGZRMU9TUkdnSDdmQ3pBMFQ3WjhYUFBtTUZXZXZzbm5MMitP?=
 =?utf-8?B?RllhZkxIR2t2alJUUy9uclIvb3BZR1pPUXFCVTZMK0FDNHJxcEJ6T0M3K3c1?=
 =?utf-8?B?TkNXaks3NU9CR3VWYWw5dnorY1Z0ZFc3clFZRU5jejJXNVB2d29YUDYrTFg4?=
 =?utf-8?B?b3ZIWEptS0hoVks5VWcyL29zSGI1bzBhZi83NE85RjdqMStMaHpjQXpMSkxW?=
 =?utf-8?B?RHplSTFnZDJReVZvY3NwTFRFTnB0bzBmZlpBODBhcGlwTFQ5eDhhdXY1MHpP?=
 =?utf-8?B?cEc2UTIyQjhjcmd2bGZpOGU0cnltTDRZNXIwbUFuU0tESUoweUZUbEI1UVov?=
 =?utf-8?B?MFhWZG5ONW1LOVlzbGJqYVlkOTY5N3phbFd6Uk15aDVkVjFKSnVIT0s5bWY5?=
 =?utf-8?B?c2RFLzRxTkdqcEVzaWNYM1FZMVNkMWNWUVluTWI1VDV2ZEFoL0VjTjFMZWRE?=
 =?utf-8?B?QUhBcUFvcEJDYzNkWTBHMm9TQTljV1RScXF2dzFuNDU1Y2FhQWdMQ01QNWtQ?=
 =?utf-8?B?OEsyVjNmNEhFZWVzdEw5RStaR05SQnpHYzI1L1Z2OFFPclV1MEczbGVaL1Zn?=
 =?utf-8?B?SmU3YzJFTjN1eTNlZUxNYkdheXdvOHRid2NBRkZydDF4RERXOEZiaFp2bGZx?=
 =?utf-8?B?VlpqMFF1L2pHdjFybnFKQ0U2cFFBREgvTVY2bFZ6TGNKVWpXajFBNy93RWIx?=
 =?utf-8?B?STZibkVSK0wvc2RmQWJzVytuWG5SMmFGWS9iWmdHdThETUJFcEtJanR5Y0th?=
 =?utf-8?B?cjBSbER5d25XNmVsQnhqclJQL3p1bHptb3QyOUl3N2VUZ0Ftc21PU3pEM0N2?=
 =?utf-8?B?NVJDdG1FY2kxR3FMSytXbnlOWnFrMFc2QW94L0JxcmkzcDJDUWJHeUtlbnpq?=
 =?utf-8?B?VkdhKzBwRVlUbUxwNTFaYmRaL3drWFN4cElGdUltYTFTK3ZndDNLZU1RQnZx?=
 =?utf-8?B?cWZvaTM4Y3U5TTJsVWFiQ2t5clM4bTFyOGg0QkJmMGpqaGdJOFRQSEg2ZUhW?=
 =?utf-8?B?UGlUaUxHSVZrUWRVbUdBZkhVSldzR2t1REh3R0xqbkZsOU45d2tOT0QwUzVZ?=
 =?utf-8?B?dU5UdG1tT1dWNStBWFVxVWNGY0xPbGU4SytmQVpsb0JBNDVyMHNkc2VBMmJT?=
 =?utf-8?B?dlE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99e3f88d-a875-4a4f-f329-08dde5b10883
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 21:31:07.3502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kEsowx1xCC/R9gNdJUY6CETzt9lMKcyXnl4jYUmKHQrf9ifyZ5G5ojSN98b21MKYM5chQ1Cj6TmKCE2vVePB8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4776
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

Yes, these 2 enum value was not used, so there is no actual bug.
Will resend without fixup.

Regards,
Zhanjun Dong

On 2025-08-27 1:03 p.m., Lucas De Marchi wrote:
> On Tue, Aug 26, 2025 at 07:30:35PM -0400, Zhanjun Dong wrote:
>> Fixup buffer type value, make buffer types equal to guc_log_buffer_type
>> in intel_guc_fwif.h.
>>
>> Signed-off-by: Zhanjun Dong <zhanjun.dong@intel.com>
> 
> this can't be a fixup, should rather be a standalone commit.
> 
>> ---
>> drivers/gpu/drm/xe/abi/guc_log_abi.h | 2 +-
>> drivers/gpu/drm/xe/xe_guc_log.c      | 2 +-
>> 2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/abi/guc_log_abi.h b/drivers/gpu/drm/ 
>> xe/abi/guc_log_abi.h
>> index 554630b7ccd9..b1819679fa35 100644
>> --- a/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> +++ b/drivers/gpu/drm/xe/abi/guc_log_abi.h
>> @@ -10,8 +10,8 @@
>>
>> /* GuC logging buffer types */
>> enum guc_log_buffer_type {
>> -    GUC_LOG_BUFFER_CRASH_DUMP,
>>     GUC_LOG_BUFFER_DEBUG,
>> +    GUC_LOG_BUFFER_CRASH_DUMP,
>>     GUC_LOG_BUFFER_CAPTURE,
>> };
>>
>> diff --git a/drivers/gpu/drm/xe/xe_guc_log.c b/drivers/gpu/drm/xe/ 
>> xe_guc_log.c
>> index c01ccb35dc75..470c83ead543 100644
>> --- a/drivers/gpu/drm/xe/xe_guc_log.c
>> +++ b/drivers/gpu/drm/xe/xe_guc_log.c
>> @@ -330,7 +330,7 @@ u32 xe_guc_get_log_buffer_offset(struct xe_guc_log 
>> *log, enum guc_log_buffer_typ
>>     enum guc_log_buffer_type i;
>>     u32 offset = PAGE_SIZE;/* for the log_buffer_states */
>>
>> -    for (i = GUC_LOG_BUFFER_CRASH_DUMP; i < GUC_LOG_BUFFER_TYPE_MAX; 
>> ++i) {
>> +    for (i = 0; i < GUC_LOG_BUFFER_TYPE_MAX; ++i) {
> 
> other than the order we process it, there's no actual bug, right?
> 
> Lucas De Marchi
> 
>>         if (i == type)
>>             break;
>>         offset += xe_guc_get_log_buffer_size(log, i);
>> -- 
>> 2.34.1
>>

