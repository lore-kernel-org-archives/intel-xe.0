Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3939CAC596
	for <intel-xe@archiver.kernel.org>; Tue, 17 Sep 2024 18:52:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BB510E082;
	Tue, 17 Sep 2024 18:52:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OwHMECZi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 101CD10E082
 for <intel-xe@lists.freedesktop.org>; Tue, 17 Sep 2024 18:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726599147; x=1758135147;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=ogq5ZUb4DuznU6i+LwLUQzoRywdFXFYz8/KtFvrui/s=;
 b=OwHMECZidbMVfSL0Oj37nTpaK5ccg6680GW9oaXyEavMTZtAOePw/kjK
 slFn1iF8bVnCe9aHGzL6iKi4BinajbCxACJ+ERr8WmnwDr7kuaGBgZP7e
 d1Srkj6hZC65NYSWZpwLumOd3fiH6Ac7Gmjog8L01tdY4BKxgU360LARc
 KThTDYqPazCSzBayrQ2BGq6UqSyvRxUenuYUueK1edPofsQzKr6ca6qjI
 YDQSrJDXY+jGKVtCBOsIEVa8oXLKXeGRgthokpUCw4lX2YWDsEbtgxYZI
 8He3+LpoyR2WF3S6L3lixIuNtIu4JMW56wR2E25wRe/yp9RN7L/0TVuvZ g==;
