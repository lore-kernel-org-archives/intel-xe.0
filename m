Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFF2EC4345F
	for <intel-xe@archiver.kernel.org>; Tue, 16 Apr 2024 17:03:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7400F10E352;
	Tue, 16 Apr 2024 17:03:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dWEq1tBW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FFD010E352
 for <intel-xe@lists.freedesktop.org>; Tue, 16 Apr 2024 17:03:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713287004; x=1744823004;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=KtcUrUf6KNb7IMlEvrM5fRSFPyWujYvaVQtiuSX6IrE=;
 b=dWEq1tBW+uG5a9pgRYMzHAoI6iK+7OEiPAUyiPQpO+Hkb882BpoTv6PU
 S17k1NCb/ds1Ge+9TFsLQPmZ9xohRyc2TZvBDqzs2qznEmSOtjZUXyDUi
 E7fHy6eii3I3XWUP75yOx7+HKUhn/rsoIM43iAMHcoJC96c62Ti1ObXCc
 xx/etp8BGvH+K7lKSrXv665Db52UQYPeqlM9EP6MPFHnu1EuSgByLqHKV
 4mlnAa661R5D/xTrnThY8ys5K+4Muc7vV4+hI10Xd4KuZoyL5muyu5Qm7
 BCkEvsce/adnEV9vQhidOOmJdFnPcOSgbOqYY8sIBAUvfdpcj3kQwGKoj g==;
X-CSE-ConnectionGUID: qLDNi2Q7QReWjjZgI9pCUw==
X-CSE-MsgGUID: /Mj2H7+yQbeox3v3ab9JWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="8605551"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; 
   d="scan'208";a="8605551"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 10:03:24 -0700
X-CSE-ConnectionGUID: xygQHAPeTVapRqjYESJn0Q==
X-CSE-MsgGUID: GkRj0zXeSMWXSfNG3zj/Iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="22729389"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orviesa006.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Apr 2024 10:03:23 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 10:03:22 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 16 Apr 2024 10:03:22 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 16 Apr 2024 10:03:22 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.168)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Tue, 16 Apr 2024 10:03:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZA9eadnoTHh7J/EfdBTRPTRvv7MeJzHrCmPrBiMq2DQcMiNevEO/lTqrb+NFqUWIHI1Lm+R/dyWzeYzLWIU9RkdnQ8aq0i8lmJqZzIhXHOxh0RQQkDWziqtfm08nBh3xalUFF24IKu/QT7bkHTQKQRykfuexRepPPGJpEs7NZkuzHNqnX4VmWDF4hn+nctwKQBsVvW7RXQqFxdLvzNO059NPx7aMVb9JrDg2Rdqz4TDHJr6BiPD5T5r7bU8pakoXKeY0Luv9x4usfFGYaLzSTN8Fu2oKceMxKG2BT08iof/7RKznLFbtfvd2c0RmHwQ0cr6Tq8c5UF00fCIbk2TuRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6MtD3ymdOWHZYSk5GohrD+yGsWME9vUemGTYqVhymg=;
 b=Y1j7Yf8dIPi9HXIMDPye7gvRwzL4sWkl5iXr1Iao5Av+4uH5uedFz3RCU0jNYm5KzM5MWQMQzlnJ8rhXfwTJsD309IPd/gWcqvQ1ap1kcpYUGeOplKpv4N1g79xGKq3JETf8YWv42Azv+qacJ3Z/5fdxhi48gGT2PgQK25c0BbTsebBMaHmwW35xjeVSsOdBKzw2D4ewxEg2QD05mcTSxUqdNo2TAN4CWCWsPw5q4UWwQL6ZuSZs+KfccLBVUglMk/VKk5rK0vCPlvoRETDjYgozU3wqIN75mLcPIrCz83iPRWilEuzaYOo8AtorjU4fV2Un4qA2v02cOB9K3iaDLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB6523.namprd11.prod.outlook.com (2603:10b6:510:211::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.31; Tue, 16 Apr
 2024 17:03:17 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::e9dd:320:976f:e257%4]) with mapi id 15.20.7472.025; Tue, 16 Apr 2024
 17:03:17 +0000
Date: Tue, 16 Apr 2024 12:03:14 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Ashutosh Dixit
 <ashutosh.dixit@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Thomas
 =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Anshuman Gupta
 <anshuman.gupta@intel.com>, Himal Prasad Ghimiray
 <himal.prasad.ghimiray@intel.com>
