Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A811D10854D8
	for <intel-xe@archiver.kernel.org>; Wed, 18 Mar 2026 09:10:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B15410E711;
	Wed, 18 Mar 2026 09:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="sT4qsHsB";
	dkim-atps=neutral
Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com
 [209.85.218.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DC5B10E77C
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 09:10:06 +0000 (UTC)
Received: by mail-ej1-f74.google.com with SMTP id
 a640c23a62f3a-b94062e85f9so47411866b.2
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Mar 2026 02:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20251104; t=1773825005; x=1774429805;
 darn=lists.freedesktop.org; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=03huxt4oynUT1355qRW2FMfKGuIDazVvmXTmtQppc9Q=;
 b=sT4qsHsB5s9kky9OqEAPsVhmqsY6f1uENiHTxzznaxlsuDBufxpjzsTFAcWfZ8tUFT
 KAKTyaM+MnQPRKb+3Gx2V0Y6qrGkIpRokAkII0bH14f1KKa48Xq6No0j4C9lWLag6IKM
 nKTbf2LPsbESEbo4yQHx8Vjsh3rQGWEORi/HnLelsnCpxyN+OT5Wg+weV5Rpj92MG60F
 mjOdZKlLirZfU57/AM7dbqu/84A99hZXceopWF+T0YCPI9R99sJcUdFjZuEiWqpluUxM
 l/p0/MLKA6T04VbYliy1eO6JylmWWauOpvWg18CLdF5IyBwAWORRX20mexcCinv3hLit
 dxMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773825005; x=1774429805;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=03huxt4oynUT1355qRW2FMfKGuIDazVvmXTmtQppc9Q=;
 b=gsdpRMa3J8xSkTj/8THJON/c9TRycntECgurcJn7Ase3D3PCXmKURNTahV7w6Ci2Rj
 Wx9JGGXdIpk7g3Y0CDiE3lqLZ9to1WDRT/DETmN8zT6lzVb/Ud5OkCR26hqE87e9AagA
 Yry92PNlSViZ5vs02kEd2QARCtugPiVu447kI0zBwaiC+i6n0cyMVZoBtz46Z6ekMR1C
 UIWJo/iF40AiRGqKO6VPi2gMz2fxdscZMzQBPxoSqY5lc0WkNF9wFA0nUxvJC5XRhERp
 4b8Xz23hTfZAddOUuJXc5pcobrkhCdpUnYq+yiFCoMBqsucqiCTeKXwzCRPRHtKE/xuM
 YQ0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUa9miecHgJ+5Z8rgdqzvj6FRSes43z9k7Q09Nuksoq1KJjZmmxABf+UKfcN2sYoZ5aKNdnqbCkQw==@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypxmyXGK945ZK3AQFvrg2c01KPkBmHuGOIZNskzXbf6tIFesCW
 rUoZlYT9deqZNRRcIq4zGqk6+B14TuwiSiMOSDwhqMjEeb+JYRjuPgzC2y7CDbPKdbN+/LZonkz
 TaPUzIxH6S3D1iLcNXg==
X-Received: from ejjr7.prod.google.com ([2002:a17:906:7047:b0:b94:2c7d:9fe])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:c145:b0:b97:ca81:e89a with SMTP id
 a640c23a62f3a-b97f435a1afmr186730166b.0.1773825004253; 
 Wed, 18 Mar 2026 02:10:04 -0700 (PDT)
Date: Wed, 18 Mar 2026 09:10:03 +0000
In-Reply-To: <20260317201710.934932-2-joelagnelf@nvidia.com>
Mime-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com>
Message-ID: <abpr65jD6esHysWO@google.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list
 interface
From: Alice Ryhl <aliceryhl@google.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 "=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, 
 Nikola Djukic <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>, 
 "Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
 Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 "Thomas =?utf-8?Q?Hellstr=C3=B6m?=" <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, 
 John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Andy Ritger <aritger@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 alexeyi@nvidia.com, 
 Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
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

On Tue, Mar 17, 2026 at 04:17:10PM -0400, Joel Fernandes wrote:
> Add a new module `kernel::interop::list` for working with C's doubly
> circular linked lists. Provide low-level iteration over list nodes.
> 
> Typed iteration over actual items is provided with a `clist_create`
> macro to assist in creation of the `CList` type.
> 
> Cc: Nikola Djukic <ndjukic@nvidia.com>
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> Acked-by: Gary Guo <gary@garyguo.net>
> Acked-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>

I have a few nits below. But overall I think this looks ok:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

Please do consider my mod.rs suggestion too, though.

> +//! ```
> +//! use kernel::{
> +//!     bindings,
> +//!     clist_create,

IMO the automatic re-exports of macros at the root shouldn't be used.
Import it from kernel::interop::list::clist_create instead.

Note that you need to put a re-export below macro definition to do this.

	macro_rules! clist_create {
	    (unsafe { $head:ident, $rust_type:ty, $c_type:ty, $($field:tt).+ }) => {{
	        // Compile-time check that field path is a `list_head`.
	        // SAFETY: `p` is a valid pointer to `$c_type`.
	        let _: fn(*const $c_type) -> *const $crate::bindings::list_head =
	            |p| unsafe { &raw const (*p).$($field).+ };
	
	        // Calculate offset and create `CList`.
	        const OFFSET: usize = ::core::mem::offset_of!($c_type, $($field).+);
	        // SAFETY: The caller of this macro is responsible for ensuring safety.
	        unsafe { $crate::interop::list::CList::<$rust_type, OFFSET>::from_raw($head) }
	    }};
	}
	pub use clist_create; // <-- you need this

See tracepoint.rs or any of the other macros for an example.

> +//! // Create typed [`CList`] from sentinel head.
> +//! // SAFETY: `head` is valid and initialized, items are `SampleItemC` with
> +//! // embedded `link` field, and `Item` is `#[repr(transparent)]` over `SampleItemC`.
> +//! let list = clist_create!(unsafe { head, Item, SampleItemC, link });

Did you try using this in your real use-case? You require `head` to be
an :ident, but I think for any 'struct list_head' not stored on the
stack, accepting an :expr would be easier to use so that you can just
pass `&raw mut my_c_struct.the_list_head` directly to the macro. Right
now you have to put the raw pointer in a local variable first.

Alice