X-CSE-ConnectionGUID: 27BagfJlTxuLmeiItqSaOg==
X-CSE-MsgGUID: Mo6EjEw8QPCEAuMIVa2hnQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11198"; a="25601136"
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="25601136"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2024 11:52:26 -0700
X-CSE-ConnectionGUID: O3O0xAehQO2byOz1i9x+Qw==
X-CSE-MsgGUID: Fxezzd2IRaK64fEOVrakiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,235,1719903600"; d="scan'208";a="68935032"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 17 Sep 2024 11:52:25 -0700
Received: from orsmsx602.amr.corp.intel.com (10.22.229.15) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Tue, 17 Sep 2024 11:52:24 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Tue, 17 Sep 2024 11:52:24 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 17 Sep 2024 11:52:24 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVP7AUxzXDux+cVH58KvR+7B9h68Oo+dnolrRZlj5W4Xpcz7RqtWbOk0jcIBOxt1A6otV3ht5vQPjPlyqF2ZAjpR2UgJ3LJd7F/VW4FfzFSz/jqbRhZRkiWfT12rDvHqzzdrpYXvdeObz7RefeArOtdoveoslxjc9n3xSfaZGYH1F9H62aotTIj6co0OaVtHFzvO0uoEMJlIQJpFpXZi8aK7LJP54tiS5qFLoV9wrNu4e7+qEode7jR9Mj2zlpnYahvukQ8CuPt9BF7raqNWMJGgeJY42RIoYJm255vGCYbHmgqFyoLcSMsCBdSs79gaJ0LNSAY5TKElFjNseyZvcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j585+5bulfzst7Q/g7H/bHMARXyEZ+JstZ2MYScClmQ=;
 b=qoz32O166afnrM1ybN5YnzhDlqNRI9KDzRDBzbAlog7/oAbfOvKxeUv6dtERhXAWq6Sjp30VG5pJB8R1ckhfzd2x/lTpp8HL06g5++6xPAW9Kfo4lnV/t1EnAwHVsQWQXWf+LjjAIAPWbwjFkMKMAKXEJm13GCB3c2dJRTfrjJPn77O7fjkXt4ydKXBin2C1zo8u2PLdVzD+qGTpCMQA3VylDSX0oA6IWOPoPeCn1S9QR2IddyRRCaui+Erl383KFDjA1NaW/xyuQMM+JOgyWoPfrM/pZ9AYygEFwqqRYsrig7FdMTuZBrY3o+KzEPfWCYtVI4uDuWDfK6XbAXPl5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by CH3PR11MB8750.namprd11.prod.outlook.com (2603:10b6:610:1c7::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.25; Tue, 17 Sep
 2024 18:52:18 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.7962.022; Tue, 17 Sep 2024
 18:52:13 +0000
Date: Tue, 17 Sep 2024 18:50:40 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Nilawar, Badal" <badal.nilawar@intel.com>
CC: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>, "Michal
 Wajdeczko" <michal.wajdeczko@intel.com>, <intel-xe@lists.freedesktop.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v2 01/23] drm/xe: Error handling in xe_force_wake_get()
Message-ID: <ZunPgOAndPtrl74H@DUT025-TGLU.fm.intel.com>
References: <20240912191603.194964-1-himal.prasad.ghimiray@intel.com>
 <20240912191603.194964-2-himal.prasad.ghimiray@intel.com>
 <ad2bb8fa-bd4c-4880-b4a6-f3483e6a2b7d@intel.com>
 <31983baa-d613-4a79-b39b-3d315b87a14d@intel.com>
 <6ea536da-fed3-429f-82d4-f118d53309dc@intel.com>
 <4853d43b-0eb2-414c-816b-96e25bc6d604@intel.com>
 <7d1e6ccc-3dc1-4cdc-a30e-f0f1b0f12193@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7d1e6ccc-3dc1-4cdc-a30e-f0f1b0f12193@intel.com>
X-ClientProxiedBy: SJ0PR03CA0332.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|CH3PR11MB8750:EE_
X-MS-Office365-Filtering-Correlation-Id: 338893f2-94ed-4302-90f4-08dcd749d7d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?zJTmxektkLCKIq05zBMaoQJBqfQHTkDiI/nrw6KwaI7gWg19EzNmpcqM37?=
 =?iso-8859-1?Q?3RK+C3csM4oKL5KMcwT0tXQYWXzzFZJzVc+aZdrYxpEwm2DaENyvs3wWly?=
 =?iso-8859-1?Q?co9fvofLrWs7pm4E1gNrf1Xc335szkhaUjFpztt1KtTTBqRxgnJSdcEKZg?=
 =?iso-8859-1?Q?S0/0I66/91B46jd0kvHkczPLXSEy8icHw7j48q0WXQYi0vSDevIxkdaQZs?=
 =?iso-8859-1?Q?AadqQw33Ky3osWL2a/jldHJlMvUmfeFvfw9Q+UfCaH/dFNOTdzJ20AH+86?=
 =?iso-8859-1?Q?d13YG0kK6Th7hPIWNqng4uWE57HhsTjwGvNacZDnT5NYKKtn6qeL5kjeYq?=
 =?iso-8859-1?Q?hNrb3hHE1YHLtiOiMEHh+OUZUHeMoXBg04slJOK9EJMlY0GVtq31hqt1tB?=
 =?iso-8859-1?Q?SyZCY9SJrZVfJW7kAkwORN853Ha/lh+p0R0DATDytFEQ8Dp0P4YguD/YoS?=
 =?iso-8859-1?Q?uABLZwLGugmEnl4XappjY9QfC31e3O07NgRGm2/aPmO+G+2u7Bwm9+Jvzl?=
 =?iso-8859-1?Q?b9SBhQoOF6cFqL5jgY4Qc5zGzzooZEtmlJPUKQkWy34P0PLeH04gNIKFFm?=
 =?iso-8859-1?Q?ho2kqvIPLPwPrX42uCQxsPx2Ir8rJmI0JW4ZlLH/46S0O+mTlo7jDNaPrp?=
 =?iso-8859-1?Q?Ln4s2gFX/ROYviOaCXddNeH2b8iJbxfEsVnKfaD21KLDUe/X65yPkjGZ3T?=
 =?iso-8859-1?Q?W+7ugebU1pYEWJiIN/sg5hBsAZ5jlEtAliJAIXiWmEdC9G+JTkK8eCfBKR?=
 =?iso-8859-1?Q?ZP00pwn/J/xuGmx7kKkDPGIijTQ8p54WrBpIX8knrfsS/ZkKuPkflRaSI3?=
 =?iso-8859-1?Q?u30P8Tf0ndHT5nhffjS9CpUDj++ZWyRk4GIQjaoQUal1pF7svHn2M9vEPN?=
 =?iso-8859-1?Q?zPAjQc+Gev1A/Nf92B8gW2MlEomDs0xUpAdKRXnfHE/2iIZHv+JUYVJmhW?=
 =?iso-8859-1?Q?t5POdnlLsKarjJ53pjOwZks9wjsLk2S5yz4U5HAKmhuSgAwIyXugwHj4he?=
 =?iso-8859-1?Q?AEhuOysHa68wQoyQPoMw5aBCHfKj1jaqFPfaumRYLvX6tbqTl3YfyPwpu6?=
 =?iso-8859-1?Q?I5g4dm4aPeaXQ4S8Mj+XxcTTre37jM0ude+icODicVjgqx1jYLVrlmrX1T?=
 =?iso-8859-1?Q?5LLtST3xBr1MGyxvbOYj9EKXg+V+Kz25OJNCBocV8iwJsHm5vsBJbp1Ftz?=
 =?iso-8859-1?Q?mmUyjfD+TFuRwAmxPjfSMUgPawVlxYuXjLfJguOLO2kQisUT7biaT5SQFc?=
 =?iso-8859-1?Q?AuosMiPcb9aXz+wHNytDajbMT9grZ/mGJHd5vlGgAzbIyabLBauYQ9gN00?=
 =?iso-8859-1?Q?Etd7u4MsFVcejjHdGB4n/0crhKWSMg1DvOOjNFRDIhuCKTe6cPtqF4UR5f?=
 =?iso-8859-1?Q?WqjtlQwzftHxyZd+JrF7UF7gXb5udHoAR6m0Idcj8cBOWIC8If8EI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?O78zWUxuniUxDjb0Ba/vHvzj0edKaysFvSAjVAIqoJrNpAnLFqR5EJ/ow6?=
 =?iso-8859-1?Q?42OvOdbRgDVdaVQixF4UlzwsCZgaJ+4O9HZQw7ZCPtgAEhM3vRWzjJCJaE?=
 =?iso-8859-1?Q?nSUiUcyARWGql6hg9pC3IcuOBzTVwmqH8gnSaeSooi2WizHVmzFlNCHJzZ?=
 =?iso-8859-1?Q?UfOFmtiPI/wwgaqmoLkBy67kvwvfdo1igotyuD6ogYo1rKYd7Jg0zs/UxD?=
 =?iso-8859-1?Q?/UDq7Fl+qpWeI/httKqq3UCfzw2uak4yb6bi9fE4SF/B/hfFj8JL45hBeX?=
 =?iso-8859-1?Q?hR26WhLb8xi+ID33K8vuToXog/5QcK4Huj25m4NlTHNXo9qObHKLIdObKc?=
 =?iso-8859-1?Q?wOLN8J4sm8eg7DHC0hLoCl4xVvf95q0DC3NNqsIIYFtL7zu09V7mjzoNNB?=
 =?iso-8859-1?Q?mOURFpjSAlLVmWvnkRzAMt0jbb9AAYerjF6j+6dlMdpgV1KP4LTiAgq4Mq?=
 =?iso-8859-1?Q?cwV8sYhCOZ5wZilckyJsnjjbeAFAv7ByKx5DrCxuOlQaR4Pj6oahOXdHLs?=
 =?iso-8859-1?Q?RGGRl6itgx1M00HafNE7Tu3HiwV6zM2xv1f+NOcWEiivZNL4T98n7azS4J?=
 =?iso-8859-1?Q?Fiji+N2V0mNByzSNsombgsiB/zu+fzjx418OaZqcLQPCCfTXVuW27OgnJG?=
 =?iso-8859-1?Q?fhDCS093v6onJLD9smXBqKikPcQBEUqUlhov4E7Z4esJ0W0/VQxln/yyOW?=
 =?iso-8859-1?Q?rhsnQrAW+fmKAGRX+HJpcDaMMyD265ZkUmEw8A9DMJ2A5RGaLDKn9MeJe0?=
 =?iso-8859-1?Q?4sMyU4+9lxCYQt6xoceqClXgITrugA6fHUx2yKmotwJfLyoK5SgRzKwp6f?=
 =?iso-8859-1?Q?dAyxhSFSEUjRUAiYKY9C9BVjNZbVifO9zvG2nbIlKYZOkn5+/QVjOl5dER?=
 =?iso-8859-1?Q?KFJnBuf4KzJfpCT/0VKqISuHLux8Wd1x/aTBLpK5ia0hKD1TiBOYEW6WbB?=
 =?iso-8859-1?Q?CMBKoaKIQgG+lEEJW1sgu1hFQlHJcB+e5FEDY/sqEI+79aJZit2ADDVkW0?=
 =?iso-8859-1?Q?+Xb0n728kovmWXScHBZ7dM/jN1iaWbbSkz0e25q/Y9JBWrhg2jPPxKZW0z?=
 =?iso-8859-1?Q?0W3S7wtPs3TYVwZ/Hl8vvA1VvCHeA4uAkNwFG0isGGFo6XEwhjCpFaK/Q4?=
 =?iso-8859-1?Q?gJdBKMAk4BALi9WvGa3ggOafnPlsTWR+QNTkrKjZiAkyzPcOc7aSy5IoGW?=
 =?iso-8859-1?Q?GgyYEkPBWakEkKUI721GJFc412UFkR1xgNR71aLbQebHKLnRjkt6o3bn7p?=
 =?iso-8859-1?Q?kwB8Vjq1/VhepYhGRO7QwoItyHoNvQfn8rRoNOkIc29BRp1jTAYclRsaN5?=
 =?iso-8859-1?Q?uYsQJ/lBUs0c9B0vb7pf0tvXDpdP9hsARwTNRMuLcWXRlD+EVyLv0GpT5I?=
 =?iso-8859-1?Q?BtJkzq7ID38aJiovUb8VxbqW2YUV8/QbtajcSys2BxGCIb1JQf5NvtCgR2?=
 =?iso-8859-1?Q?EyFvsd86P6UGNQ1BTOFo85mxwxQVIwK2cA4JKYkAgQCc0bWb1kmU6b83J5?=
 =?iso-8859-1?Q?B88jFXXnERsZ9XBO6ip1eX+mGUHlaRubpLcjC7izKz3BGb4MLBFxgRr4ke?=
 =?iso-8859-1?Q?pIDVZFV9nMVqNbTfnmRDfZhm1nDHXIqYOnhJeLMiEvNtHqqjmrONHWu8V7?=
 =?iso-8859-1?Q?VN8U6ZGMVshrHKWwSre8gzCcMHutcBqe2Meli1k72TXZG3l3GMlQAOlQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 338893f2-94ed-4302-90f4-08dcd749d7d5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2024 18:52:13.4955 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aD/QOe8u01lVX1Jz6gpQO0fICdDvXPJrdDboSz9zpgIEMepQpR/8O5XiBmA/gPRShQEekqmUOIbDJIX1auYi9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8750
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

On Tue, Sep 17, 2024 at 11:18:47AM +0530, Nilawar, Badal wrote:
> 
> 
> On 13-09-2024 18:47, Ghimiray, Himal Prasad wrote:
> > 
> > 
> > On 13-09-2024 16:56, Michal Wajdeczko wrote:
> > > 
> > > 
> > > On 13.09.2024 05:59, Ghimiray, Himal Prasad wrote:
> > > > 
> > > > 
> > > > On 13-09-2024 03:01, Michal Wajdeczko wrote:
> > > > > 
> > > > > 
> > > > > On 12.09.2024 21:15, Himal Prasad Ghimiray wrote:
> > > > > > If an acknowledgment timeout occurs for a domain awake request, do not
> > > > > > increment the reference count for the domain. This ensures that
> > > > > > subsequent _get calls do not incorrectly assume the
> > > > > > domain is awake. The
> > > > > > return value is a mask of domains whose reference counts were
> > > > > > incremented, and these domains need to be released using
> > > > > > xe_force_wake_put.
> > > > > > 
> > > > > > The caller needs to compare the return value with the input domains to
> > > > > > determine the success or failure of the operation and
> > > > > > decide whether to
> > > > > > continue or return accordingly.
> > > > > > 
> > > > > > While at it, add simple kernel-doc for xe_force_wake_get()
> > > > > > 
> > > > > > Cc: Badal Nilawar <badal.nilawar@intel.com>
> > > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > > > > > Cc: Nirmoy Das <nirmoy.das@intel.com>
> > > > > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > > > > ---
> > > > > >    drivers/gpu/drm/xe/xe_force_wake.c | 35
> > > > > > ++++++++++++++++++++++++ +-----
> > > > > >    1 file changed, 29 insertions(+), 6 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/gpu/drm/xe/xe_force_wake.c
> > > > > > b/drivers/gpu/drm/xe/xe_force_wake.c
> > > > > > index a64c14757c84..fa42d652d23f 100644
> > > > > > --- a/drivers/gpu/drm/xe/xe_force_wake.c
> > > > > > +++ b/drivers/gpu/drm/xe/xe_force_wake.c
> > > > > > @@ -150,26 +150,49 @@ static int domain_sleep_wait(struct xe_gt *gt,
> > > > > >                         (ffs(tmp__) - 1))) && \
> > > > > >                         domain__->reg_ctl.addr)
> > > > > >    +/**
> > > > > > + * xe_force_wake_get : Increase the domain refcount; if it was 0
> > > > > > initially, wake the domain
> > > > > 
> > > > > while likely this is still recognized by the kernel-doc tool, this is
> > > > > not correct notation for the function() documentation
> > > > 
> > > > 
> > > > I assume you are suggesting %s/xe_force_wake_get/xe_force_wake_get()
> > > > will fix it.
> > > > 
> > > > 
> > > > > 
> > > > > [1]
> > > > > https://docs.kernel.org/doc-guide/kernel-doc.html#function-
> > > > > documentation
> > > > > 
> > > > > > + * @fw: struct xe_force_wake
> > > > > > + * @domains: forcewake domains to get refcount on
> > > > > > + *
> > > > > > + * Increment refcount for the force-wake domain. If the domain is
> > > > > > + * asleep, awaken it and wait for acknowledgment within the specified
> > > > > > + * timeout. If a timeout occurs, decrement the refcount.
> > > > > 
> > > > > not sure if doc shall be 1:1 of low level implementation details
> > > > 
> > > > Does this sound okay ?
> > > > This function takes references for the input @domains and wakes them if
> > > > they are asleep.
> > > > 
> > > > > 
> > > > > > + * The caller should compare the return value with the @domains to
> > > > > > + * determine the success or failure of the operation.
> > > > > > + *
> > > > > > + * Return: mask of refcount increased domains.
> > > > > 
> > > > > if we return a 'mask' then maybe it should be of 'unsigned int' type?
> > > > 
> > > > Agreed. Will fix in next version.
> > > > 
> > > > > 
> > > > > > If the return value is
> > > > > > + * equal to the input parameter @domains, the operation is considered
> > > > > > + * successful. Otherwise, the operation is considered a failure, and
> > > > > > + * the caller should handle the failure case, potentially returning
> > > > > > + * -ETIMEDOUT.
> > > > > 
> > > > > it looks that all problems with the nice API is due to the
> > > > > XE_FORCEWAKE_ALL that is not a single domain ID and requires extra care
> > > > > 
> > > > > maybe there should be different pair of functions:
> > > > 
> > > > I am not convinced with different pair of functions:
> > > > 
> > > > In current implementation:
> > > > 
> > > > int mask = xe_force_wake_get(fw, domains)
> > > > if (mask != domains) {
> > > >      Non critical path continue with warning;
> > > >       or
> > > >      critical path:
> > > >          xe_force_wake_put(fw, mask);
> > > >          return -ETIMEDOUT;
> > > > }
> > > > 
> > > > do_ops;
> > > > xe_force_wake_put(fw, mask);
> > > > return err;
> > > > 
> > > > Above flow remains intact irrespective of individual domains or
> > > > FORCEWAKE_ALL.
> > > > 
> > > > In case of individual domains if (mask != domains) can be replaced with
> > > > (!mask) and user can avoid xe_force_wake_put(fw, mask) in failure path
> > > > since mask is 0;
> > > 
> > > so maybe we should have (by reinventing i915?):
> > > 
> > > // opaque, but zero means failure/no domains are awake
> > > typedef unsigned long xe_wakeref_t;
> > > 
> > > 
> > > // caller should test for ref != 0
> > > // but shall call put if ref != 0
> > > xe_wakeref_t xe_force_wake_get(fw, enum xe_force_wake_domains d)
> > > 
> > > // safe to call with ref == 0
> > > void xe_force_wake_put(fw, xe_wakeref_t ref)
> > > 
> > > 
> > > // helpers for critical work that must be sure about domain
> > > 
> > > // compares opaque ref with explicit domain != ALL
> > > // can be used by the code that obtained the ref
> > > bool xe_wakeref_has_domain(xe_wakeref_t, enum xe_force_wake_domains d)
> > > 
> > > // compares fw with explicit domain != ALL
> > > // can be used by the code that does not have direct access to the ref
> > > bool xe_force_wake_is_awake(fw, enum xe_force_wake_domains d)
> > > 
> > > 
> > > // helpers for checking correctness
> > > void xe_force_wake_assert_held(fw, enum xe_force_wake_domains d)
> > > 
> > > 
> > > then usage would be:
> > > 
> > > xe_wakeref_t ref;
> > > 
> > > ref = xe_force_wake_get(fw, d);
> > > if (ref) {
> > >     // ...
> > >     xe_force_wake_put(fw, ref);
> > > }
> > > 
> > > or:
> > > 
> > > xe_wakeref_t ref;
> > > 
> > > ref = xe_force_wake_get(fw, ALL);
> > > if (xe_wakeref_has_domain(ref, d1))
> > >     // ... critical work1
> > > if (xe_wakeref_has_domain(ref, d2))
> > >     // ... critical work2
> > > xe_force_wake_put(fw, ref);
> > > 
> > > 
> > > so above will be very similar to what you have but by having explicit
> > > types IMO it will help connect all functions into proper use-case flow
> > 
> > 
> > Agreed implementation/usage will be same, will use explicit type for
> > clarity.
> > IMO typedef unsigned int xe_wakeref_t is sufficient instead of
> > typedef unsigned long xe_wakeref_t;
> 
> I agree with this.
> 

What? Really? I thought it was pretty clear rule in kernel programing
not use typedefs [1]. Reading through conditions acceptable and I don't
use anything applies to this series, maybe a) applies but not really
convinced. The example in a) is a pte_t which can likely change based on
platform target whereas here we only have one target and see no reason
this needs to be opaque.

Matt

[1] https://www.kernel.org/doc/html/v4.14/process/coding-style.html#typedefs 

> Regards,
> Badal
> > 
> > 
> > > 
> > > > 
> > > > 
> > > > > 
> > > > > // for single domain where ret=0 is success, ret<0 is error
> > > > 
> > > > This leads to caller only calling xe_force_wake_put incase of get
> > > > success. so in case of caller continuing with failure, he will need to
> > > > ensure the put is not called.
> > > > 
> > > > for example:
> > > > int ret;
> > > > 
> > > > ret = xe_force_wake_get(fw, DOMAIN_GT);
> > > > XE_WARN_ON(ret)
> > > > if(!ret)
> > > >      xe_force_wake_put(fw, DOMAIN_GT);
> > > > 
> > > > > int xe_force_wake_get(fw, enum xe_force_wake_domain_id id);
> > > > > void xe_force_wake_put(fw, enum xe_force_wake_domain_id id);
> > > > > 
> > > > > and
> > > > > 
> > > > > // for all domain where ret=0 is success, ret<0 is error
> > > > > int int xe_force_wake_get_all(fw);
> > > > > void xe_force_wake_put_all(fw);
> > > > 
> > > > In case of xe_force_wake_get_all(fw) failure, how the caller will know
> > > > which domains got awake and which failed ?
> > > > 
> > > > ret = xe_force_wake_get_all(fw);
> > > > if(!ret)
> > > >     No way to put awake domains to sleep
> > > 
> > > in case of failure, it would be the responsibility of the
> > > xe_force_wake_get_all() to put all partial awakes immediately, since it
> > > failed to awake all requested domains (same as in single domain case)
> > > 
> > > but let's drop this idea
> > > 
> > > > 
> > > > > 
> > > > > and
> > > > > 
> > > > > // input: mask of domains, return: mask of domain
> > > > > unsigned int xe_force_wake_get_mask(fw, mask);
> > > > > void xe_force_wake_put_mask(fw, mask);
> > > > > 
> > > > > this last one can be just main implementation (static or public if we
> > > > > really want to continue with random set of enabled domains)
> > > > > 
> > > > > > + */
> > > > > >    int xe_force_wake_get(struct xe_force_wake *fw,
> > > > > >                  enum xe_force_wake_domains domains)
> > > > > >    {
> > > > > >        struct xe_gt *gt = fw->gt;
> > > > > >        struct xe_force_wake_domain *domain;
> > > > > > -    enum xe_force_wake_domains tmp, woken = 0;
> > > > > > +    enum xe_force_wake_domains tmp, awake_rqst = 0, awake_ack = 0;
> > > > > 
> > > > > it looks that you're abusing even more all enum variables by treating
> > > > > them as plain integers
> > > > 
> > > > Miss at my end. Will address them in next version.
> > > > 
> > > > > 
> > > > > >        unsigned long flags;
> > > > > > -    int ret = 0;
> > > > > > +    int ret = domains;
> > > > > >          spin_lock_irqsave(&fw->lock, flags);
> > > > > >        for_each_fw_domain_masked(domain, domains, fw, tmp) {
> > > > > >            if (!domain->ref++) {
> > > > > > -            woken |= BIT(domain->id);
> > > > > > +            awake_rqst |= BIT(domain->id);
> > > > > >                domain_wake(gt, domain);
> > > > > >            }
> > > > > >        }
> > > > > > -    for_each_fw_domain_masked(domain, woken, fw, tmp) {
> > > > > > -        ret |= domain_wake_wait(gt, domain);
> > > > > > +    for_each_fw_domain_masked(domain, awake_rqst, fw, tmp) {
> > > > > > +        if (domain_wake_wait(gt, domain) == 0) {
> > > > > > +            awake_ack |= BIT(domain->id);
> > > > > > +        } else {
> > > > > > +            ret &= ~BIT(domain->id);
> > > > > > +            --domain->ref;
> > > > > > +        }
> > > > > >        }
> > > > > > -    fw->awake_domains |= woken;
> > > > > > +
> > > > > > +    fw->awake_domains |= awake_ack;
> > > > > >        spin_unlock_irqrestore(&fw->lock, flags);
> > > > > >          return ret;
> 