Subject: Re: [PATCH 1/4] drm/xe: Introduce a simple wedged state
Message-ID: <hrq5thk2rh5nw3pccmjsavi2jn3reb5lu6aqmauz6hjop5vcrn@oi6eo7vmmm6r>
References: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240409221507.1076471-1-rodrigo.vivi@intel.com>
X-ClientProxiedBy: BYAPR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:74::40) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB6523:EE_
X-MS-Office365-Filtering-Correlation-Id: 4e9685d5-26f4-4575-585e-08dc5e371c48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EviivF3Yng7HryoacHRujMLp6jjq6Sckq/Yvc/amBGM3nkAuR74LFIkLP0CwJOs1niE1qO+lCtUBd6aVOi1VKB68BOFEZxKfBm/LjDZ7quKLMOAEa5otVpPRhL/9s8eeuEtspO1xcU0z5YmGSCEZHV00M08Zqdt0ksnxGICaRCBAPUIn3FwHkSQmS/zDoisuLa9QD5M52TxmlLJ4bl0DsB+Wwdx7XTYaaXQuc/mrEGd4sSW84k/HOHDdEIkz1LAVNcaM0GVESGw9tpqDwY0Z3x4WoB3idh7jdzlMC4qZmp8Vnkbi5QDDnsMGpW8ptOkDRlXe4frjjQEz02Tgp/x8fRoTLMypAm+9eF58myklcpi9MtzRS5by1YxgThq/UWH0thMfZu/46br6POsfy1ZqL0kBg7k+i6Bn92sARvEDnFHLHRVwbmG/blR1/Wid9Y110r+v1LLNJg8s9K7+DerIB9eEZidtiG041fjJdv/eA/N4snVCyNuTlI/IATzC0RKXHGndz4gmCyY+0zUkCLbO6LPmkbb0/xvcdvLwiFzmUXtNJQ18+Rtq0kbOWkfMVE8J5EKXR2fbJ8rInBVE4ziiPigEuuYWK3fCQYFXMZi5C4cNR/Do0wn49cMsgTqlwi+Yi053Zo7KfPnrUqG86qAHDShebNsF9dDI6yWb5K35wr4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?dUhrv52BLf34T9/st7W1rU0i4eoEAlrHRHRYt10rkdb8sV2HoD0XmL6oLT?=
 =?iso-8859-1?Q?YAI9kfWi9nHdyrvgZXervfIdz7kXRybj9nwpGu57AGj+DzRoC8zrONWLgy?=
 =?iso-8859-1?Q?p9SggX9TPYDZxa353SZnvkTfn/8WecBcq3Tk0BzodZ/IgSPoZwrIso9dGC?=
 =?iso-8859-1?Q?wDPYuHBdVlY5U92aPeW0dgSGrIrkR43ZxjjlexQJUYvkemUtWPfP0+DaWl?=
 =?iso-8859-1?Q?5v9sYEFKaxU1a6JZyK0RPg4uOJXGj2CN1n1xPgY2G7No6CE3T09COY6gSf?=
 =?iso-8859-1?Q?VGH+s5TKIYduY/nHicffrLSeW8tKKATpZd1AH6S3ysIkCP9nKAT6TiLD52?=
 =?iso-8859-1?Q?Q3bmZZFoblwJYyR++3vF1iaerFlUMqs6JzfZ8CG3Npk+DW8Sgf5jW0IB7f?=
 =?iso-8859-1?Q?t1tRgdN6catRkbKh+ESpnv4d9CkLdfYnvSYl9se1+sQoo69l/5TAEkh4LZ?=
 =?iso-8859-1?Q?7GEzy9VAyfljBs3Mpgv/aSoL/x4OQdelreA7Jj7knsB61S/x/ZjT1lIU4Z?=
 =?iso-8859-1?Q?DteGh/GbTF0FSZeDb/NOfP6R/FqCNnuwKiW1tl3KTa5uROECoshjKTgKlM?=
 =?iso-8859-1?Q?ntmBEiH7SrNAVCtBKYtsIOeI7PpQKEfq1hhQiYpTEG0/mFWBx6edzg9X67?=
 =?iso-8859-1?Q?6+JN9AvQH9/z+ldXunFtn7SjYDKANjEFnIeCOsKmwEhPrnrjV8C3wLTeHB?=
 =?iso-8859-1?Q?VzICDsR6EOGinw6I8e/E14cujkWX7GHP8FBDwheUPsYKGOxrFd0ccuFq6a?=
 =?iso-8859-1?Q?FluLYgbMHzCvRLbSqwyP/mbgjfRBVmZ8FHcSmvg0D1QwkWBrNYEkihxwVV?=
 =?iso-8859-1?Q?FLhxNleo4M5h/5XIUZgTVGJ/3v2MDoNyuefRZqMtugn0Q4vR/vyj5MlLLq?=
 =?iso-8859-1?Q?nHF8U3PIP9Y29Xzs4oAvqDumEyJn9CaKFgt5LzypwnpzLj134D1Sp0Dkkz?=
 =?iso-8859-1?Q?bUqAPJG6G3ZDVUBROVygze5TvMj3HQuNbeDwz1j74oE8tBA1KJakRAypse?=
 =?iso-8859-1?Q?41CnLWFQk+WPQzaDql4SgkjH85ccZiHhpVx8ctvb0o4w1kUj9ipzlP9+qK?=
 =?iso-8859-1?Q?DnGXmd8wM1ozzqoAiKepo1rOnaqJULyXvE+NfW+RYpM8HgmieRm/Pb58Cy?=
 =?iso-8859-1?Q?WwrXWXzVra5HzbQFUDPsBLmbYU/5dAuAcccOfFtiznVzdSokPZAqkxKR0h?=
 =?iso-8859-1?Q?p4BK8XPZyYoccOuPPVMJWdStCYzLeljNGD4D0aYDlqqilqT7zgRI/nBf+p?=
 =?iso-8859-1?Q?sKx5Jq3WPNigVHAn6Yadc9l/NpVd5SsfGWeHno2kkouN0hm9Qa2dt6Z0v+?=
 =?iso-8859-1?Q?BAqpsrFctYKw7+CfUBHvbk0gx857vzAHPvVzhmRo9TfzZTaiQ6uVAUIBV2?=
 =?iso-8859-1?Q?CxZbEgHy/WG3vMMCLzA/mO/HcYT53KzqFqZ+iJNnBR5wAHQNEw/L2ffO+8?=
 =?iso-8859-1?Q?eYWdy+wrD6gzL7ibNii4WqAOm5CWG6nkd/uePxtmgX1Vx1N31qKnRoiUF3?=
 =?iso-8859-1?Q?lN3Omt+BWW/N+rTi7U5db5b33iIpdopotr3LSJ5ZXoiwwvbYfwyExQLkP9?=
 =?iso-8859-1?Q?sGl7AjWO0YzD0I+oHFiySLBRYOq0h6g9c00+92w+CUDLm9LMRGyYcsHvSJ?=
 =?iso-8859-1?Q?PfpZdjjzve2ZN5ZVIdFJgWLFHA0RCweLzpRiVYm1ysj3hlX55JzSnnzQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4e9685d5-26f4-4575-585e-08dc5e371c48
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 17:03:17.2884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6uPEzSfpsnIFBue6iQQd+xD3nGGemlhYdmOuU59bSc/dQyOc7rDmy44X7e6ch8KUDhbMSywaCoxbgsWsRYbsS3pS3WfzAHi04KxBuxU/1xg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6523
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

