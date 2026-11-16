Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B23606A329
	for <intel-xe@archiver.kernel.org>; Mon, 16 Nov 2026 09:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=NauZGw0X;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=kIQQ+dWn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C8710EE08;
	Mon, 16 Nov 2026 09:45:49 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C37710EE08
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Nov 2026 09:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794822337; x=1826358337;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=TmOBn0cW1Z19DF1LTIMPa0YBIzEZZYxwZFBgiFuqmS0=;
 b=NauZGw0XMXaNKemQmqqUIyO75xLnlQINzVXiDVFaQHHw7U+ZI7oAyPt4
 4N9ONla2qJr9eGjsRlogUB+jMvEGBfzGdqQklVk9tx30c2axax3RQhxuk
 fl4Zoim7XR9slpeSbM/zRBL6Pvj+IxiEZPGjSS9c5Ls870M6takaz6NBR
 6n0wAX/I0YidHdOMd5TqIoyFHJTlrVJnUGIJyZ6RmXM0Q95a5GSa4FHtn
 1OaN7QplHety2vyXwzxD2JqL6vB94oN/zfwrznJdtiyEA2Aa6kl+C/JXX
 tMKM/ebLZsd/1YmBYUJXoZ9IV2Y9sERGo2NzXSwMfw2cYu9VdryJC5oS8 w==;
X-CSE-ConnectionGUID: AgfUjCkcSlilHwet2Gq+kQ==
X-CSE-MsgGUID: Bh5/gW0jQz+QYyIDw930AA==
X-IronPort-AV: E=McAfee;i="6800,10657,11967"; a="3589395"
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="3589395"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:45:37 -0800
X-CSE-ConnectionGUID: vZ2CUHAqSzuNLCId0Al77g==
X-CSE-MsgGUID: iB6icV9iSFuR0RTRh7lj8Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,216,1787036400"; 
   d="scan'208";a="9665060"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2026 01:45:36 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:45:36 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 16 Nov 2026 01:45:36 -0800
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.5) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 16 Nov 2026 01:45:36 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjPNZ8sk6H9CHY3OVb1xhn3dndSeKu7mTx+PzkhQ+ECDomoXHefKyEOfVyKYL93DEtHmxOVDxgNzZ734gzeAim1Jg3I12qUJQy8jE46o2cnSLBijQfyvS0I8AJmLYmpWWw+YrviDlV9bs+d6u9K3CtPR6Ox2lz4qBAvkOBaPDMXgDzozbqiQfPUhoElMD3JYQY5kkeaWY7GxlmliVsj+tw2ej72BEEWLnogX1NpfsbIVgtq0RsOHYuApAc4g6j8dJ/MzlgiJJiNt96kvYqx3Ri48a643d94UzE6UyQYhr6FFT46S5mxvznMSyL9qoFrGa3Z8q0BE/Itsz/8Fz0pEaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rodWWP9pAfeptppYO0yHf447g+54Q7xfif5nDQwQPBc=;
 b=lQpsMF095K4knkYtm+l/llcT0GrX5HHi5SiLmfHsh6MVpVRUgZ9d1tXuyA8XDv0xa5YgmOtcczED6bFu8uoNe8GvLl13eb6KmT9ObD7tet72tlk0a0zZCVf3QjS5lGfIq0+4VdMBzdmvCApKX4xvmK54ABgPkHZAnYbCw3YYCKEJtpDwL1sGRWBdpmXSh8XcqrO1IqfXOSWgfSv200cngAhjC2YmN3x/hzbO3duTUHEJfFFLdlmJE1srfSS4reIyL6YrhL5LGqUZp4YI/2GddyUZ9frRr5vtCzRhIHixr8AlIE4uciID7pyV+zOdldR31quQuUDxHqwdzy4iVhYmVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rodWWP9pAfeptppYO0yHf447g+54Q7xfif5nDQwQPBc=;
 b=kIQQ+dWnzaON5jk6qPrfOyKi1hfF+QhNTegdHD6sxjNhnUXhCgr7yBhftMRNJgUXPTs6zl86C8f1Xhv/lKnZWr44vWBLNT3AesFOBQxu2pVy7DlV1J37HNrdWW2NDYuHHmadt6B0/738Shbe83hhf+cDC/5ArCnA50J4EUbnHo0=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8039.namprd11.prod.outlook.com (2603:10b6:510:25f::18)
 by IA3PPFED21B01E3.namprd11.prod.outlook.com
 (2603:10b6:20f:fc04::cd) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 09:45:35 +0000