On Tue, Apr 09, 2024 at 06:15:04PM GMT, Rodrigo Vivi wrote:
>Introduce a very simple 'wedged' state where any attempt
>to access the GPU is entirely blocked.
>
>On some critical cases, like on gt_reset failure, we need to
>block any other attempt to use the GPU. Otherwise we are at
>a risk of reaching cases that would force us to reboot the machine.
>
>So, when this cases are identified we corner and block any GPU
>access. No IOCTL and not even another GT reset should be attempted.
>
>The 'wedged' state in Xe is an end state with no way back.
>Only a device "re-probe" (unbind + bind) can restore the GPU access.
>
>v2: - s/wedged/busted (Lucas)
>    - use unbind+bind instead of module reload (Lucas)
>    - added more info on unbind operations and instruction on bug report
>    - only print the message once.
>
>v3: - s/busted/wedged (Ashutosh, Tvrtko, Thomas)
>    - don't assume user has sudo and tee available (Lucas)
>
>v4: - remove unnecessary cases around ct communication or migration.
>
>Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
>Cc: Tvrtko Ursulin <tursulin@ursulin.net>
>Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Cc: Anshuman Gupta <anshuman.gupta@intel.com>
>Reviewed-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com> #v2
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com> #v2

my r-b remains for this version.

thanks
Lucas De Marchi