Received: from PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92]) by PH8PR11MB8039.namprd11.prod.outlook.com
 ([fe80::42df:f465:90a8:df92%3]) with mapi id 15.21.0615.012; Mon, 16 Nov 2026
 09:45:35 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Matthew
 Brost" <matthew.brost@intel.com>
Subject: [PATCH v4 1/7] drm/xe: Define partitioned VRAM manager types
Date: Mon, 16 Nov 2026 10:45:17 +0100
Message-Id: <20261116094523.2484301-2-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
References: <20261116094523.2484301-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: VI1PR0102CA0013.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::26) To PH8PR11MB8039.namprd11.prod.outlook.com
 (2603:10b6:510:25f::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8039:EE_|IA3PPFED21B01E3:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bb42268-dda4-4bee-36f0-08df43c65cea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|23010399003|1800799024|18002099003|22082099003|11063799006|56012099006|10067099003|261022105027099003|261028144727099003|261021121427099003|261009223027099003|261102123227099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: Km+dkSLLDowuGHf++CBze2WjboclXjoYI5AwmBnEIUMNhehGhEMgzNNXPNAfQGK9AmrscAfnXJBokBYTHCyj4jhPpEX/EgRPheAhVYYOj3edtdwRnhpf7O+Tseuckmc1rGA6BTfNxU/LPu9gXfjQPzaz5B4PvMF/dGPJ76S0Q0nuFYDs7UYDFtnpECRigIw7kxFcsnO1SSbtS9IkIz7l8RIa1YfRyXaLaQzwKCqMZgI6VtAubF5JJ59OCRu+H1w6c1J3jvH4IfSksyydKvqQerdhGnAXLdE63WVkXmVbsV/Uqoi1xPgagevZLatkvMwuj1/HsvlE7SxZoEIGuJWrI8fuocs2bfxJO2w4GsMnta4ebGCHdvTWaQFGn8c6UGm8S7G+0bK+0Vz1NX0NszjUKiwou0EymQ/AP72mjSY8esu1HFlmmmksRIvpm+IoyX3aWcJdloPda1EfpKXP3lO+Lg57KygFBc21hfAyGLyEb840sPC9qiVUeMlT2UIDfT5AeF1BON1Dc+meAreWil4dK2/yWTj4fU7/SCEXsEM50xz4fGGjx5/QyWwtLfjG64fzazNiZMjX6n+GKRXQMWS9nprzPoelev6SahTrRIeZkkZYo75TCzw/kQ5f61EFbaH1C4ci7XcrTbWbyrDuHuM8zMT6WSF82rexg++BchZycEQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8039.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(23010399003)(1800799024)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(261022105027099003)(261028144727099003)(261021121427099003)(261009223027099003)(261102123227099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L1U2WENXWEhGWkJyWi9jdnRpSWF1Y05SajZBZkUxVlNrQm02ZU5EaGZSU09y?=
 =?utf-8?B?OUJsSGxNczAzYytwZXprV29GZGkxVW9tbzFLSWJ3VHVDRTYwb2hOZDJEbEtC?=
 =?utf-8?B?VndzNVMrUW5ITW9LMWJRNXpoQXBaeis0cXhNU2t5bWtMMlRMQW04TlF0SXVC?=
 =?utf-8?B?ME1pQ2pueU96VFZRWlVzOUhMRWNndWV1enk4RWJLTXVlTnJtRVhzbWVCWmFL?=
 =?utf-8?B?VnZYUGdSZ0plVDMwN0NLQ1dEK1YwdWpTRDFsVVg1cjF6dXVDY0pCeEhPZlVJ?=
 =?utf-8?B?MFhPdVB4Y3lKK1RIT3MzKzZjYkxkL3pzWFZJbmE0eUczeER6bldpdzVUOFlM?=
 =?utf-8?B?R1VDNVRyRDhDWmRBS1ZWMXpEdFRReXEwMHZLeFJwK3BDN3NPQUlKNmxSdEpi?=
 =?utf-8?B?T2h0ajZkSHhSSlhpVjQvRkZxdldrcGk2NkRrcFFhVXoyWkg3KzRhUjdkWmZR?=
 =?utf-8?B?d0w0M3l5ZitxNHpsTEdXWHBoOUt5YkNYZzN4YmN1dnVHZERZbTlndHZWNDkz?=
 =?utf-8?B?WkxMOUxCYlBLK3Y3ZDh2cS9GZlU4QmZ3OGJnUkZUcmZqZDNwWXdtQ3JReVkx?=
 =?utf-8?B?SWg0WFVURUgrWGNHcUNXbzh2ako5dy9QQnl5alpxNFBVRTkvU1ZMc2pRMTRS?=
 =?utf-8?B?VGdsRURQOHMzekZHR2M2Rk9lR0lPWUpQTzFSQy9KQ1RNUjNCRUxMZmlKOWZi?=
 =?utf-8?B?Z2x5Zm94b3J0T2lSVlBUbzA1eXlGQWpXZDVXN3d5QWY3aUF3T2VtbWh3aURq?=
 =?utf-8?B?RXFCaUlEeGFLQUZWajRXSWNlTGRCZnc5ampDS1JyQ2psNnAyNzhIamZsT3VQ?=
 =?utf-8?B?a1pJbkRtQnZSdjNmMVJLQk1ENy82bDVGZ2Jvb281a1pnUmFFRTVRdWJWTmo2?=
 =?utf-8?B?Y01ueGRxaE1LNEYxYWU2ZHNqc0hrV1VsR1BJd2Q5TzhLK204SitPN3JXdEI0?=
 =?utf-8?B?OU1YMkY0MFZJK2loRVA0Nlg2eW1YUklab0Y1WGtFYnlRazZVc2hCaEI4MStS?=
 =?utf-8?B?UVVlRHVpcXRMa013amtoMnlETFZHV01VNVRyU0ZIYjhVUFY0OVNQc0hLYkFq?=
 =?utf-8?B?OEE1aTJQL2oxZE5ubEdmSFVqNkJjcUdtbGc3UiswNHFBYXFaa2pDSnRWYkNU?=
 =?utf-8?B?QnhJS3QrQTJwT1Y3S1BqdjBaRlNFSTNWL21vNFhCbnRQVWlYeTZNSXhmOEtx?=
 =?utf-8?B?QW9ZN3owSWFUUWYvRmVFcHZSRGZwazZsSHFCemhabzQ2b01DYmZuVDF0cFVG?=
 =?utf-8?B?czduczZiQWNNZlpGVHoxTEZVOVhyWEwvSlY0YzI2bUpyVlN2d2ZET090RWNS?=
 =?utf-8?B?NUIvSEhZbGJrd2lnQUlYK3k3aGd4QUJlSHUxNzFtcURxa1Zxc09WV0tlQXRE?=
 =?utf-8?B?YUhTbnE2dzlxSUZZMlBjOXhIZy9FMENjb0crVnBYeVVqckJWN2p1TXpRNmFX?=
 =?utf-8?B?bWcvM2hHNG1GYTdzOGZuOUY4VURnN1lJdmx5aDRLTElQVjRxZHRzOUxUakdB?=
 =?utf-8?B?dVp2bTM0dzluVUc4dUxIeTBjOHN0MjNuVGY0VXR3TXlxS05CVnZkSUNpMy8r?=
 =?utf-8?B?UFZlUHkxM2xPQTgvUk9KYU8yT1d4MW5pYS9qNkpsWlF0UjQwK2JsOTJ1UXoy?=
 =?utf-8?B?R3ppd3NjS1lrTW1YMGpzT3k0dWtySktpUC9rd0dKNnBhcUNWMG5WeFV4aHZ1?=
 =?utf-8?B?RzBPWmlWZ0VsRFVMd1NoQzNtOHg3T1drb2Qxd0ZGTFVhbGEzZXJUSFUxZTZY?=
 =?utf-8?B?UElXbThIcTdxOGtkamZLSEtENE55Qi8wVDVhOXN4bGJ3WU1iTDVCU0tnWDJL?=
 =?utf-8?B?aEZRUUdITXIrTXpXTEw0VURnb3pNRllJd3p6QXE2TXBTQTNqNkNMQXNUUnNS?=
 =?utf-8?B?dWdSbFEvS0kxbFNmYit1ZjFxdTZKa3VBN0QvaEk4RXpRSmlZWDR1WHpQYlBO?=
 =?utf-8?B?OWlRcURuWnpReXBVcmIyY0VWSStMWC9SYkgyeUxxTGVad2RkMy80MnFQWGhl?=
 =?utf-8?B?bXhGa3dQbW1yV3pFejIzUlFPa2xILzB6NmRnc1ZPTG1jbGQrczJFdTJ4ZXJN?=
 =?utf-8?B?eE4vemxxYmFlSG4rRFZDTU5NUUxmRTN3aXUvcENTRGZJUERqQVQ2TlZtV2VZ?=
 =?utf-8?B?d0t0d1ROcHBDYVJTa2pzbU5pVFo3SmFTZFhReU5oWFBybmdNY3p0SHprS21m?=
 =?utf-8?B?Zll3NHBGTEJPWkpmUGhtZ1ZHWXgyQS9UZnd4MUFsbXR4N3FXZ2l6K3VQaDVu?=
 =?utf-8?B?dEhITGtFVlJGR1VGamUxWTV4RjhSWTBFT2d3N2ZtWi9BeFBWenovYU1XazdR?=
 =?utf-8?B?bEpiQzY4VnBKSXdmcDVuaWtLbktRcU1pVWd2eGhxS25EMDJCTUJ2QkhvQ0ND?=
 =?utf-8?Q?CQ2aJgAORoMd6TCI=3D?=
X-Exchange-RoutingPolicyChecked: Dh6Ln6T/hsLeu82MX7A1IY4UYnxLGtxTMFslFqEwjia8N9osbZM0beHK9IkSXSq5v9LLKRWh4vEGufLt1m/gxWZotceh1AdCqfhb7mfWhTHpnpQgS18MG/GVzMIXM8Gga5HewXgwBUZrmARoHJMPi/dhauG9pmkOi0o+jEkazlGApTLbBwCZO+THxPzZzqNK270E43uAkAWq7Rjn5ouNMazDeV60hLRrJpJSAukN8u5iTeLMkKMK+KrFoOF5tgqskJ/5oQJTvUtsekV5w/ZRtsFky0iUT/l7qRDaeSeUUnasR1AhZvD6RI900Ph+TioOlLfOW1w8tCP8SEUnL3RlOg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bb42268-dda4-4bee-36f0-08df43c65cea
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8039.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 09:45:35.2054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OaFnEvtnIC5oCSy/73KAHGdl4K1EIkNR/hDwiJjW0pttsBfCRMLkCVKjnAWFqIBlSMA8CLBH0t0gOjVOGy7EBCrnDOhAEeu1SNVUPo7LHI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PPFED21B01E3
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

A VRAM region may need to be split into hard partitions, e.g. to keep
kernel allocations in a dedicated low range of VRAM. Expressing such a
split purely as a placement range would turn every VRAM allocation into
a %GPU_BUDDY_RANGE_ALLOCATION, which constrains the buddy algorithm for
what is really a hard, statically known split.

Describe the types needed to manage each partition with a buddy
allocator of its own instead. struct xe_ttm_vram_mgr_part ties a buddy
allocator to the VRAM pool it backs, the manager holds up to
XE_TTM_VRAM_MGR_MAX_PARTS of them, and resources and offlined pages
record the partition their blocks were allocated from, as buddy offsets
become partition relative.

Each partition also tracks the CPU visible memory allocated from it, so
that usage can be reported per pool purpose, and the alignment a
partition base must honour is defined next to the partition itself.

Suggested-by: Matthew Brost <matthew.brost@intel.com>
Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
---
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
index 4a2cd27a5b617..1da3c82b28585 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h
@@ -7,8 +7,46 @@
 #define _XE_TTM_VRAM_MGR_TYPES_H_
 
 #include <linux/gpu_buddy.h>
+#include <linux/sizes.h>
 #include <drm/ttm/ttm_device.h>
 
+struct xe_vram_pool;
+
+/**
+ * struct xe_ttm_vram_mgr_part - Partition of a VRAM region
+ *
+ * A VRAM region may be split into disjoint partitions, each managed by its
+ * own buddy allocator. An allocation belongs to exactly one partition and
+ * cannot span partition boundaries. This lets the manager allocate directly
+ * from the requested partition without resorting to
+ * %GPU_BUDDY_RANGE_ALLOCATION, which constrains the buddy allocation
+ * algorithm.
+ */
+struct xe_ttm_vram_mgr_part {
+	/**
+	 * @pool: VRAM pool backed by this partition
+	 *
+	 * Once the manager is initialized, pool->part points back here.
+	 */
+	struct xe_vram_pool *pool;
+	/** @mm: DRM buddy allocator which manages this partition */
+	struct gpu_buddy mm;
+	/** @used_visible: CPU visible bytes allocated from this partition */
+	u64 used_visible;
+};
+
+/** XE_TTM_VRAM_MGR_MAX_PARTS - Max partitions of a single VRAM region */
+#define XE_TTM_VRAM_MGR_MAX_PARTS	2
+
+/**
+ * XE_TTM_VRAM_MGR_PART_ALIGN - Required alignment of a partition base
+ *
+ * Buddy offsets are partition relative, so a partition base has to be
+ * aligned to the largest VRAM page size in regular use, otherwise an aligned
+ * buddy allocation is not aligned in the region.
+ */
+#define XE_TTM_VRAM_MGR_PART_ALIGN	SZ_2M
+
 /**
  * struct xe_ttm_vram_mgr - Xe TTM VRAM manager
  *
@@ -19,6 +57,10 @@ struct xe_ttm_vram_mgr {
 	struct ttm_resource_manager manager;
 	/** @mm: DRM buddy allocator which manages the VRAM */
 	struct gpu_buddy mm;
+	/** @parts: Partitions this VRAM region is split into */
+	struct xe_ttm_vram_mgr_part parts[XE_TTM_VRAM_MGR_MAX_PARTS];
+	/** @num_parts: Number of initialized entries in @parts */
+	unsigned int num_parts;
 	/** @offlined_pages: List of offlined pages */
 	struct list_head offlined_pages;
 	/** @n_offlined_pages: Number of offlined pages */
@@ -47,6 +89,8 @@ struct xe_ttm_vram_mgr_resource {
 	struct ttm_resource base;
 	/** @blocks: list of DRM buddy blocks */
 	struct list_head blocks;
+	/** @part: Partition owning @blocks, set on successful allocation */
+	struct xe_ttm_vram_mgr_part *part;
 	/** @used_visible_size: How many CPU visible bytes this resource is using */
 	u64 used_visible_size;
 	/** @flags: flags associated with the resource */
@@ -73,6 +117,8 @@ struct xe_ttm_vram_offline_resource {
 	struct list_head queued_link;
 	/** @blocks: Buddy blocks reserved for this page */
 	struct list_head blocks;
+	/** @part: Partition owning @blocks, set on successful reservation */
+	struct xe_ttm_vram_mgr_part *part;
 	/** @used_visible_size: CPU-visible bytes consumed */
 	u64 used_visible_size;
 	/** @addr: Faulty DPA reported by HW */
-- 
2.34.1

